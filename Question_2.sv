//Q2_design.sv
module Mux_16_1(sel,in,out);
  
  input [3:0] sel;
  inout [15:0] in;
  output out;

  wire[3:0] w;

  
  assign w[0] = sel[3] ? (sel[2] ? in[3]:in[2]) : (sel[2] ? in[1]:in[0]) ;
  assign w[1] = sel[3] ? (sel[2] ? in[7]:in[6]) : (sel[2] ? in[5]:in[4]) ;
  assign w[2] = sel[3] ? (sel[2] ? in[11]:in[10]) : (sel[2] ? in[9]:in[8]) ;
  assign w[3] = sel[3] ? (sel[2] ? in[15]:in[14]) : (sel[2] ? in[13]:in[12]) ;
  
  assign out = sel[1] ? (sel[0] ? w[3]:w[2]) : (sel[0] ? w[1]:w[0]) ;
  
endmodule










//Q2_testbench.sv
module test_16_1_Mux;

  reg [15:0] in;
  reg [3:0] sel;

wire out;

  Mux_16_1 Mux(sel,in,out);
  

initial
  begin
    $monitor(" sel=%h | in=%h | out=%h", sel,in,out);
  end
  
 initial
   begin
     in=16'hFAC7 ; sel=4'b0000;
   
#30  sel=4'b0001; 
 
#30  sel=4'b0010;

#30  sel=4'b0011;

#30  sel=4'b0100; 

#30  sel=4'b0101; 

#30  sel=4'b0110;

#30  sel=4'b0111;

#30  sel=4'b1000;

#30  sel=4'b1001;

#30  sel=4'b1010; 

#30  sel=4'b1011;

#30  sel=4'b1100; 

#30  sel=4'b1101; 

#30  sel=4'b1110; 

#30  sel=4'b1111;
  end 

  
  
endmodule
    