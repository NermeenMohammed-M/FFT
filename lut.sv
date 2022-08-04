module lut(
    input rst,
    input logic clk,
    output logic [23:0] out[7:0]
);


int i=-1;
logic [23:0] sign;
always@(i) begin
//24=2*11+2
//2 bit for quadrant
    //00->first
    //01->second
//SIGN --> 2 bit for each index -->11 index
    //00--> not used 
    //10->-ve
    //01->+ve

case(i)
    //forward angles
    0:sign=24'h400000;//0-> 01 00 00 00 00 00 00 00 00 00 00 00
    1:sign=24'h020810;//22.5->00 00 00 10 00 00 10 00 00 01 00 00
    2:sign=24'h000004;//45--> 00 00 00 00 00 00 00 00 00 00 01 00
    3:sign=24'h011144;//67.5-->00 00 00 01 00 01 00 01 01 00 01 00
    4:sign=24'h002154;//90-->00 00 00 00 00 10 00 01 01 01 01 00
    5:sign=24'h011145;//112.5-->00 00 00 01 00 01 00 01 01 00 01 01
    6:sign=24'h000005;//135-->00 00 00 00 00 00 00 00 00 00 01 01
    7:sign=24'h020811;//157.5-->00 00 00 10 00 00 10 00 00 01 00 01
 
endcase


end

always@(posedge clk or posedge rst) begin
    if(rst & i==8)
	i=0;
    else  begin
        out[i][23:0]=sign;
	i=i+1;
    end

end


endmodule
