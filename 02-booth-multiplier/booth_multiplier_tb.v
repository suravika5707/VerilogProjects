module booth_multiplier_tb;

    reg clk;
    reg start;
    reg signed [3:0] M;
    reg signed [3:0] Q_in;
    wire signed [7:0] product;

    booth_multiplier dut (
        .clk(clk),
        .start(start),
        .M(M),
        .Q_in(Q_in),
        .product(product)
    );

    always #5 clk = ~clk;

    initial begin
         $dumpfile("booth_multiplier_wave.vcd");
         $dumpvars(0, booth_multiplier_tb);
        
        $monitor("Time=%0t | M=%0d, Q=%0d | product=%0d", $time, M, Q_in, product);

        clk = 0;
        start = 0;
        M = 0;
        Q_in = 0;
        #10;

        M = 3;
        Q_in = 4;
        start = 1;  
        #10;
        start = 0;  
        #40;        

        M = -5;
        Q_in = 3;
        start = 1;
        #10;
        start = 0;
        #40;

        M = -4;
        Q_in = -3;
        start = 1;
        #10;
        start = 0;
        #40;

        $finish; 
    end

endmodule
