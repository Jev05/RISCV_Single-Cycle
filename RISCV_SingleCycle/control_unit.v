module control_unit(
    input [6:0] op, // opcode de la instrucción (bits 6-0)
    output reg Branch, MemRead, MemtoReg, // señales de control que se activan según el tipo de instrucción
    output reg [1:0] ALUOp, // control de la ALU que se activa según el tipo de instrucción
    output reg MemWrite, ALUSrc, RegWrite, 
    output reg Jump
);

    always @(*) begin
        //valores iniciales
        Branch=0; MemRead=0; MemtoReg=0; ALUOp=2'b00;
        MemWrite=0; ALUSrc=0; RegWrite=0; Jump=0;

        case(op)
            7'b0110011: begin // Tipo R 
                RegWrite=1; ALUOp=2'b10;
            end
            7'b0010011: begin // Tipo I 
                RegWrite=1; ALUSrc=1; ALUOp=2'b10;
            end
            7'b0000011: begin // lw
                RegWrite=1; ALUSrc=1; MemtoReg=1; MemRead=1; ALUOp=2'b00;
            end
            7'b0100011: begin // sw
                MemWrite=1; ALUSrc=1; ALUOp=2'b00;
            end
            7'b1100011: begin // beq, bne
                Branch=1; ALUOp=2'b01;
            end
            7'b1101111: begin // jal
                Jump=1; RegWrite=1;
            end
        endcase
    end

endmodule