`timescale 1ns / 1ps

//Displays a sequence of binary digits on 8 leds driven by 74HC595 shift register

module shift_counter(
    input i_clk, //12MHz
    output o_clk,
    output o_latch,
    output o_data,
    output o_oe_
    );
    
    parameter update_ms = 200; //time in milliseconds between led changes (1 - 1,398)
    parameter ms_cycles = 12000; // Simulation: 1 -- Hardware: 12000
    parameter update_time = update_ms*ms_cycles;
    
    reg [23:0] update_counter = 0;
    reg [7:0] led_counter = 0;
    
    reg clk = 0;
    reg latch = 0;
    reg data = 0;
    reg oe_ = 1;
    reg data_step = 0; // 0: set shift data // 1: trigger shift clock
    reg [4:0] data_count = 0; //points to next position in counter register
    
    always @(posedge i_clk)
    begin
        update_counter <= update_counter+1;
        
        if (update_counter==0) latch <= 0;
        else if (update_counter==update_time-1) begin
            latch <= 1;            
        end
        else if (update_counter==update_time) begin
            led_counter <= led_counter + 1;
            latch <= 0;
            oe_ <= 0;
            data_count <= 0;
            update_counter <= 0;
        end
        else if (data_count<8) begin
            if (~data_step) begin
                data <= led_counter[data_count];
                clk <= 0;
            end
            else begin
                clk <= 1;
                data_count <= data_count + 1;
            end 
            data_step <= ~data_step;
        end
        else if (data_count==8) clk <= 0;
    end
    
    assign o_clk = clk;
    assign o_latch = latch;
    assign o_data = data;
    assign o_oe_ = oe_;
endmodule