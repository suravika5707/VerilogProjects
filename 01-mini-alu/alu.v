module alu(
    input [7:0] a,
    input [7:0] b,
    input [2:0] op,
    output reg[7:0] result,
    output reg zero,
    output reg carry,
    output reg overflow
);

   always @(*)
      begin
        case(op)
            3'b000: 
            begin 
                {carry, result} = a + b;
                overflow = (a[7] == b[7]) && (result[7] != a[7]);
            end
            3'b001: 
            begin 
                {carry, result} = a - b;
                overflow = (a[7] != b[7]) && (result[7] != a[7]);
            end
            3'b010: 
            begin 
                result = a & b;
                carry = 0;
                overflow = 0;
            end
            3'b011:
            begin 
                result = a | b;
                carry = 0;
                overflow = 0;
            end
            3'b100: 
            begin 
                result = a ^ b;
                carry = 0;
                overflow = 0;
            end
            default: 
            begin 
                result = 8'b00000000;
                carry = 0;
                overflow = 0;
            end
        endcase
        zero = (result == 8'b00000000);
      end

    endmodule