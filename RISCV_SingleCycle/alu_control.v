module alu_control(
    input [1:0] ALUOp, // viene del módulo del control unit
    input [2:0] funct3, // viene de la instrucción (bits 14-12)
    input funct7b5, // es el bot 30 de la instrucción
    output reg [2:0] ALUControl // salida que va al módulo ALU para indicarle qué operación realizar
);

    always @(*) begin
        case(ALUOp) // Decodificación de la operación ALU basada en ALUOp
            2'b00: ALUControl = 3'b000; 
            2'b01: ALUControl = 3'b001; 
            2'b10: begin 
                case(funct3)
                    3'b000: if (funct7b5) ALUControl = 3'b001; // sub
                            else ALUControl = 3'b000; // add y addi
                    3'b111: ALUControl = 3'b010; // and
                    3'b110: ALUControl = 3'b011; // or
                    default: ALUControl = 3'b000;
                endcase
            end
            default: ALUControl = 3'b000;
        endcase
    end

endmodule