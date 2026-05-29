module register_file(
    input clk, WE3, //WE3 es la señal de habilitación de escritura que indica si se debe escribir en el registro
    input [4:0] A1, A2, A3, //A1 y A2 son las direcciones de los registros que se van a leer, A3 es la dirección del registro donde se va a escribir
    input [31:0] WD3, //WD3 es el dato que se va a escribir en el registro indicado por A3 cuando WE3 es 1
    output [31:0] RD1, RD2 // RD1 y RD2 son los datos que se leen de los registros indicados por A1 y A2 respectivamente
);

    reg [31:0] REG [31:0];

    //os datos salen en cuanto A1 o A2 cambian.
    
    assign RD1 = (A1 != 0) ? REG[A1] : 32'b0;
    assign RD2 = (A2 != 0) ? REG[A2] : 32'b0;

    
    always @(posedge clk) begin
        if (WE3 == 1 && A3 != 0) begin 
            REG[A3] <= WD3;
        end
    end

endmodule