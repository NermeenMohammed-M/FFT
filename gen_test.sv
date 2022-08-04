module gen_test;
  logic clk;
  logic rst;
  logic [4:0] number;//16 8 4 2
  logic e_start;
  logic inverse;
  logic [1:0]stage;
  logic [23:0]angle_o[(16/2)-1:0];


angle_generator#(.N(16)) inst1(.clk(clk),
			.rst(rst),
			.number(number),
			.e_start(e_start),
			.inverse(inverse),
			.stage(stage),
			.angle_o(angle_o));



initial begin
   clk = 1'b0;
   forever begin
     #5 clk = ~clk;
   end
 end


initial
begin
e_start=1'b1;

number=5'b10000;//16_fft

stage=2'b00;
#100 ;
foreach(angle_o[i])
      $display("\t angle_o[%0d] = %h",i,angle_o[i][23:0]);  

stage=2'b01;
#10
foreach(angle_o[i])
      $display("\t angle_o[%0d] = %h",i,angle_o[i][23:0]);  

stage=2'b10;
#10
foreach(angle_o[i])
      $display("\t angle_o[%0d] = %h",i,angle_o[i][23:0]);  

stage=2'b11;
#10
foreach(angle_o[i])
      $display("\t angle_o[%0d] = %h",i,angle_o[i][23:0]);  

end
//initial 
//$monitor("clk=%b n=%d  stage=%d angle_o=%p",clk,number,stage,angle_o);


endmodule
