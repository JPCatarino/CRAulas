/*
    Copyright (C) 2017 Amazon.com, Inc. or its affiliates.  All Rights Reserved.
    Copyright (C) 2012 - 2018 Xilinx, Inc. All Rights Reserved.

    Permission is hereby granted, free of charge, to any person obtaining a copy of
    this software and associated documentation files (the "Software"), to deal in
    the Software without restriction, including without limitation the rights to
    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
    the Software, and to permit persons to whom the Software is furnished to do so,
    subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software. If you wish to use our Amazon
    FreeRTOS name, please do so in a fair use way that does not cause confusion.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

    http://www.FreeRTOS.org
    http://aws.amazon.com/freertos


    1 tab == 4 spaces!
*/

#include <stdio.h>
/* FreeRTOS includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
/* Xilinx includes. */
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio_l.h"

/************************** Constant Definitions *****************************/

#define SW_TIMER_ID			1

// Complete these constants
#define SW_TIMER_MILISECS_VAL 125UL
// Requires configTICK_RATE_HZ to be set at least to ??? (??? ms FreeRTOS tick),
// in the file "mb_design_wrapper\microblaze_0\freertos10_xilinx_domain\bsp\
//				microblaze_0\libsrc\freertos10_xilinx_v1_4\src\FreeRTOSConfig.h"

// Display Port Register Offsets
#define DISPLAY_PORT_ENABLE_OFFSET	XGPIO_DATA_OFFSET + 0
#define DISPLAY_PORT_DATA_OFFSET	XGPIO_DATA_OFFSET + 4
#define DISPLAY_PORT_CONFIG_OFFSET	XGPIO_DATA_OFFSET + 8

// Display refresh rate constants
#define DISPLAY_REFRESH_RATE_NUM_BITS 3
#define DISPLAY_REFRESH_RATE_MAX_VAL  0x07
#define DISPLAY_REFRESH_RATE_MASK	  0x07

// Display brightness level constants
#define DISPLAY_BRIGHTNESS_LEVEL_NUM_BITS 3
#define DISPLAY_BRIGHTNESS_LEVEL_MAX_VAL  0x07
#define DISPLAY_BRIGHTNESS_LEVEL_MASK     0x38

/******************************** Data types *********************************/

// Boolean data type (not defined in standard C)
typedef int bool;

// State machine data type
typedef enum {Stopped, Started, SetLSSec, SetMSSec, SetLSMin, SetMSMin} TFSMState;

// Buttons GPIO masks
#define BUTTON_UP_MASK		0x01
#define BUTTON_LEFT_MASK	0x02
#define BUTTON_DOWN_MASK	0x04
#define BUTTON_RIGHT_MASK	0x08
#define BUTTON_CENTER_MASK	0x10

// Data structure to store buttons status
typedef struct SButtonStatus
{
	bool upPressed;
	bool downPressed;
	bool setPressed;
	bool startPressed;
	bool brightPressed;

	bool setPrevious;
	bool startPrevious;
	bool brightPrevious;
} TButtonStatus;

// Data structure to store countdown timer value
typedef struct STimerValue
{
	unsigned int minMSValue;
	unsigned int minLSValue;
	unsigned int secMSValue;
	unsigned int secLSValue;
} TTimerValue;

/********************** Global variables (module scope) **********************/

static TTimerValue		timerValue	= {5, 9, 5, 9};
static bool				zeroFlag	= FALSE;

/***************************** Helper functions ******************************/

// 7 segment decoder
unsigned char Bin2Hex(int value)
{
	static const char bin2HexLUT[] = {0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78,
									  0x00, 0x10, 0x08, 0x03, 0x46, 0x21, 0x06, 0x0E};
	return bin2HexLUT[value];
}

// Rising edge detection and clear
bool DetectAndClearRisingEdge(bool* pOldValue, bool newValue)
{
	bool retValue;

	retValue = (!(*pOldValue)) && newValue;
	*pOldValue = newValue;
	return retValue;
}

// Modular increment
bool ModularInc(unsigned int* pValue, unsigned int modulo)
{
	if (*pValue < modulo - 1)
	{
		(*pValue)++;
		return FALSE;
	}
	else
	{
		*pValue = 0;
		return TRUE;
	}
}

// Modular decrement
bool ModularDec(unsigned int* pValue, unsigned int modulo)
{
	if (*pValue > 0)
	{
		(*pValue)--;
		return FALSE;
	}
	else
	{
		*pValue = modulo - 1;
		return TRUE;
	}
}

// Tests if all timer digits are zero
bool IsTimerValueZero(const TTimerValue* pTimerValue)
{
	return ((pTimerValue->secLSValue == 0) && (pTimerValue->secMSValue == 0) &&
			(pTimerValue->minLSValue == 0) && (pTimerValue->minMSValue == 0));
}

// Conversion of the countdown timer values stored in a structure to an array of digits
void TimerValue2DigitValues(const TTimerValue* pTimerValue, unsigned int digitValues[8])
{
	digitValues[0] = 0;
	digitValues[1] = 0;
	digitValues[2] = pTimerValue->secLSValue;
	digitValues[3] = pTimerValue->secMSValue;
	digitValues[4] = pTimerValue->minLSValue;
	digitValues[5] = pTimerValue->minMSValue;
	digitValues[6] = 0;
	digitValues[7] = 0;
}

/******************* Countdown timer operations functions ********************/

void ConfigDisplayRefreshRate(unsigned char refreshRate)
{
	unsigned int displayCtrlReg = XGpio_ReadReg(XPAR_DISPLAYDRIVERPERIPHE_0_S00_AXI_BASEADDR,
												DISPLAY_PORT_CONFIG_OFFSET);

	displayCtrlReg &= ~(DISPLAY_REFRESH_RATE_MASK);
	displayCtrlReg |= (refreshRate & DISPLAY_REFRESH_RATE_MAX_VAL);
	XGpio_WriteReg(XPAR_DISPLAYDRIVERPERIPHE_0_S00_AXI_BASEADDR,
				   DISPLAY_PORT_CONFIG_OFFSET,
				   displayCtrlReg);
}

void ConfigDisplayBrightness(unsigned char brightnessLevel)
{
	unsigned int displayCtrlReg = XGpio_ReadReg(XPAR_DISPLAYDRIVERPERIPHE_0_S00_AXI_BASEADDR,
														DISPLAY_PORT_CONFIG_OFFSET);

		displayCtrlReg &= ~(DISPLAY_BRIGHTNESS_LEVEL_MASK);
		displayCtrlReg |= (brightnessLevel & DISPLAY_BRIGHTNESS_LEVEL_MAX_VAL) << DISPLAY_REFRESH_RATE_NUM_BITS;

		XGpio_WriteReg(XPAR_DISPLAYDRIVERPERIPHE_0_S00_AXI_BASEADDR,
					   DISPLAY_PORT_CONFIG_OFFSET,
					   displayCtrlReg);

}

void RefreshDisplays(unsigned char digitEnables, const unsigned int digitValues[8],
					 unsigned char decPtEnables)
{
	unsigned int digitValsPacked = 0x00000000;

	for (int i = 7; i >= 0; i--)
	{
		digitValsPacked = (digitValsPacked << 4) | (digitValues[i] & 0xF);
	}

	XGpio_WriteReg(XPAR_DISPLAYDRIVERPERIPHE_0_S00_AXI_BASEADDR,
				   DISPLAY_PORT_ENABLE_OFFSET,
				   (decPtEnables << 8) | digitEnables);
	XGpio_WriteReg(XPAR_DISPLAYDRIVERPERIPHE_0_S00_AXI_BASEADDR,
				   DISPLAY_PORT_DATA_OFFSET,
				   digitValsPacked);
}

void ReadButtons(TButtonStatus* pButtonStatus)
{
	unsigned int buttonsPattern;

	buttonsPattern = XGpio_ReadReg(XPAR_AXI_GPIO_BUTTONS_BASEADDR, XGPIO_DATA_OFFSET);

	pButtonStatus->upPressed     = buttonsPattern & BUTTON_UP_MASK;
	pButtonStatus->downPressed   = buttonsPattern & BUTTON_DOWN_MASK;
	pButtonStatus->setPressed    = buttonsPattern & BUTTON_CENTER_MASK;
	pButtonStatus->startPressed  = buttonsPattern & BUTTON_RIGHT_MASK;
	pButtonStatus->brightPressed = buttonsPattern & BUTTON_LEFT_MASK;
}

void UpdateStateMachine(TFSMState* pFSMState, TButtonStatus* pButtonStatus,
						bool zeroFlag, unsigned char* pSetFlags)
{
	switch (*pFSMState) {
	case Stopped:
		*pSetFlags = 0x0;
		if (!zeroFlag && pButtonStatus->startPressed)
			*pFSMState = Started;
		else if (pButtonStatus->setPressed)
			*pFSMState = SetLSSec;
		break;
	case Started:
		*pSetFlags = 0x0;
		if (zeroFlag || pButtonStatus->startPressed)
			*pFSMState = Stopped;
		break;
	case SetLSSec:
		*pSetFlags = 0x1;
		if (pButtonStatus->setPressed)
			*pFSMState = SetMSSec;
		break;
	case SetMSSec:
		*pSetFlags = 0x2;
		if (pButtonStatus->setPressed)
			*pFSMState = SetLSMin;
		break;
	case SetLSMin:
		*pSetFlags = 0x4;
		if (pButtonStatus->setPressed)
			*pFSMState = SetMSMin;
		break;
	case SetMSMin:
		*pSetFlags = 0x8;
		if (pButtonStatus->setPressed)
			*pFSMState = Stopped;
		break;
	default:
		*pSetFlags = 0x0;
		print("Something wrong append");
	}

}

void ModularIncDec(unsigned int* pTimerValue, const TButtonStatus* pButtonStatus, unsigned int modulo)
{
	if (pButtonStatus->upPressed)
		ModularInc(pTimerValue, modulo + 1);
	else if ((pButtonStatus->downPressed))
		ModularDec(pTimerValue, modulo + 1);
}

void SetCountDownTimer(TFSMState fsmState, const TButtonStatus* pButtonStatus,
					   TTimerValue* pTimerValue)
{
	if (fsmState == SetLSSec)
		ModularIncDec(&pTimerValue->secLSValue, pButtonStatus, 9);
	else if (fsmState == SetMSSec)
		ModularIncDec(&pTimerValue->secMSValue, pButtonStatus, 5);
	else if (fsmState == SetLSMin)
		ModularIncDec(&pTimerValue->minLSValue, pButtonStatus, 9);
	else if (fsmState == SetMSMin)
		ModularIncDec(&pTimerValue->minMSValue, pButtonStatus, 5);
}

void DecCountDownTimer(TFSMState fsmState, TTimerValue* pTimerValue)
{
	if (fsmState == Started) {
		if (ModularDec(&pTimerValue->secLSValue, 9 + 1)) {
			if (ModularDec(&pTimerValue->secMSValue, 5 + 1)) {
				if (ModularDec(&pTimerValue->minLSValue, 9 + 1)) {
					ModularDec(&pTimerValue->minMSValue, 5 + 1);
				}
			}
		}
	}
}

static void SwTimerCallback(TimerHandle_t phTimer)
{
	// Timer event software counter
	static unsigned swTmrEventCount = 0;
	swTmrEventCount++;

    // Countdown timer status variables (static variables)
    static TFSMState     fsmState       = Stopped;
    static unsigned char setFlags       = 0x0;
    static TButtonStatus buttonStatus   = {FALSE, FALSE, FALSE, FALSE, FALSE, FALSE};
    static unsigned char digitEnables   = 0x3C;
    static unsigned int  digitValues[8] = {0, 0, 9, 5, 9, 5, 0, 0};
    static unsigned char decPtEnables   = 0x00;
    static unsigned char dispBrightness = DISPLAY_BRIGHTNESS_LEVEL_MAX_VAL / 2;

    static bool          blink1HzStat   = FALSE;
    static bool          blink2HzStat   = FALSE;

	if (swTmrEventCount % (125 / SW_TIMER_MILISECS_VAL)  == 0) // 8Hz = 1/125 msecs
	{
		// Put here operations that must be performed at 8Hz rate
		// Read push buttons
		ReadButtons(&buttonStatus);

		// Update state machine
		UpdateStateMachine(&fsmState, &buttonStatus, zeroFlag, &setFlags);
		if ((setFlags == 0x0) || (blink2HzStat))
		{
			digitEnables = 0x3C; 						// All digits active
		}
		else
		{
			digitEnables = (~(setFlags << 2)) & 0x3C; 	// Setting digit inactive
		}

		if (DetectAndClearRisingEdge(&(buttonStatus.brightPrevious), buttonStatus.brightPressed))
		{
			dispBrightness = dispBrightness + 1;
			if (dispBrightness > 7) {
				dispBrightness = 0;
			}
		}
	}

	if (swTmrEventCount % (250 / SW_TIMER_MILISECS_VAL) == 0) // 4Hz = 1/250 msecs
	{
		// Put here operations that must be performed at 4Hz rate
		// Switch digit set 2Hz blink status
		blink2HzStat = !blink2HzStat;
	}

	if (swTmrEventCount % (500 / SW_TIMER_MILISECS_VAL) == 0) // 2Hz = 1/500 msecs
	{
		// Put here operations that must be performed at 2Hz rate
		// Switch point 1Hz blink status
		blink1HzStat = !blink1HzStat;
		decPtEnables = (blink1HzStat ? 0x10 : 0x00);

		// Adjust display brightness
		ConfigDisplayBrightness(dispBrightness);

		// Digit set increment/decrement
		SetCountDownTimer(fsmState, &buttonStatus, &timerValue);
	}

	if (swTmrEventCount == (1000 / SW_TIMER_MILISECS_VAL)) // 1Hz = 1/1000 msecs
	{
		// Put here operations that must be performed at 1Hz rate
		// Count down timer normal operation
		DecCountDownTimer(fsmState, &timerValue);

		// Reset hwTmrEventCount every second
		swTmrEventCount = 1;
	}

	zeroFlag = IsTimerValueZero(&timerValue);
	TimerValue2DigitValues(&timerValue, digitValues);

	// Refresh displays
	RefreshDisplays(digitEnables, digitValues, decPtEnables);
}

static void IdleTask(void *pTaskParams)
{
	while(1)
	{
		// Put here operations that are performed whenever possible
		xil_printf("\r%d%d:%d%d", timerValue.minMSValue, timerValue.minLSValue,
								  timerValue.secMSValue, timerValue.secLSValue);
		XGpio_WriteReg(XPAR_AXI_GPIO_LEDS_BASEADDR, XGPIO_DATA_OFFSET,
					   zeroFlag ? 0x0001 : 0x0000);
	}
}

/******************************* Main function *******************************/

int main( void )
{
	TaskHandle_t  hIdleTask;
	TimerHandle_t hTimer;

	xil_printf("\n\n\rCount down timer - FreeRTOS based version.\n\rConfiguring...");

	timerValue.minMSValue = 5;
	timerValue.minLSValue = 9;
	timerValue.secMSValue = 5;
	timerValue.secLSValue = 9;

	zeroFlag = FALSE;

	//	GPIO tri-state configuration
	//	Inputs
	XGpio_WriteReg(XPAR_AXI_GPIO_SWITCHES_BASEADDR, XGPIO_TRI_OFFSET, 0xFFFFFFFF);
	XGpio_WriteReg(XPAR_AXI_GPIO_BUTTONS_BASEADDR,  XGPIO_TRI_OFFSET, 0xFFFFFFFF);

	//	Outputs
	XGpio_WriteReg(XPAR_AXI_GPIO_LEDS_BASEADDR,     XGPIO_TRI_OFFSET, 0xFFFF0000);

	xil_printf("\n\rIOs configured.");

	xTaskCreate(IdleTask, (const char*)"Idle", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, &hIdleTask);
	configASSERT(hIdleTask);

	xil_printf("\n\rIdle task created.");

	const TickType_t timerTicks = pdMS_TO_TICKS(SW_TIMER_MILISECS_VAL);
	hTimer = xTimerCreate("hTimer", timerTicks, pdTRUE, (void*) SW_TIMER_ID, SwTimerCallback);
	configASSERT(hTimer);
	xTimerStart(hTimer,  pdMS_TO_TICKS(0));

	xil_printf("\n\rTimer created.");

	// Configure display refresh rate
	ConfigDisplayRefreshRate(XGpio_ReadReg(XPAR_AXI_GPIO_SWITCHES_BASEADDR,
										   XGPIO_DATA_OFFSET));

	// Configure display brightness level
	ConfigDisplayBrightness(DISPLAY_BRIGHTNESS_LEVEL_MAX_VAL / 2);

	xil_printf("\n\rSystem running.\n\r");

	// Start the task scheduler (tasks and timer callback running)
	vTaskStartScheduler();

	while (1)
	{
	}
}
