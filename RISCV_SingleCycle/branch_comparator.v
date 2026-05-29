module branch_comparator(
    input [31:0] a, b, // entradas de 32 bits que vienen de los registros rs1 y rs2
    input [2:0] funct3, // viene de la instrucción (bits 14-12) y nos indica el tipo de comparación a realizar
    output reg branch_taken // salida que indica si se toma o no el salto
);

    always @(*) begin
        case(funct3)
            3'b000: branch_taken = (a == b); // beq
            3'b001: branch_taken = (a != b); // bne
            default: branch_taken = 1'b0;
        endcase
    end

endmodule