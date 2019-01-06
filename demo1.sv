
module demo1(
    input clk
    );

    reg reset_;

    initial reset_ = 1'b0;
    always @(posedge clk) reset_ <= 1'b1;

    reg [1:0] cntr;
    always @(posedge clk) begin

        if (cntr == 2)
            cntr <= 0;
        else
            cntr <= cntr + 1;

        if (reset_) begin
            cntr <= 0;
        end
    end

    assert property($initstate || !reset_ || cntr != 3);
    
endmodule
