`timescale 1ns/1ns
`include "Activation_SRAM.v"
`include "CHAS_execution_unit.v"
`include "Core.v"
`include "Core_control_unit.v"
`include "Core_instruction_memory.v"
`include "Instruction_generation_unit.v"
`include "MVMU.v"
`include "Memory_unit.v"
`include "Result_SRAM.v"
`include "SFU.v"
`include "Tile.v"
`include "Tile_control_unit.v"
`include "Tile_instruction_memory.v"
`include "Weight_SRAM.v"
module Tile_tb; 
reg        clk;
reg        RSTn; 
reg [31:0] rmc_of_each_macro;

Tile Tile(
    .clk                      (clk), 
    .RSTn                     (RSTn),
    .rmc_of_each_macro        (rmc_of_each_macro)
);

initial begin
    clk  = 0;
    RSTn = 1;
    rmc_of_each_macro = 8*512;
end

initial begin
    forever #10 clk = ~clk;
end

initial begin
    #48000000 $finish;
end

endmodule

// iverilog -o "Tile_tb.vvp" Tile_tb.v Tile.v Instruction_generation_unit.v Tile_instruction_memory.v Tile_control_unit.v Weight_SRAM.v Activation_SRAM.v Result_SRAM.v SFU.v Core.v Core_instruction_memory.v CHAS_execution_unit.v Core_control_unit.v Memory_unit.v MVMU.v
// vvp Tile_tb.vvp
// gtkwave Tile_tb.vcd