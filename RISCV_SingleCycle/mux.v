module mux(
    input [31:0] d0, d1, // entradas de 32 bits
    input s, // señal de selección que indica cuál de las dos entradas se debe pasar a la salida
    output [31:0] y //salida
);
    assign y = s ? d1 : d0; // Si s es 1, se selecciona d1, si s es 0, se selecciona d0
endmodule