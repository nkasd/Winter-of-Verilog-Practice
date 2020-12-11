



// Code your design here
module Mux_4_1(sel,in,out);

  input [3:0] in; 
  input [1:0] sel; 
  output out;

  wire a,b,c,d,x1,x2,a1,a2,a3,a4;

  not not1(x1,sel[1]); 
  not not2(x2,sel[0]);
  and and1(a1,in[0],x1,x2);
  and and2(a2,in[1],x2,sel[1]);
  and and3(a3,in[2],sel[0],x1); 
  and and4(a4,in[3],sel[0],sel[1]);
  or or1(out,a1,a2,a3,a4);

endmodule

module Mux_16_1(sel,in,out);
  
  input [0:3] sel;
  input [0:15] in;
  output out;

  wire[3:0] w;
	
Mux_4_1 mux1(sel[2:3],in[0:3],w[0]);
Mux_4_1 mux2(sel[2:3],in[4:7],w[1]);
Mux_4_1 mux3(sel[2:3],in[8:11],w[2]);
Mux_4_1 mux4(sel[2:3],in[12:15],w[3]);

Mux_4_1 mux5(sel[0:1],w,out);

endmodule





// Code your testbench here
// or browse Examples
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
    