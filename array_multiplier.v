`timescale 1ns / 1ps

module array_multiplier(
    input [3:0] a,
    input [3:0] b,
    output [7:0] p
    );
    
    wire [14:0] z;
    wire [10:0] c;
    wire [5:0] s;
    
    and_gate a1 (.A(a[0]), .B(b[0]), .Y(p[0])); //p0
    
    and_gate a2 (.A(a[0]), .B(b[1]), .Y(z[0]));
    and_gate a3 (.A(a[1]), .B(b[0]), .Y(z[1]));
    and_gate a4 (.A(a[0]), .B(b[2]), .Y(z[2]));
    and_gate a5 (.A(a[1]), .B(b[1]), .Y(z[3]));
    and_gate a6 (.A(a[2]), .B(b[0]), .Y(z[4]));
    and_gate a7 (.A(a[0]), .B(b[3]), .Y(z[5]));
    and_gate a8 (.A(a[1]), .B(b[2]), .Y(z[6]));
    and_gate a9 (.A(a[2]), .B(b[1]), .Y(z[7]));
    and_gate a10 (.A(a[3]), .B(b[0]), .Y(z[8]));
    and_gate a11 (.A(a[1]), .B(b[3]), .Y(z[9]));
    and_gate a12 (.A(a[2]), .B(b[2]), .Y(z[10]));
    and_gate a13 (.A(a[3]), .B(b[1]), .Y(z[11]));
    and_gate a14 (.A(a[2]), .B(b[3]), .Y(z[12]));
    and_gate a15 (.A(a[3]), .B(b[2]), .Y(z[13]));
    and_gate a16 (.A(a[3]), .B(b[3]), .Y(z[14]));
    
    half_adder h1 (.A(z[0]), .B(z[1]), .sum(p[1]), .carry(c[0])); //p1
    
    full_adder f1 (.A(z[3]), .B(z[4]), .cin(c[0]), .sum(s[0]), .cout(c[1]));
    half_adder h2 (.A(z[2]), .B(s[0]), .sum(p[2]), .carry(c[2])); //p2
    
    full_adder f2 (.A(z[7]), .B(z[8]), .cin(c[1]), .sum(s[1]), .cout(c[3]));
    full_adder f3 (.A(z[6]), .B(s[1]), .cin(c[2]), .sum(s[2]), .cout(c[4]));
    half_adder h3 (.A(z[5]), .B(s[2]), .sum(p[3]), .carry(c[5])); //p3
    
    full_adder f4 (.A(z[11]), .B(c[3]), .cin(c[4]), .sum(s[3]), .cout(c[6]));
    full_adder f5 (.A(z[10]), .B(s[3]), .cin(c[5]), .sum(s[4]), .cout(c[7]));
    half_adder h4 (.A(z[9]), .B(s[4]), .sum(p[4]), .carry(c[8])); //p4
    
    full_adder f6 (.A(z[13]), .B(c[6]), .cin(c[7]), .sum(s[5]), .cout(c[9]));
    full_adder f7 (.A(z[12]), .B(s[5]), .cin(c[8]), .sum(p[5]), .cout(c[10])); //p5
    
    full_adder f8 (.A(z[14]), .B(c[9]), .cin(c[10]), .sum(p[6]), .cout(p[7])); //p6
  
endmodule
