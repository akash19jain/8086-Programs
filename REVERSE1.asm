MYDATA SEGMENT
    STRING DB 'MY NAME IS AKASH$'
MYDATA ENDS

MYCODE SEGMENT
    ASSUME CS:MYCODE, DS:MYDATA
    START:
    MOV AX,MYDATA
    MOV DS,AX  
    MOV ES,AX
    MOV DI,1000H
    
    LEA BX,STRING
    MOV SI,BX
    
L1: CMP [SI],'$'
    JE FOUND
    INC SI
    JMP L1 
    
FOUND: DEC SI 
    ADD DI,SI

         STD
REVERSE: CMP BX,SI
         JAE  DONE
         MOV AL,[BX]
         STOSB
         INC BX   
         LOOP REVERSE
         
         
JMP REVERSE

DONE: LEA DX, STRING
      MOV AH,9H
      INT 21H  
      MOV AH,0
      INT 16H  
      
RET  
MYCODE ENDS
END START