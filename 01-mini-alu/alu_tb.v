`timescale 1ns / 1ps

module alu_tb;
    reg  [7:0] a;
    reg  [7:0] b;
    reg  [2:0] op;
    wire [7:0] result;
    wire zero;
    wire carry;
    wire overflow;

    alu dut (
        .a(a),.b(b),.op(op),
        .result(result),.zero(zero),.carry(carry),.overflow(overflow)
    );

    initial begin
        $dumpfile("alu_wave.vcd");
        $dumpvars(0, alu_tb);

        $display("Time | Op  |   A    |   B    | Result | Z C O | Case Description");
        $monitor("%4t | %b | %3d (0x%h)      | %3d (0x%h)      | %3d (0x%h)      | %b %b %b |", 
                 $time, op, a, a, b, b, result, result, zero, carry, overflow);
        a = 8'd15;  b = 8'd10;  op = 3'b000;
        #10;
        a = 8'd0;   b = 8'd0;   op = 3'b000; 
        #10;
        a = 8'd200; b = 8'd100; op = 3'b000; 
        #10;
        a = 8'd100; b = 8'd50;  op = 3'b000; 
        #10;
        a = -8'd100; b = -8'd50; op = 3'b000; 
        #10;
        a = 8'd255; b = 8'd1;   op = 3'b000; 
        #10;

        //Subtraction Test Cases
        a = 8'd50;  b = 8'd20;  op = 3'b001; 
        #10;
        a = 8'd42;  b = 8'd42;  op = 3'b001; 
        #10;
        a = 8'd10;  b = 8'd20;  op = 3'b001; 
        #10;
        a = 8'd100; b = -8'd50; op = 3'b001; 
        #10;
        a = -8'd100; b = 8'd50; op = 3'b001; 
        #10;

        //Bitwise Operations Test Cases
        a = 8'hAA;  b = 8'h55;  op = 3'b010; 
        #10;
        a = 8'hF0;  b = 8'h3C;  op = 3'b010; 
        #10;
        a = 8'hF0;  b = 8'h0F;  op = 3'b011; 
        #10;
        a = 8'hFF;  b = 8'hFF;  op = 3'b100; 
        #10;
        a = 8'hAA;  b = 8'h55;  op = 3'b100; 
        #10;
        a = 8'hFF;  b = 8'hFF;  op = 3'b101; 
        #10;

        op = 3'b110; #10;
        op = 3'b111; #10;

        $finish;
    end
endmodule
