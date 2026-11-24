module booth_multiplier (
    input wire clk,
    input wire start,
    input wire signed [3:0] M,        
    input wire signed [3:0] Q_in,     
    output wire signed [7:0] product  
);

    reg signed [3:0] A;     
    reg signed [3:0] Q;      
    reg Q_1;                 
    reg [2:0] count;         

    assign product = {A, Q}; 

    always @(posedge clk) 
    begin
        if (start) 
        begin
            A     <= 4'd0;
            Q     <= Q_in;
            Q_1   <= 1'b0;
            count <= 3'd4;
        end 
        else if (count > 0) 
        begin
            case ({Q[0], Q_1})
                2'b01:   {A, Q, Q_1} <= $signed({A + M, Q, Q_1}) >>> 1;
                2'b10:   {A, Q, Q_1} <= $signed({A - M, Q, Q_1}) >>> 1;
                default: {A, Q, Q_1} <= $signed({A, Q, Q_1}) >>> 1;
            endcase
            count <= count - 1'b1;
        end
    end

endmodule
