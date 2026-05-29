module program_counter(
    input clk, // señal de reloj para sincronizar la actualización del contador
    input reset, // señal de reinicio
    input [31:0] pc_next, // entrada que recibe la próxima dirección a la que se debe saltar
    output reg [31:0] pc // salida que representa el valor actual del PC
);

    always @(posedge clk or posedge reset) begin
        if (reset)  // Si reset es 1, se reinicia el PC a 0
            pc <= 32'b0;
        else       
            pc <= pc_next; // En el flanco positivo del reloj, se actualiza el PC con el valor de pc_nexT
    end                     //Para cambiar de instruccion

endmodule