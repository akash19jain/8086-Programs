MYDATA SEGMENT
    ARR1 DB 34H,35H,45H,47H
    ARR2 DB 1H,2H,29H,31H
MYDATA ENDS       

MYCODE SEGMENT
    ASSUME CS:MYCODE, DS:MYDATA
    START:
    MOV AX,MYDATA
    MOV DS,AX
    LEA SI,ARR1
    LEA BX,ARR2  
    
    MOV DI,9H
    MOV CL,4H
    MOV CH,4H
    
MERGE: MOV DL,[SI]
       CMP DL,[BX]
       JC FIRST
       MOV DL,[BX] 
       MOV [DI],DL
       INC DI
       INC BX 
       DEC CH
       CMP CH,0
       JZ DONE2 
       JMP MERGE 
           
FIRST: MOV [DI],DL
       INC DI
       INC SI 
       DEC CL
       CMP CL,0
       JZ DONE1
       JMP MERGE 
       
DONE2:  CMP CL,0 
        JZ COMPL
        MOV DL,[SI]
        MOV [DI],DL
        INC SI
        INC DI
        DEC CL
        JMP DONE2  
        
DONE1:  CMP CH,0 
        JZ COMPL
        MOV DL,[BX]
        MOV [DI],DL
        INC BX
        INC DI
        DEC CH
        JMP DONE1
        
        
        
COMPL:  HLT

MYCODE ENDS
END START