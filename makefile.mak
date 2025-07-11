# Makefile for running DPI example with ModelSim/Questa

# File names
SV_FILE = tb_top.sv
C_FILE = c_add.c
LIB_NAME = c_add

# Compiler and flags
CC = gcc
CFLAGS = -fPIC -shared -I/cadtools/questasim/include
DPI_LIB = $(LIB_NAME).so

# Simulation tools
VLOG = vlog
VSIM = vsim
TOP = tb_top

# Targets
all: compile_sv compile_c run

compile_sv:
	$(VLOG) -sv $(SV_FILE) -dpiheader dpi.h

compile_c:
	$(CC) $(CFLAGS) -o $(DPI_LIB) $(C_FILE)

run:
	$(VSIM) -c -sv_lib ./$(LIB_NAME) $(TOP) -do "run -all; quit"

clean:
	rm -f *.o *.so *.dll transcript vsim.wlf work/*.vhdl work/*.sv dpi.h
