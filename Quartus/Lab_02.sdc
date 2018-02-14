## Generated SDC file "Lab_02.sdc"

## Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus Prime License Agreement,
## the Altera MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Altera and sold by Altera or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 16.0.0 Build 211 04/27/2016 SJ Lite Edition"

## DATE    "Tue Jan 31 09:47:30 2017"

##
## DEVICE  "5CGXFC7C7F23C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -period "50.0 MHz" [get_ports CLK]


#**************************************************************
# Create Generated Clock
#**************************************************************

derive_pll_clocks

#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty

#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -clock { CLK } 0 [get_ports {A[0] A[1] A[2] A[3] A[4] A[5] A[6] A[7] B[0] B[1] B[2] B[3] B[4] B[5] B[6] B[7] CLK S[0] S[1] S[2] S[3] S[4] S[5] S[6] S[7] Sub cOut}]

#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -clock { CLK } 0 [get_ports {A[0] A[1] A[2] A[3] A[4] A[5] A[6] A[7] B[0] B[1] B[2] B[3] B[4] B[5] B[6] B[7] CLK S[0] S[1] S[2] S[3] S[4] S[5] S[6] S[7] Sub cOut}]

#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

