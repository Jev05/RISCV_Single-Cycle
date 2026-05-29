module top(
    input clk,
    input reset
);

    
    wire [31:0] pc, pc_next, pc_plus_4, pc_branch, pc_target;
    wire [31:0] instr, imm_ext, src_a, src_b_reg, src_b_alu, alu_result, read_data, result_wd;
    wire [2:0] alu_ctrl;
    wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Jump, branch_taken, pc_src;
    wire [1:0] ALUOp;

    // FETHCH
    program_counter pc_reg (
        .clk(clk), .reset(reset), .pc_next(pc_next), .pc(pc)
    );

    adder pc_add_4 (
        .a(pc), .b(32'd4), .y(pc_plus_4)
    );

    instruction_memory imem (
        .a(pc), .rd(instr)
    );

    // DECODE
    control_unit ctrl (
        .op(instr[6:0]), .Branch(Branch), .MemRead(MemRead), 
        .MemtoReg(MemtoReg), .ALUOp(ALUOp), .MemWrite(MemWrite), 
        .ALUSrc(ALUSrc), .RegWrite(RegWrite), .Jump(Jump)
    );

    register_file reg_file (
        .clk(clk), .WE3(RegWrite), 
        .A1(instr[19:15]), .A2(instr[24:20]), .A3(instr[11:7]), 
        .WD3(result_wd), .RD1(src_a), .RD2(src_b_reg)
    );

    immediate_generator imm_gen (
        .instr(instr), .imm(imm_ext)
    );

    // EXECUTE
    mux src_b_mux (
        .d0(src_b_reg), .d1(imm_ext), .s(ALUSrc), .y(src_b_alu)
    );

    alu_control ac (
        .ALUOp(ALUOp), .funct3(instr[14:12]), .funct7b5(instr[30]), 
        .ALUControl(alu_ctrl)
    );

    alu alu_unit (
        .a(src_a), .b(src_b_alu), .alu_control(alu_ctrl), 
        .result(alu_result), .zero() 
    );

    branch_comparator b_comp (
        .a(src_a), .b(src_b_reg), .funct3(instr[14:12]), .branch_taken(branch_taken)
    );

    adder pc_add_branch (
        .a(pc), .b(imm_ext), .y(pc_branch)
    );


    assign pc_src = (Branch & branch_taken) | Jump;

    mux pc_branch_mux (
        .d0(pc_plus_4), .d1(pc_branch), .s(pc_src), .y(pc_next)
    );

    // MEMORIA
    data_memory dmem (
        .clk(clk), .MemWrite(MemWrite), .MemRead(MemRead), 
        .a(alu_result), .wd(src_b_reg), .rd(read_data)
    );

    mux res_mux (
        .d0(alu_result), .d1(read_data), .s(MemtoReg), .y(result_wd)
    );

endmodule