module angle_generator #(parameter N=16)
(input logic clk,
 input logic rst,
 input logic [4:0] number,//16 8 4 2
 input logic e_start,
 input logic inverse,
 input logic [1:0]stage,
 output logic [23:0]angle_o[(N/2)-1:0]
);

logic [23:0]out[7:0];
lut inst1 (.rst(rst),.clk(clk),.out(out));

always @(posedge clk or posedge rst) begin
    if (!e_start | rst)begin
	angle_o='{default:1'bx};
    end
    else begin
    
        case({number,stage})  
           
            7'b1000000:begin
                // need w from 0->7
                angle_o=out;
            end
            7'b1000001,7'b0100000:begin
                //need w 0-2-4-6  
                angle_o[0]=out[0];
                angle_o[1]=out[2];
                angle_o[2]=out[4];
                angle_o[3]=out[6];  
            end
            7'b1000010,7'b0100001,7'b0010000:begin
                //need 0-4
                angle_o[0]=out[0];
                angle_o[1]=out[4];
		end
            7'b1000011,7'b0100010,7'b0010001,7'b0001000:begin
                //0
                angle_o[0]=out[0];
            end 
            default:begin
               angle_o='{default:1'bx}; 
            end
        
        endcase
    end    
end



endmodule


