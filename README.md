
DIANA CAROLINA RODRIGUEZ PELAYO

A01647091

DISEÑO DE SISTEMAS EN CHIP



# RISCV SINGLE CYCLE

Video auxiliar:
Semi Edge. (2024). Designing a RISC-V Single-Cycle Processor: Step-by-Step Tutorial #riscv #verilog #semiedge. YouTube. https://www.youtube.com/watch?v=dh88oe6O0QU 


# Funciones

<img width="854" height="278" alt="image" src="https://github.com/user-attachments/assets/d6bf797f-7db2-430f-b435-56a7f08636e2" />





Considerando las siguientes instrucciones de memoria en el archivo:




<img width="872" height="485" alt="image" src="https://github.com/user-attachments/assets/91603d1a-47c9-4020-88ff-f867f240a140" />





El resultado de su ejecución fue el siguiente:





<img width="994" height="356" alt="image" src="https://github.com/user-attachments/assets/4cde4c15-db46-476b-bb8d-c40e44aebdfd" />


<img width="818" height="650" alt="image" src="https://github.com/user-attachments/assets/c1a37eb1-de46-49e2-9790-96616439a3e6" />


 
 
 Al terminar la instrucción 85000, el valor de la ALU aparece como x debido a que el programa terminó en la línea del PC = 24, ya no hay más instrucciones en el archivo de memoria, a partir de la dirección PC = 28 el procesador lee memoria vacía o puros ceros, por lo que la ALU da un estado indefinido o de equis.
