
DIANA CAROLINA RODRIGUEZ PELAYO

A01647091

DISEÑO DE SISTEMAS EN CHIP



# RISCV SINGLE CYCLE

Video auxiliar:
Semi Edge. (2024). Designing a RISC-V Single-Cycle Processor: Step-by-Step Tutorial #riscv #verilog #semiedge. YouTube. https://www.youtube.com/watch?v=dh88oe6O0QU 


ProgramCounter			  Mantiene la dirección de la instrucción actual.
InstructionMemory		  Memoria ROM que almacena el conjunto de instrucciones del programa.
RegisterFile			    Banco de registros (32 registros de 32 bits), con dos lecturas y una escritura.
ImmediateGenerator		Extrae e interpreta los campos inmediatos según el tipo de instrucción
ALUControl			      Genera la señal de operación de la ALU a partir de la instrucción.
ALU				            Unidad lógica-aritmética que ejecuta operaciones según la instrucción.
ControlUnit		      	Genera señales de control globales según el opcode.
DataMemory			      Memoria RAM para operaciones de carga/almacenamiento.
Mux (multiplexores)		Permiten seleccionar entradas hacia la ALU o direcciones.
Adder				          Suma de direcciones para el cálculo del siguiente PC.
BranchComparator		  Compara registros para instrucciones de salto condicional.
