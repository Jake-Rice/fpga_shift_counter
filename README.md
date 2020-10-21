# fpga_shift_counter
Simple FPGA design in Verilog for the Digilent Cmod A7 that drives LEDs in a binary counting pattern using an external 74HC595 shift register.

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)

## General info
This project is designed to count from 0 to 255, and display the current number in binary using 8 LEDs.
	
## Technologies
Project is created with:
* Verilog
* Xilinx Vivado
* Digilent Cmod A7 - a Xilinx Artix 7 FPGA development board
	
## Setup
To run this project, download the project files to your computer. Then, start a new project in Xilinx Vivado. Import shift_counter.v as a Design Source, shift_counter_tb.v as a Simulation Source, and CMOD-A7-Master.xdc as your constraints file. If you are using a different FPGA you will need to change the constraints file to match the output pins on your FPGA.

To set up the LED circuit you will need:
* The FPGA
* A breadboard
* A 74HC595 shift register IC (to drive the LEDs)
* 8 LEDs (I used blue ones)
* 8 current limiting resistors for the LEDs (I used 100-ohms, other color LEDs may require a higher value)
* A 10k-ohm resistor and a 10uF capacitor (to pull the shift register output enable pin high/off during FPGA power-up)

Here is an image of the assembled breadboard circuit:

![assembled breadboard LED circuit](https://github.com/Jake-Rice/shift_counter/blob/main/shift_counter%20breadboard.png)
