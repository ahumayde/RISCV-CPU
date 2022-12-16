#!/bin/sh

# Arguments
Dir="$1"

# run Verilator to translate Verilog into C++, including C++ testbench
verilator -Irtl/$Dir -Wall --cc --prof-cfuncs -CFLAGS -DVL_DEBUG --trace cpu.sv --exe cpu_tb.cpp

# build C++ project via make automatically generated by Verilator
make -j -C obj_dir/ -f Vcpu.mk Vcpu

# run executable simulation file#
echo "\nRunning simulation"
obj_dir/Vcpu
echo "\nSimulation completed"