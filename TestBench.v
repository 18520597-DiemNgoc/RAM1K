`timescale 1ns/1ns

module TestBench(); 
  parameter n = 8;
  reg EN_tb, RWS_tb, CS_tb, CLK_tb;
  reg [(n - 1):0] INOUT_tb;
  reg [9:0] Addr_tb;

  wire [(n - 1):0] OUT_tb;
 
  
  initial begin
    CLK_tb = 0; 
    CS_tb= 1;
    EN_tb = 1;
    RWS_tb = 1;
    
    #10 Addr_tb = 10'h1; INOUT_tb = 8'h10;
    #20 Addr_tb = 10'h2; INOUT_tb = 8'h20; 
    #40 Addr_tb = 10'h5; INOUT_tb = 8'h35;
    #60 Addr_tb = 10'h10; INOUT_tb = 8'h70;
    #80 RWS_tb = 0; Addr_tb = 10'h2; INOUT_tb = 8'hx;
    #100 Addr_tb = 10'h1; INOUT_tb = 8'h50;
    #120 Addr_tb = 10'h2;
    #140 Addr_tb = 10'h10;
    #10 Addr_tb = 10'h20;
    #150 $finish;
  end
  
  initial begin
    $monitor("Time=%d, Address=%h, RWS=%b, DataIn=%h, DataOut=%h", $time, Addr_tb, RWS_tb, INOUT_tb, OUT_tb);
  end
  
  always @(CLK_tb)
    #10 CLK_tb <= ~CLK_tb;
  
	
  assign OUT_tb = RWS_tb? INOUT_tb : 8'bzzzzzzzz;
  RAM DUT(.INOUT(OUT_tb), .IN_DEC(Addr_tb), .EN(EN_tb), .RWS(RWS_tb), .CS(CS_tb), .clk(CLK_tb));
  
endmodule

    
    
    
