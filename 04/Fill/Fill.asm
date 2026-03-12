// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed,
// the screen should be cleared.

(INIT)
// 512 x 256 pixels / 16 = 8192 words
// last_pixel=SCREEN+8191
@SCREEN
D=A
@8191
D=D+A
@last_pixel
M=D

(LOOP)
// i=SCREEN
@SCREEN
D=A
@i
M=D
// color = 0 (white)
@color
M=0
// if (KBD != 0) goto DRAW
@KBD
D=M
@DRAW
D;JNE
// color = -1 (black)
@color
M=-1

(DRAW)
// RAM[i] = color
@color
D=M
@i
A=M
M=D
// i = i + 1
@i
M=M+1
// if (i == last_pixel) goto LOOP
// @i
D=M
@last_pixel
D=D-M
@LOOP
D;JEQ
// goto DRAW
@DRAW
0;JMP
