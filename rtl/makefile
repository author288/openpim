
default:
	verilator -cc -trace --timing Tile_tb.v -exe sim_main.cpp
	cd ./obj_dir
	make -f Vcounter_tb.mk
	./Vcounter_tb
	gtkwave wave.vcd

compile: 
	verilator -cc -trace --timing Tile_tb.v -exe sim_main.cpp
build:
	cd ./obj_dir
	make -f VTile_tb.mk

run:
	./VTile_tb

plot:
	gtkwave wave.vcd