module data_memory(
    input clk, // señal de reloj para sincronizar las operaciones de lectura y escritura
    input MemWrite, MemRead, // señales de control para indicar si se va a escribir o leer de la memoria
    input [31:0] a, wd, // 'a' es la dirección de memoria y 'wd' es el dato a escribir
    output [31:0] rd // dato leído de la memoria, se activa cuando MemRead es 1
);

    reg [31:0] RAM [63:0]; // memoria de 64 palabras de 32 bits cu

    assign rd = MemRead ? RAM[a[31:2]] : 32'b0; // Si MemRead es 1, se lee de la memoria en la dirección 'a' dividida entre 4 para obtener el índice correcto, si no, es 0

    always @(posedge clk) begin // En el flanco positivo del reloj, si MemWrite es 1, se escribe el dato 'wd' en la dirección 'a' dividida entre 4
        if (MemWrite) begin
            RAM[a[31:2]] <= wd;
        end
    end

endmodule