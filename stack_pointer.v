module sp(
  input wire clk,
  input wire reset,
  input wire enable,
  input wire decrement,
  input wire increment,
  input wire [7:0] data_in,
  output reg [7:0] data_out,
  output wire [15:0] sp_out
);

  reg [7:0] stack [0:65535];
  reg [15:0] sp;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      sp <= 16'h0000;
    end else if (enable) begin
      if (decrement) begin
        if (sp > 16'h0000) begin
          sp <= sp - 1;
          stack[sp] <= data_in;
        end
      end else if (increment) begin
        if (sp < 16'hFFFF) begin
          sp <= sp + 1;
          data_out <= stack[sp];
          stack[sp] <= 0;
  end
  end
  end
  end
  assign sp_out=sp;
endmodule
