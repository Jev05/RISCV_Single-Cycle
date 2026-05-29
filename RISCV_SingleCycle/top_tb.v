`timescale 1ns/1ps //este es para que el tiempo se muestre en nanosegundos sobre picosegundos, para la escala de visualizacion de los datos

module top_tb();

    // Entradas al procesador son clock y reset para los pulsos de movmiento de los registros
    reg clk;
    reg reset;

    
    top dut (
        .clk(clk),
        .reset(reset)
    );

    
    always #5 clk = ~clk;

    
    initial begin
    
        clk = 0;
        reset = 1;

        
        #10;
        reset = 0;

        
        #100;
        
        
        $finish;
    end

    
    initial begin
        $monitor("Tiempo=%0t | PC=%h | ALU_Resultado=%d", $time, dut.pc, dut.alu_result);
    end

	 initial begin
        $dumpfile("simulacion.vcd");
        $dumpvars(0, top_tb);
    end
	 
endmodule