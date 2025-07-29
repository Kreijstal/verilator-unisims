// In RAMB36E2.sv (our replacement file)

// This module will be found by the compiler instead of the real one.
module RAMB36E2 #(
    // All the parameters of the real BRAM go here...
)(
    // All the ports of the real BRAM go here...
    input CLK,
    input WE,
    input [8:0] ADDR,
    input [31:0] DI,
    output logic [31:0] DO
);

    // Import the C function into the SystemVerilog namespace
    import "DPI-C" function void bram_update(
        input int write_enable,
        input int address,
        input int data_in,
        output int data_out
    );

    // Call the C function on every clock edge
    always @(posedge CLK) begin
        // Pass the Verilog signals to the C function
        bram_update(int'(WE), int'(ADDR), int'(DI), DO);
    end

endmodule
