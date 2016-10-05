; name : Alexander Jones
; uid : U5956709

; your solution goes here

0x0100 :
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
R :
	load 0xfff0 R0
	jumpz R0 R
	sub R0 #'R' R1
	jumpnz R1 Halt
P :
	load 0xfff0 R0
	jumpz R0 P
	sub R0 #'P' R1
	jumpnz R1 Halt
I :
	load 0xfff0 R0
	jumpz R0 I
	sub R0 #'I' R1
	jumpnz R1 Halt
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; get width
width1 :
	load 0xfff0 R0
	jumpz R0 width1
	sub R0 #'0' R0 ; convert to int
	mult R0 #100 R1
width2 :
	load 0xfff0 R0
	jumpz R0 width2
	sub R0 #'0' R0 ; convert to int
	mult R0 #10 R2
	add R1 R2 R1
width3 :
	load 0xfff0 R0
	jumpz R0 width3
	sub R0 #'0' R2 ; convert to int
	add R1 R2 R6 ; width value in R6 for Binary and Hex
	move R6 R1
	store R1 width ; width in memory for Huffman
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; get height
height1 :
	load 0xfff0 R0
	jumpz R0 height1
	sub R0 #'0' R0 ; convert to int
	mult R0 #100 R1
height2 :
	load 0xfff0 R0
	jumpz R0 height2
	sub R0 #'0' R0 ; convert to int
	mult R0 #10 R2
	add R1 R2 R1
height3 :
	load 0xfff0 R0
	jumpz R0 height3
	sub R0 #'0' R2 ; convert to int
	add R1 R2 R7 ; width value in R7 for Binary and Hex
	move R7 R1
	store R1 height ; width in memory for Huffman
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; set x-coord and y-coord to 0
	load #0 R1 ; x-coor stored in R1
	load #0 R2 ; y-coor stored in R2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; get image mode (Binary, Hex, Huffman)
modeBXH :
	load 0xfff0 R0
	jumpz R0 modeBXH
	sub R0 #'B' R3
	jumpz R3 BinaryLoader
	sub R0 #'X' R3
	jumpz R3 HexLoader
	sub R0 #'H' R3
	jumpz R3 HuffmanLoader
	jumpnz R3 Halt
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Binary Mode (B)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BinaryLoader :
	load 0xfff0 R0
	jumpz R0 BinaryLoader
	sub R0 #'1' R0
	jumpz R0 BinaryDrawPixel
BinaryIncX :
	add ONE R1 R1
	sub R6 R1 R3
	jumpz R3 BinaryIncY
	jump BinaryLoader
BinaryIncY :
	add ONE R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump BinaryLoader
BinaryDrawPixel :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 ONE R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	jump BinaryIncX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Hex Mode (X)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexLoader :
	load 0xfff0 R0
	jumpz R0 HexLoader
	sub R0 #'0' R3
	jumpz R3 HexDraw0
	sub R0 #'1' R3
	jumpz R3 HexDraw1
	sub R0 #'2' R3
	jumpz R3 HexDraw2
	sub R0 #'3' R3
	jumpz R3 HexDraw3
	sub R0 #'4' R3
	jumpz R3 HexDraw4
	sub R0 #'5' R3
	jumpz R3 HexDraw5
	sub R0 #'6' R3
	jumpz R3 HexDraw6
	sub R0 #'7' R3
	jumpz R3 HexDraw7
	sub R0 #'8' R3
	jumpz R3 HexDraw8
	sub R0 #'9' R3
	jumpz R3 HexDraw9
	sub R0 #'A' R3
	jumpz R3 HexDrawA
	sub R0 #'B' R3
	jumpz R3 HexDrawB
	sub R0 #'C' R3
	jumpz R3 HexDrawC
	sub R0 #'D' R3
	jumpz R3 HexDrawD
	sub R0 #'E' R3
	jumpz R3 HexDrawE
	sub R0 #'F' R3
	jumpz R3 HexDrawF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDraw0 :
	sub R6 R1 R3
	jumpz R3 incY01
	jump cont01
incY01 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont01
cont01 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY02
	jump cont02
incY02 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont02
cont02 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY03
	jump cont03
incY03 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont03
cont03 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY04
	jump cont04
incY04 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont04
cont04 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY05
	jump HexLoader
incY05 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
  jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDraw1 :
	sub R6 R1 R3
	jumpz R3 incY11
	jump cont11
incY11 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont11
cont11 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY12
	jump cont12
incY12 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont12
cont12 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY13
	jump cont13
incY13 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont13
cont13 :
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY14
	jump cont14
incY14 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont14
cont14 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY15
	jump HexLoader
incY15 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
  jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDraw2 :
	sub R6 R1 R3
	jumpz R3 incY21
	jump cont21
incY21 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont21
cont21 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY22
	jump cont22
incY22 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont22
cont22 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY23
	jump cont23
incY23 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont23
cont23 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY24
	jump cont24
incY24 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont24
cont24 :
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY25
	jump HexLoader
incY25 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
  jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDraw3 :
	sub R6 R1 R3
	jumpz R3 incY31
	jump cont31
incY31 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont31
cont31 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY32
	jump cont32
incY32 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont32
cont32 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY33
	jump cont33
incY33 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont33
cont33 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY34
	jump cont34
incY34 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont34
cont34 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY35
	jump HexLoader
incY35 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
  jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDraw4 :
	sub R6 R1 R3
	jumpz R3 incY41
	jump cont41
incY41 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont41
cont41 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY42
	jump cont42
incY42 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont42
cont42 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY43
	jump cont43
incY43 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont43
cont43 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY44
	jump cont44
incY44 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont44
cont44 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY45
	jump HexLoader
incY45 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDraw5 :
	sub R6 R1 R3
	jumpz R3 incY51
	jump cont51
incY51 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont51
cont51 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY52
	jump cont52
incY52 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont52
cont52 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY53
	jump cont53
incY53 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont53
cont53 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY54
	jump cont54
incY54 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont54
cont54 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY55
	jump HexLoader
incY55 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDraw6 :
	sub R6 R1 R3
	jumpz R3 incY61
	jump cont61
incY61 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont61
cont61 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY62
	jump cont62
incY62 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont62
cont62 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY63
	jump cont63
incY63 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont63
cont63 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY64
	jump cont64
incY64 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont64
cont64 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY65
	jump HexLoader
incY65 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDraw7 :
	sub R6 R1 R3
	jumpz R3 incY71
	jump cont71
incY71 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont71
cont71 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY72
	jump cont72
incY72 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont72
cont72 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY73
	jump cont73
incY73 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont73
cont73 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY74
	jump cont74
incY74 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont74
cont74 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY75
	jump HexLoader
incY75 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDraw8 :
	sub R6 R1 R3
	jumpz R3 incY81
	jump cont81
incY81 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont81
cont81 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY82
	jump cont82
incY82 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont82
cont82 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY83
	jump cont83
incY83 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont83
cont83 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY84
	jump cont84
incY84 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont84
cont84 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY85
	jump HexLoader
incY85 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDraw9 :
	sub R6 R1 R3
	jumpz R3 incY91
	jump cont91
incY91 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont91
cont91 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY92
	jump cont92
incY92 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont92
cont92 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY93
	jump cont93
incY93 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont93
cont93 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY94
	jump cont94
incY94 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump cont94
cont94 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incY95
	jump HexLoader
incY95 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDrawA :
	sub R6 R1 R3
	jumpz R3 incYA1
	jump contA1
incYA1 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contA1
contA1 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYA2
	jump contA2
incYA2 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contA2
contA2 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYA3
	jump contA3
incYA3 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contA3
contA3 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYA4
	jump contA4
incYA4 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contA4
contA4 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYA5
	jump HexLoader
incYA5 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDrawB :
	sub R6 R1 R3
	jumpz R3 incYB1
	jump contB1
incYB1 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contB1
contB1 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYB2
	jump contB2
incYB2 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contB2
contB2 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYB3
	jump contB3
incYB3 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contB3
contB3 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYB4
	jump contB4
incYB4 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contB4
contB4 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYB5
	jump HexLoader
incYB5 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDrawC :
	sub R6 R1 R3
	jumpz R3 incYC1
	jump contC1
incYC1 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contC1
contC1 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYC2
	jump contC2
incYC2 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contC2
contC2 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYC3
	jump contC3
incYC3 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contC3
contC3 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYC4
	jump contC4
incYC4 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contC4
contC4 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYC5
	jump HexLoader
incYC5 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDrawD :
	sub R6 R1 R3
	jumpz R3 incYD1
	jump contD1
incYD1 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contD1
contD1 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYD2
	jump contD2
incYD2 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contD2
contD2 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYD3
	jump contD3
incYD3 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contD3
contD3 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYD4
	jump contD4
incYD4 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contD4
contD4 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYD5
	jump HexLoader
incYD5 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDrawE :
	sub R6 R1 R3
	jumpz R3 incYE1
	jump contE1
incYE1 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contE1
contE1 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYE2
	jump contE2
incYE2 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contE2
contE2 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYE3
  jump contE3
incYE3 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contE3
contE3 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYE4
	jump contE4
incYE4 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contE4
contE4 : add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYE5
	jump HexLoader
incYE5 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HexDrawF :
	sub R6 R1 R3
	jumpz R3 incYF1
	jump contF1
incYF1 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contF1
contF1 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYF2
	jump contF2
incYF2 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contF2
contF2 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYF3
	jump contF3
incYF3 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contF3
contF3 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYF4
	jump contF4
incYF4 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump contF4
contF4 :
	load #0x7C40 R0
	mult #6 R2 R3
	add R3 R0 R0
	div R1 #32 R3
	add R3 R0 R0
	mod R1 #32 R4
	rotate R4 #1 R4
	load R0 R5
	or R5 R4 R5
	store R5 R0
	add #1 R1 R1
;;;;;;;;;;;;;;;;;;;;
	sub R6 R1 R3
	jumpz R3 incYF5
	jump HexLoader
incYF5 :
	add #1 R2 R2
	load #0 R1
	sub R7 R2 R3
	jumpz R3 Halt
	jump HexLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Huffman Mode (H)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HuffmanLoader :
	load #ScreenTable R0 ; each word on screen is 32 buts
	load #1 R1
	store R1 R0
	load #31 R2
fillWord1 :
	mult R1 #2 R1
	add R0 #1 R0
	store R1 R0
	sub R2 #1 R2
	jumpnz R2 fillWord1
	load #HuffToBase64 R0
	load #65 R1
	add R0 R1 R0
	load #25 R5
	load #1 R2
fillWord2 :
	add R0 #1 R0
	store R2 R0
	add R2 #1 R2
	sub R5 #1 R5
	jumpnz R5 fillWord2
	load #HuffToBase64 R0
	load #96 R1
	add R0 R1 R0
	load #26 R5
fillWord3 :
	add R0 #1 R0
	store R2 R0
	add R2 #1 R2
	sub R5 #1 R5
	jumpnz R5 fillWord3
	load #HuffToBase64 R0
	load #47 R1
	add R0 R1 R0
	load #10 R5
fillWord4 :
	add R0 #1 R0
	store R2 R0
	add R2 #1 R2
	sub R5 #1 R5
	jumpnz R5 fillWord4
	load #HuffToBase64 R0
	load #43 R1
	add R0 R1 R0
	store R2 R0
	add R2 #1 R2
	load #HuffToBase64 R0
	load #47 R1
	add R0 R1 R0
	store R2 R0
	jump loadBase64ToBinary ; store binary equivalent t of every base64 value
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
printingStation : ; start printing stuff to screen
	load #0x7c40 R4
	load #1 R7
	store R7 IncYHuff
	load #0 R2
drawBinaryPixel :
	load width R0
	div R0 #32 R0
	store R0 IncXHuff
	jumpz R0 Xtrack
Xtracker :
	load #0 R3
	load #32 R6
	load #ScreenTable R7
drawHuffman1 :
	call loadBinaryHuff
	jumpz R0 jumpToNextStage
	load R7 R1
	add R3 R1 R3
jumpToNextStage :
	sub R6 #1 R6
	add R7 #1 R7
	jumpnz R6 drawHuffman1
	store R3 R4
	add R4 #1 R4
	load IncXHuff R0
	sub R0 #1 R0
	store R0 IncXHuff
	jumpnz R0 Xtracker
	jumpz R0 Xtrack
Xtrack :
	load #0 R3
	load width R6
	mod R6 #32 R6
	jumpz R6 Yincrement
	load #ScreenTable R7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
drawHuffman :
	call loadBinaryHuff
	jumpz R0 skip
	load R7 R1
	add R3 R1 R3
	skip :
	sub R6 #1 R6
	add R7 #1 R7
	jumpnz R6 drawHuffman
	store R3 R4
	add R4 #1 R4
Yincrement :
	load height R0
	sub R0 #1 R0
	jumpz R0 Halt
	store R0 height
	load IncYHuff R1
	load #0x7c40 R4
	mult R1 #6 R3
	add R3 R4 R4
	add R1 #1 R1
	store R1 IncYHuff
	jumpnz R0 drawBinaryPixel
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
loadBinaryHuff : ; load a binary value to print to screen
	jumpnz R2 DecodeNext
	load HuffTracker R1
	jumpnz R1 contH1
	jump getNextHuff1
getNextHuff1 :
	load 0xfff0 R0
	jumpz R0 getNextHuff1
	load #HuffToBase64 R1
	add R0 R1 R1
	load R1 R0
	mult R0 #6 R0
	load #Base64ToBinary R1
	add R0 R1 R0
	load #BinaryEquivalent R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	load #6 R1
	store R1 HuffTracker
	load #BinaryEquivalent R5
	jump contH1
contH1 :
	load R5 R0
	add R5 #1 R5
	sub R1 #1 R1
	jumpz R0 Decode0
	jumpnz R1 contH4
	jump getNextHuff4
getNextHuff4 :
	load 0xfff0 R0
	jumpz R0 getNextHuff4
	load #HuffToBase64 R1
	add R0 R1 R1
	load R1 R0
	mult R0 #6 R0
	load #Base64ToBinary R1
	add R0 R1 R0
	load #BinaryEquivalent R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	load #6 R1
	store R1 HuffTracker
	load #BinaryEquivalent R5
	jump contH4
contH4 :
	load R5 R0
	add R5 #1 R5
	sub R1 #1 R1
	jumpz R0 Decode10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Decode11 :
	jumpnz R1 contH2
	jump getNextHuff2
getNextHuff2 :
	load 0xfff0 R0
	jumpz R0 getNextHuff2
	load #HuffToBase64 R1
	add R0 R1 R1
	load R1 R0
	mult R0 #6 R0
	load #Base64ToBinary R1
	add R0 R1 R0
	load #BinaryEquivalent R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	load #6 R1
	store R1 HuffTracker
	load #BinaryEquivalent R5
	jump contH2
contH2 :
	load R5 R0
	add R5 #1 R5
	sub R1 #1 R1
	jumpz R0 Decode110
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Decode111 :
	jumpnz R1 contH3
	jump getNextHuff3
getNextHuff3 :
	load 0xfff0 R0
	jumpz R0 getNextHuff3
	load #HuffToBase64 R1
	add R0 R1 R1
	load R1 R0
	mult R0 #6 R0
	load #Base64ToBinary R1
	add R0 R1 R0
	load #BinaryEquivalent R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	load #6 R1
	store R1 HuffTracker
	load #BinaryEquivalent R5
	jump contH3
contH3 :
	load R5 R0
	add R5 #1 R5
	sub R1 #1 R1
	jumpz R0 Decode1110
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Decode1111 :
	store R1 HuffTracker
	load #1 R2
	load #Block8 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	load #4 R2
	store R2 previous
	jump DecodeNext
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Decode1110 :
	store R1 HuffTracker
	load #0 R2
	load #Block8 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	load #4 R2
	store R2 previous
	jump DecodeNext
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Decode110 :
	jumpnz R1 contH5
	jump getNextHuff5
getNextHuff5 :
	load 0xfff0 R0
	jumpz R0 getNextHuff5
	load #HuffToBase64 R1
	add R0 R1 R1
	load R1 R0
	mult R0 #6 R0
	load #Base64ToBinary R1
	add R0 R1 R0
	load #BinaryEquivalent R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	load #6 R1
	store R1 HuffTracker
	load #BinaryEquivalent R5
	jump contH5
contH5 :
	load R5 R0
	add R5 #1 R5
	sub R1 #1 R1
	jumpz R0 Decode1100
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Decode1101:
	store R1 HuffTracker
	load #1 R2
	load #Block8 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	load #2 R2
	store R2 previous
	jump DecodeNext
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Decode1100:
	store R1 HuffTracker
	load #0 R2
	load #Block8 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	load #2 R2
	store R2 previous
	jump DecodeNext
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Decode10 :
	jumpnz R1 contH6
	jump getNextHuff6
getNextHuff6 :
	load 0xfff0 R0
	jumpz R0 getNextHuff6
	load #HuffToBase64 R1
	add R0 R1 R1
	load R1 R0
	mult R0 #6 R0
	load #Base64ToBinary R1
	add R0 R1 R0
	load #BinaryEquivalent R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	load #6 R1
	store R1 HuffTracker
	load #BinaryEquivalent R5
	jump contH6
contH6 :
	load R5 R0
	add R5 #1 R5
	sub R1 #1 R1
	jumpz R0 Decode100
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Decode101 :
	store R1 HuffTracker
	load #1 R2
	load #Block8 R0
	store R2 R0
	load #1 R2
	store R2 previous
	jump DecodeNext
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Decode100 :
	store R1 HuffTracker
	load #0 R2
	load #Block8 R0
	store R2 R0
	load #1 R2
	store R2 previous
	jump DecodeNext
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Decode0 :
	jumpnz R1 contH7
	jump getNextHuff7
getNextHuff7 :
	load 0xfff0 R0
	jumpz R0 getNextHuff7
	load #HuffToBase64 R1
	add R0 R1 R1
	load R1 R0
	mult R0 #6 R0
	load #Base64ToBinary R1
	add R0 R1 R0
	load #BinaryEquivalent R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	add R0 #1 R0
	add R1 #1 R1
	load R0 R2
	store R2 R1
	load #6 R1
	store R1 HuffTracker
	load #BinaryEquivalent R5
	jump contH7
contH7 :
	load R5 R0
	add R5 #1 R5
	sub R1 #1 R1
	jumpz R0 Decode00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Decode01 :
	store R1 HuffTracker
	load #1 R2
	load #Block8 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	load #8 R2
	store R2 previous
	jump DecodeNext
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Decode00 :
	store R1 HuffTracker
	load #0 R2
	load #Block8 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	add R0 #1 R0
	store R2 R0
	load #8 R2
	store R2 previous
	jump DecodeNext
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DecodeNext :
	load previous R1
	sub R1 R2 R1
	sub R2 #1 R2
	load #Block8 R0
	add R0 R1 R0
	load R0 R0
	return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; memory blocks
width : 	block 1
height : 	block 1
Base64ToBinary :	block 400
HuffToBase64 : block 200
IncYHuff : 	block 1
IncXHuff : 	block 1
HuffTracker :	block 1
ScreenTable : 	block 32
BinaryEquivalent :	block 6
Block8 :	block 8
previous :	block 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HuffmanTable :
	block 43
	block #62 ; '+'
	block 3
	block #63 ; '/'
	block #52 ; '0'
	block #53 ; '1'
	block #54 ; '2'
	block #55 ; '3'
	block #56 ; '4'
	block #57 ; '5'
	block #58 ; '6'
	block #59 ; '7'
	block #60 ; '8'
	block #61 ; '9'
	block 7
	block #0 ; 'A'
	block #1 ; 'B'
	block #2 ; 'C'
	block #3 ; 'D'
	block #4 ; 'E'
	block #5 ; 'F'
	block #6 ; 'G'
	block #7 ; 'H'
	block #8 ; 'I'
	block #9 ; 'J'
	block #10 ; 'K'
	block #11 ; 'L'
	block #12 ; 'M'
	block #13 ; 'N'
	block #14 ; 'O'
	block #15 ; 'P'
	block #16 ; 'Q'
	block #17 ; 'R'
	block #18 ; 'S'
	block #19 ; 'T'
	block #20 ; 'U'
	block #21 ; 'V'
	block #22 ; 'W'
	block #23 ; 'X'
	block #24 ; 'Y'
	block #25 ; 'Z'
	block 6
	block #26 ; 'a'
	block #27 ; 'b'
	block #28 ; 'c'
	block #29 ; 'd'
	block #30 ; 'e'
	block #31 ; 'f'
	block #32 ; 'g'
	block #33 ; 'h'
	block #34 ; 'i'
	block #35 ; 'j'
	block #36 ; 'k'
	block #37 ; 'l'
	block #38 ; 'm'
	block #39 ; 'n'
	block #40 ; 'o'
	block #41 ; 'p'
	block #42 ; 'q'
	block #43 ; 'r'
	block #44 ; 's'
	block #45 ; 't'
	block #46 ; 'u'
	block #47 ; 'v'
	block #48 ; 'w'
	block #49 ; 'x'
	block #50 ; 'y'
	block #51 ; 'z'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HuffToBase64Table :
	block #0
	block #1
	block #2
	block #3
	block #4
	block #5
	block #6
	block #7
	block #8
	block #9
	block #10
	block #11
	block #12
	block #13
	block #14
	block #15
	block #16
	block #17
	block #18
	block #19
	block #20
	block #21
	block #22
	block #23
	block #24
	block #25
	block #26
	block #27
	block #28
	block #29
	block #30
	block #31
	block #32
	block #33
	block #34
	block #35
	block #36
	block #37
	block #38
	block #39
	block #40
	block #41
	block #42
	block #43
	block #44
	block #45
	block #46
	block #47
	block #48
	block #49
	block #50
	block #51
	block #52
	block #53
	block #54
	block #55
	block #56
	block #57
	block #58
	block #59
	block #60
	block #61
	block #62
 	 block #63
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
loadBase64ToBinary :
	; Base64ToBinary is a table that has the binary
	; equivalent of each base64 decimal.
	; It looks like this:
	; 0 | 1 | 2 | 3 | ... | 62 | 63
	; 000000|000001|000010|000011|...|111110|111111|
	load #Base64ToBinary R3
	load #1 R4
	add R3 #11 R3
	store R4 R3
	add R3 #5 R3
	store R4 R3
	add R3 #6 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #4 R3
	store R4 R3
	add R3 #6 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #4 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #5 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #6 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #4 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #5 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #4 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #6 R3
	store R4 R3
	add R3 #4 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #4 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #5 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #4 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #6 R3
	store R4 R3
	add R3 #5 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #4 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #4 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #4 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #5 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #4 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #4 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #3 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #2 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
	add R3 #1 R3
	store R4 R3
  jump printingStation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Halt :
  halt
