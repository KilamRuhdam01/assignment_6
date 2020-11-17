extern _GetStdHandle@4
section .data
        str:     db 'hello, world',0x0D,0x0A
        strLen:  equ $-str

MVI D, 01 ; initialize register D with 01
MVI E, 01 ; initialize register E with 01
LDA 2050     ; loads the content of memory location 2050 \\
 in accumulator A
sub D        ; subtract value of D from A.
JZ 2011    ; make jump to memory location 2011
; if zero flag is set
inr D     ; increments value of register D by 1. 
;    Since it is used two times, 
;     therefore value of D is incremented by 2
inr E     ; increments value of register E by 1
JMP 2007    ; make jump to memory location 2007
mov A, E    ; moves the value of register E in accumulator A
STA 3050    ; stores value of A in 3050
HLT        ; stops executing the program and halts 
