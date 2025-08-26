`timescale 1ns / 1ps

module array_multiplier_tb();

    reg [3:0] a,b;
    wire [7:0] p;
    
    array_multiplier uut (.a(a), .b(b), .p(p));
    
    initial
    begin
        a = 'd0;
        b = 'd0;
        #10;
        
        a = 'd2;
        b = 'd4;
        #10;
        
        a = 'd8;
        b = 'd10;
        #10;
        
        a = 'd13;
        b = 'd14;
        #10;
        
        a = 'd15;
        b = 'd15;
        #10;
        $finish;
           
    end
endmodule
