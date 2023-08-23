// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// 分为三种情况 a = 0, b = 0 , a b != 0
// 输出由a为循环次数 b为相加基数而得 所以 二三情况合并
@y          //初始最终输出
M = 0
@R0       
D = M       //如果a = 0 则跳转到0
@SUM
D;JEQ
@arr        //设定循环次数
M = D
M = M
@R1
D = M
@R2
M = 0

(LOOP)
@R2
M = 0
@R1
D = M
@y
M = M + D
@arr
M = M -1
D = M
@LOOP
D;JGT

(SUM)
@y
D = M
@R2
M = D

(END)
@END
0;JEQ

