
�
�The XPM instance: <%s> is part of IP: <%s>. This XPM instance will be excluded from the .mmi because updatemem is prohibited from making changes to an XPM that is part of an IP.
136*memdata2�
pmb_design_i/axis_data_fifo_0/inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst2default:default20
mb_design_i/axis_data_fifo_02default:defaultZ28-208h px� 
�
�Found XPM memory block %s with a %s property set to %s. A value of %s is required. You will not be able to use the updatemem program to update the bitstream with new data for the %s block.
119*memdata2�
�mb_design_i/axi_dma_0/U0/I_PRMRY_DATAMOVER/GEN_S2MM_FULL.I_S2MM_FULL_WRAPPER/GEN_ENABLE_INDET_BTT_SF.I_INDET_BTT/I_XD_FIFO/NON_BLK_MEM.I_SYNC_FIFOGEN_FIFO/xpm_fifo_instance.xpm_fifo_sync_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst2default:default2&
P_MEMORY_PRIMITIVE2default:default2
auto2default:default2
block2default:default2�
�mb_design_i/axi_dma_0/U0/I_PRMRY_DATAMOVER/GEN_S2MM_FULL.I_S2MM_FULL_WRAPPER/GEN_ENABLE_INDET_BTT_SF.I_INDET_BTT/I_XD_FIFO/NON_BLK_MEM.I_SYNC_FIFOGEN_FIFO/xpm_fifo_instance.xpm_fifo_sync_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst2default:defaultZ28-167h px� 
�
�The XPM instance: <%s> is part of IP: <%s>. This XPM instance will be excluded from the .mmi because updatemem is prohibited from making changes to an XPM that is part of an IP.
136*memdata2�
�mb_design_i/axi_dma_0/U0/I_PRMRY_DATAMOVER/GEN_S2MM_FULL.I_S2MM_FULL_WRAPPER/GEN_ENABLE_INDET_BTT_SF.I_INDET_BTT/I_DATA_FIFO/BLK_MEM.I_SYNC_FIFOGEN_FIFO/xpm_fifo_instance.xpm_fifo_sync_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst2default:default2)
mb_design_i/axi_dma_02default:defaultZ28-208h px� 
�
�The XPM instance: <%s> is part of IP: <%s>. This XPM instance will be excluded from the .mmi because updatemem is prohibited from making changes to an XPM that is part of an IP.
136*memdata2�
�mb_design_i/axi_dma_0/U0/I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/GEN_INCLUDE_MM2S_SF.I_RD_SF/I_DATA_FIFO/BLK_MEM.I_SYNC_FIFOGEN_FIFO/xpm_fifo_instance.xpm_fifo_sync_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst2default:default2)
mb_design_i/axi_dma_02default:defaultZ28-208h px� 
q
Command: %s
53*	vivadotcl2@
,write_bitstream -force mb_design_wrapper.bit2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px� 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
�Missing CFGBVS and CONFIG_VOLTAGE Design Properties: Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.%s*DRC2(
 DRC|Pin Planning2default:default8ZCFGBVS-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2�
 "�
�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/A[29:0]�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2�
 "�
�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/B[17:0]�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I2/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/B2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2�
 "�
�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/A[29:0]�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2�
 "�
�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/B[17:0]�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/B2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�

�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I3/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I3/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2�
 "�
�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I3/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/P[47:0]�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.No_MUL64.dsp_module_I3/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-1h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2�
 "�
�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1	�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I12default:default2default:default2�
 "�
�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/P[47:0]�mb_design_i/microblaze_0/U0/MicroBlaze_Core_I/Performance.Core/Data_Flow_I/MUL_Unit_I/Use_HW_MUL.Using_DSP48_Architectures.dsp_module_I1/Using_DSP48E1.DSP48E1_I1/Using_FPGA.DSP48E1_I1/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px� 
�

�writefirst: Synchronous clocking is detected for BRAM (%s) in SDP mode with WRITE_FIRST write-mode. This is the preferred mode for best power characteristics, however it may exhibit address collisions if the same address appears on both read and write ports resulting in unknown or corrupted read data. It is suggested to confirm via simulation that an address collision never occurs and if so it is suggested to try and avoid this situation. If address collisions cannot be avoided, the write-mode may be set to READ_FIRST which guarantees that the read data is the prior contents of the memory at the cost of additional power in the design. See the FPGA Memory Resources User Guide for additional information.%s*DRC2�
 "�
�mb_design_i/axi_dma_0/U0/I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/GEN_INCLUDE_MM2S_SF.I_RD_SF/I_DATA_FIFO/BLK_MEM.I_SYNC_FIFOGEN_FIFO/xpm_fifo_instance.xpm_fifo_sync_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	�mb_design_i/axi_dma_0/U0/I_PRMRY_DATAMOVER/GEN_MM2S_FULL.I_MM2S_FULL_WRAPPER/GEN_INCLUDE_MM2S_SF.I_RD_SF/I_DATA_FIFO/BLK_MEM.I_SYNC_FIFOGEN_FIFO/xpm_fifo_instance.xpm_fifo_sync_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8ZREQP-181h px� 
�
�writefirst: Synchronous clocking is detected for BRAM (%s) in SDP mode with WRITE_FIRST write-mode. This is the preferred mode for best power characteristics, however it may exhibit address collisions if the same address appears on both read and write ports resulting in unknown or corrupted read data. It is suggested to confirm via simulation that an address collision never occurs and if so it is suggested to try and avoid this situation. If address collisions cannot be avoided, the write-mode may be set to READ_FIRST which guarantees that the read data is the prior contents of the memory at the cost of additional power in the design. See the FPGA Memory Resources User Guide for additional information.%s*DRC2�
 "�
�mb_design_i/axi_dma_0/U0/I_PRMRY_DATAMOVER/GEN_S2MM_FULL.I_S2MM_FULL_WRAPPER/GEN_ENABLE_INDET_BTT_SF.I_INDET_BTT/I_DATA_FIFO/BLK_MEM.I_SYNC_FIFOGEN_FIFO/xpm_fifo_instance.xpm_fifo_sync_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg	�mb_design_i/axi_dma_0/U0/I_PRMRY_DATAMOVER/GEN_S2MM_FULL.I_S2MM_FULL_WRAPPER/GEN_ENABLE_INDET_BTT_SF.I_INDET_BTT/I_DATA_FIFO/BLK_MEM.I_SYNC_FIFOGEN_FIFO/xpm_fifo_instance.xpm_fifo_sync_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8ZREQP-181h px� 
t
DRC finished with %s
1905*	planAhead26
"0 Errors, 7 Warnings, 2 Advisories2default:defaultZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
h
Writing bitstream %s...
11*	bitstream2+
./mb_design_wrapper.bit2default:defaultZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
�
�WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
120*projectZ1-120h px� 
�
�'%s' has been successfully sent to Xilinx on %s. For additional details about this file, please refer to the Webtalk help file at %s.
186*common2_
KC:/CR/projects/TP8/DMADemo/DMADemo.runs/impl_1/usage_statistics_webtalk.xml2default:default2,
Sat May 30 01:48:47 20202default:default2I
5C:/Xilinx/Vivado/2019.2/doc/webtalk_introduction.html2default:defaultZ17-186h px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1692default:default2
252default:default2
02default:default2
02default:defaultZ4-41h px� 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:242default:default2
00:00:212default:default2
2571.8632default:default2
432.2732default:defaultZ17-268h px� 


End Record