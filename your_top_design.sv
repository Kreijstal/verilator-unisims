module top(
    input CLK,
    input WE,
    input [8:0] ADDR,
    input [31:0] DI,
    output [31:0] DO
);

    RAMB36E2 bram (
        .CLK(CLK),
        .WE(WE),
        .ADDR(ADDR),
        .DI(DI),
        .DO(DO)
    );

endmodule
