`timescale 1ns / 1ps

module LT_testbench;

// Inputs
reg [19:0] register_A;
reg [19:0] register_B;
// Outputs
wire sign_flag;

LT uut (
    .register_A(register_A),
    .register_B(register_B),
    .sign_flag(sign_flag)
);

initial begin
    $dumpfile("LT_testbench.vcd");
    $dumpvars(0, LT_testbench);
    // choosing inputs
    register_A = 20'hABCDE;
    register_B = 20'h54321;
    #10;
    $display("Time %0t: Initial value of register A = %h", $time, register_A);
    $display("Time %0t: Initial value of register B = %h", $time, register_B);
    #100;
    $display("Time %0t: Sign flag after comparison = %b", $time, sign_flag);

    //changing flag to 1 here (is less than)
    register_A = 20'h54321;
    register_B = 20'hABCDE;
    #10;
    $display("Time %0t: Initial value of register A = %h", $time, register_A);
    $display("Time %0t: Initial value of register B = %h", $time, register_B);
    #100;
    $display("Time %0t: Sign flag after comparison = %b", $time, sign_flag);
    $finish;
end

endmodule