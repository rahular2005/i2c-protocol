// SIMPLE I2C DEMO (ONE FRAME)
// Shows: START -> ADDR+R/W -> ACK -> DATA -> ACK -> STOP
// mode = 0 => master WRITE (shows data_wr)
// mode = 1 => master READ (shows data_rd)
module i2c_simple (
 input wire clk,
 input wire rst_n,
 input wire mode, // 0 = WRITE, 1 = READ
 input wire [7:0] data_wr, // data to show during WRITE
 input wire [7:0] data_rd, // data to show during READ
 output reg sda,
 output reg scl
);
 // Fixed slave address for demo
 localparam [6:0] SLAVE_ADDR = 7'b1010000;
 reg [7:0] shifter;
 integer bit_i;
 integer st;
 initial begin
 st = 0;
 end
 always @(posedge clk or negedge rst_n) begin
 if (!rst_n) begin
 sda <= 1;
 scl <= 1;
st <= 0;
 end else begin
 case
   // START
 0: begin sda <= 1; scl <= 1; st <= 1; end
 1: begin sda <= 0; scl <= 1; st <= 2; end

// ADDRESS + R/W
 2: begin
 shifter <= {SLAVE_ADDR, mode};
 bit_i <= 7;
 st <= 3;
 end
 3: begin scl <= 0; sda <= shifter[bit_i]; st <= 4; end
 4: begin scl <= 1;

 if(bit_i == 0) st <= 5;
 else begin bit_i = bit_i - 1; st <= 3; end
 end
 // ACK
 5: begin scl <= 0; sda <= 0; st <= 6; end
 6: begin scl <= 1; st <= 7; end
 // DATA
 7: begin
 shifter <= (mode==0) ? data_wr : data_rd;
 bit_i <= 7;
 st <= 8;
 end
 8: begin scl <= 0; sda <= shifter[bit_i]; st <= 9; end
 9: begin scl <= 1;
 if(bit_i == 0) st <= 10;
 else begin bit_i = bit_i - 1; st <= 8; end
 end
 // ACK
 10: begin scl <= 0; sda <= 0; st <= 11; end
 11: begin scl 
   // STOP
 12: begin scl <= 1; sda <= 0; st <= 13; end
 13: begin sda <= 1; st <= 14; end

default: st <= 14;
 endcase
 end
 end
Endmodule
