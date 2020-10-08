`timescale 1ns / 1ps

module shift_counter_tb;
    reg clk;
    wire shift, latch, data;
    
    shift_counter UUT (
        .i_clk(clk),
        .o_clk(shift),
        .o_latch(latch),
        .o_data(data),
        .o_oe_(oe_)
    );
    initial clk=0;
    always #1 clk=~clk;
    
endmodule
