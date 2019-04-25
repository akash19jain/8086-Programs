MYDATA SEGMENT
    STRING DB 'MY NAME IS AKASH$'
MYDATA ENDS

MYCODE SEGMENT
    ASSUME CS:MYCODE, DS:MYDATA
    START:
    MOV AX,MYDATA
    MOV DS,AX
    LEA BX,STRING
    MOV SI,BX
    
L1: CMP [SI],'$'
    JE FOUND
    INC SI
    JMP L1 
    
FOUND: DEC SI


REVERSE: CMP BX,SI
         JAE  DONE
         
         MOV AL,[BX]
         MOV AH,[SI]
         MOV [SI],AL
         MOV [BX],AH
         
         INC BX
         DEC SI
JMP REVERSE

DONE: LEA DX, STRING
      MOV AH,9H
      INT 21H  
      MOV AH,0
      INT 16H  
      
RET  
MYCODE ENDS
END START