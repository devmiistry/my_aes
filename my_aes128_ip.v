// my_aes_ip.v

`timescale 1 ps / 1 ps

module my_aes_ip (
        input wire [3:0]  aps_s0_paddr,
        input wire        aps_s0_psel,
        input wire aps_s0_penable,
        input wire        aps_s0_pwrite,
        input wire [31:0]  aps_s0_pwdata,
        output wire [31:0] aps_s0_prdata,
        output wire        aps_s0_pready,
        input wire        clock_clk,
        input wire        reset_reset
    );  

reg [31:0] ptext[0:3];
reg [31:0] key[0:3];
reg [31:0] data_temp;
wire [3:0] addr;

reg [3:0] state, next_state;
parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;

assign addr = aps_s0_paddr;
assign aps_s0_pready = 1'b1;
assign aps_s0_prdata = data_temp;

initial state = S0;
//initial state = S0;

always @(state, aps_s0_pwrite) begin
	case(state)
	
	S0: begin //plaintext state
		if (aps_s0_psel && (~aps_s0_pwrite) && aps_s0_pready) begin
			 case(addr)
				  4'b0000 : data_temp <= ptext[0];
				  4'b0100 : data_temp <= ptext[1];
				  4'b1000 : data_temp <= ptext[2];
				  4'b1100 : data_temp <= ptext[3];
				  default : data_temp <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
			 endcase
			 next_state <= S1;
		end
		
		// Continue to add writing if statement for each state.
		
	end
	
	S1: begin //decode state 
		if (aps_s0_psel && aps_s0_pwrite && aps_s0_pready)
		begin
			 case(addr)
				  4'b0000 : ptext[0] <= aps_s0_pwdata;
				  4'b0100 : ptext[1] <= aps_s0_pwdata;
				  4'b1000 : ptext[2] <= aps_s0_pwdata;
				  4'b1100 : ptext[3] <= aps_s0_pwdata;
			 endcase
			 next_state <= S2;
		end
	end
	S2: begin //execute and
		  if (aps_s0_psel && (~aps_s0_pwrite) && aps_s0_pready)
		begin
			 case(addr)
				  4'b0000 : data_temp <= key[0];
				  4'b0100 : data_temp <= key[1];
				  4'b1000 : data_temp <= key[2];
				  4'b1100 : data_temp <= key[3];
				  default : data_temp <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
			 endcase
			 
		end
	end
	S3: begin //decode state 
		if (aps_s0_psel && aps_s0_pwrite && aps_s0_pready)
		begin
			 case(addr)
				  4'b0000 : key[0] <= aps_s0_pwdata;
				  4'b0100 : key[1] <= aps_s0_pwdata;
				  4'b1000 : key[2] <= aps_s0_pwdata;
				  4'b1100 : key[3] <= aps_s0_pwdata;
			 endcase
			 next_state <= S2;
		end
	end
	
//	  if(reset_reset == 1) begin
//		  ptext[0] <= 32'b00000000000000000000000000000000;
//		  ptext[1] <= 32'b00000000000000000000000000000000;
//		  ptext[2] <= 32'b00000000000000000000000000000000;
//		  ptext[3] <= 32'b00000000000000000000000000000000;
//		  
//		  key[0] <= 32'b00000000000000000000000000000000;
//		  key[1] <= 32'b00000000000000000000000000000000;
//		  key[2] <= 32'b00000000000000000000000000000000;
//		  key[3] <= 32'b00000000000000000000000000000000;
//		end

	endcase
				
end
//
//always @ (posedge clock_clk)
//    begin
//        if (aps_s0_psel && (~aps_s0_pwrite) && aps_s0_pready)
//            begin
//                case(addr)
//                    4'b0000 : data_temp <= ptext[0];
//                    4'b0100 : data_temp <= ptext[1];
//                    4'b1000 : data_temp <= ptext[2];
//                    4'b1100 : data_temp <= ptext[3];
//                    default : data_temp <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
//                endcase
//            end
//    end
//	 


//always @ (posedge clock_clk or posedge reset_reset) begin
//  if(reset_reset == 1) begin
//	  ptext[0] <= 32'b00000000000000000000000000000000;
//	  ptext[1] <= 32'b00000000000000000000000000000000;
//	  ptext[2] <= 32'b00000000000000000000000000000000;
//	  ptext[3] <= 32'b00000000000000000000000000000000;
//	  
//	  key[0] <= 32'b00000000000000000000000000000000;
//	  key[1] <= 32'b00000000000000000000000000000000;
//	  key[2] <= 32'b00000000000000000000000000000000;
//	  key[3] <= 32'b00000000000000000000000000000000;
//  end
//  
//	state <= next_state;
//			
//end

endmodule
