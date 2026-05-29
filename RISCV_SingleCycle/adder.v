module adder(
    input [31:0] a, b, //entradas de 32 bits
    output [31:0] y //salida de 32 bits
);
    assign y = a + b; //operación de suma de las entradas, se guarda en y
endmodule