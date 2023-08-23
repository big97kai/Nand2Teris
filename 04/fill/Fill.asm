// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(ALLLOOP)
    @KBD
    D = M
    @array
    M = 0
    @LOOPA
    D;JNE
    @LOOPB
    D;JEQ

(LOOPA)
    @array
    D = M
    @SCREEN 
    A = D + A
    M = -1
    @array
    M = M + 1
    D = M
    @8192
    A = A - D
    D = A
    @LOOPA
    D;JGT
    @ALLLOOP
    D;JEQ


(LOOPB)
    @array
    D = M
    @SCREEN 
    A = D + A
    D = A
    M = 0
    @array
    M = M + 1
    D = M
    @8192
    A = A - D
    D = A
    @LOOPB
    D;JGT
    @ALLLOOP
    D;JEQ

