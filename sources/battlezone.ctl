; Copyright Quicksilva Ltd 1984, 2024 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @org=$4000
b $4000 Loading Screen
D $4000 #UDGTABLE { =h Battlezone Loading Screen. } { #SCR$02(loading) } UDGTABLE#
@ $4000 label=Loading
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

c $8000
  $805B,$01 Return.

c $805C

c $8660

c $88EA

c $8C3C
N $8C3C #PUSHS #UDGTABLE { #SIM(start=$8C3C,stop=$8C84)#SCR$02(test) } UDGTABLE# #POPS

b $8CA0

c $94EC

c $977E

c $AD0C
  $AD0C,$01 Disable interrupts.
  $AD0D,$0B Copy #N($0024,$04,$04) bytes from #R$8CA0 to #R$F700.
  $AD18,$03 Jump to #R$B1F4.

b $AD1B

c $AD3E

c $B1F4
  $B1F4,$05 FLASH: OFF.
  $B1F9,$06 BRIGHT: ON.
  $B1FF,$05 INVERSE: OFF.
  $B204,$05 OVER: OFF.
  $B209,$03 Call #R$8000.
  $B20C,$0D Write #N$00 to #N$1800 bytes of the screen buffer, starting at #N$4000.
  $B219,$0D Write #COLOUR$44 to #N($0300,$04,$04) bytes of the attribute buffer, starting at #N$5800.
  $B226,$0D Write #N$00 to #N($00FF,$04,$04) bytes, starting from #R$FE00.
  $B233,$06 #HTML(Write #R$C9B4(#N$C8B4) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $B239,$06 Write #N$6400 to *#R$FE60.
  $B23F,$09 Write #N($0000,$04,$04) to: #LIST { #R$FE5E } { #R$FE62 } LIST#
  $B248,$05 Write #N$30 to *#R$FE68.
  $B24D,$06 Write #N$CA28 to *#R$FE42.
  $B253,$06 Write #N$CA5E to *#R$FE46.

  $B286,$03 Call #R$88EA.

  $B2A1,$02 #REGa=#N$16.
  $B2A3,$03 Call #R$8660.

  $B2F2,$03 Jump to #R$B2D5.

c $B2F5

c $B55D
  $B55D,$03 Call #R$977E.
  $B560,$06 Write #N$50AB to *#R$94EF(#N$94F0).
  $B566,$03 #REGhl=*#R$FE76.
  $B569,$03 Call #R$94EC.
  $B56C,$03 #REGhl=#R$C2B6.
  $B56F,$02 #REGb=#N$13.
  $B571,$03 Call #R$B66C.
  $B574,$09 PRINT AT #N$15#RAW(,) #N$10.
  $B57D,$09 POINT #N$08#RAW(,) #N$53.
  $B586,$01 Return.

c $B587

  $B663,$06 #HTML(Write <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $B669,$03 Jump to #R$B676.

c $B66C Print Characters
R $B66C HL Address of text
R $B66C B Number of characters to print
@ $B66C label=PrintCharacters
  $B66C,$01 Load the character from *#REGhl into #REGa.
  $B66D,$02 Stash the string pointer and character counter on the stack.
  $B66F,$01 Print the character to the screen.
  $B670,$02 Restore the character counter and string pointer from the stack.
  $B672,$01 Increment the string pointer by one to point to the next character.
  $B673,$02 Decrease the character counter by one and loop back to #R$B66C until all characters have been printed.
  $B675,$01 Return.

c $B676
  $B676,$03 #REGhl=#R$C2C9.
  $B679,$02 #REGb=#N$00.
  $B67B,$03 Call #R$B66C.
  $B67E,$02 #REGb=#N$26.
  $B680,$03 Call #R$B66C.
  $B683,$02 #REGb=#N$64.

  $B689,$02,b$01 Keep only bit 1.

  $B6AA,$03 #REGhl=#R$C3EF.
  $B6AD,$02 #REGb=#N$00.
  $B6AF,$03 Call #R$B66C.
  $B6B2,$02 #REGb=#N$E2.
  $B6B4,$03 Call #R$B66C.
  $B6B7,$02 #REGb=#N$64.

  $B771,$06 #HTML(Write #R$C9B4(#N$C8B4) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $B777,$03 Jump to #R$B1F4.

c $B77A Game Entry Point
@ $B77A label=GameEntryPoint
  $B77A,$03 Jump to #R$AD0C.

b $B77D

t $C2B6
B $C2B6,$03 PRINT AT (#PEEK(#PC+$01), #PEEK(#PC+$02)).
  $C2B9,$10 "#STR(#PC,$04,$10)".
B $C2C9,$03 PRINT AT (#PEEK(#PC+$01), #PEEK(#PC+$02)).
  $C2CC,$09 "#STR(#PC,$04,$09)".
B $C3EF,$03 PRINT AT (#PEEK(#PC+$01), #PEEK(#PC+$02)).

b $C602

b $C9B4 Custom Font
@ $C9B4 label=CustomFont
  $C9B4,$08 #UDG(#PC)
L $C9B4,$08,$60

b $F700

b $FE00

g $FE42
W $FE42,$02

g $FE46
W $FE46,$02

g $FE5E

g $FE60
W $FE60,$02

g $FE62

g $FE68

g $FE76

g $FEE4 Lives
@ $FEE4 label=Lives
B $FEE4,$01

g $FEE5

c $FF27 Game Entry Point Alias
@ $FF27 label=Alias_GameEntryPoint
  $FF27,$03 Jump to #R$B77A.

u $FF2A
