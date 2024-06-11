#!/bin/bash -i
MATLABDIR=~/rfdev/matlab-rfnoc/

echo '#
# added by matlab-rfnoc, see github.com/rebelorange/matlab-rfnoc.git
#
MATLAB_RFNOC_SRCS_V := $(shell find '$MATLABDIR' -name "*.v*")
MATLAB_RFNOC_SRCS_SV := $(shell find '$MATLABDIR' -name "*.v*")
SIM_DESIGN_SRCS += $(MATLAB_RFNOC_SRCS_V)
SIM_DESIGN_SRCS += $(MATLAB_RFNOC_SRCS_SV)
# endadd' >> $UHD_FPGA_DIR/usrp3/lib/sim/Makefile.srcs
