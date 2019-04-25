MYDATA SEGMENT
    STRING DB 'COAQOC$'
    A DB "NOT PALINDROME$"
    B DB "PLAINDROME$"
MYDATA ENDS

MYCODE SEGMENT
    ASSUME DS:MYDATA, CS:MYCODE
    START: 
    MOV AX,MYDATA
    MOV DS,AX
    LEA SI,STRING
    LEA BX,STRING
    
L1: CMP [SI],'$'          ;SI-END
    JE DONE 
    INC SI
    JMP L1
    
    
DONE: DEC SI
      MOV DX,0 
      
PALI: CMP BX,SI
      JAE COMPL
      MOV AL,[BX]
      MOV AH,[SI]
      CMP AL,[SI] 
      JE INCR
      MOV DX,0 
      JMP COMPL
  
INCR: INC DX
      INC BX
      DEC SI
      JMP PALI

COMPL: CMP DX,0
       JE NOTFOUND
       LEA DX,B
        MOV AH,9
        INT 21H  
 HLT      
NOTFOUND:LEA DX,A
        MOV AH,9
        INT 21H   
        
        
MYCODE ENDS
END START