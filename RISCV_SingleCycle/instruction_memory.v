module instruction_memory(
    input [31:0] a,
    output [31:0] rd
);

    reg [31:0] RAM [63:0];

    initial begin
        $readmemh("test_program.mem", RAM);
    end

    // RISCV avanza de 4 en 4 bytes. Dividimos entre 4 desplazando 2 bits a la derecha
    // para acceder al índice
    assign rd = RAM[a[31:2]];

endmodule