module alu(
    input [31:0] a, b, // entradas de 32 bits
    input [2:0] alu_control, // control de la ALU que indica qué operación realizar
    output reg [31:0] result, // resultado de la operación
    output zero
);

    always @(*) begin
        case (alu_control) // Decodificación de la operación ALU
            3'b000: result = a + b;
            3'b001: result = a - b;
            3'b010: result = a & b;
            3'b011: result = a | b;
            default: result = 32'b0;
        endcase
    end


endmodule