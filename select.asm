.MODEL SMALL
.STACK 100H
.DATA
 ARR1  DB  'VALUES ENTERED: $'
 ARR2  DB  10,13,'SORTED: $'    ;ADDED 10 AND 13 FOR NEXT LINE AND CARRIAGE RETURN
 ARRAY DB  7,2,9,5,4,8,1,3,6,0   ;10 VALUES ENTERED
.CODE
   MAIN PROC
   MOV AX, @DATA                ;USING DATA DECLARED
   MOV DS, AX
   MOV BX, 10                  ;MOVING THE NUMBER OF DIGITS INTILIZED
   MOV DX,OFFSET ARR1                ;MOVING OFFSET OF ARR1
   MOV AH, 9                   ;ARRAY PRINT SERVICE ROUTINE
   INT 21H                     ;PRINTING WHAT IS IN ARRAY

   MOV SI,OFFSET ARRAY                
   CALL DISPLAY             ;CALLING THE PROCEDURE DISPLAY
   MOV SI,OFFSET ARRAY                
   CALL SORTING             ;CALLING THE PROCEDURE SORTING
   MOV DX,OFFSET ARR2                ;MOVING OFFSET OF ARR2
   MOV AH, 9                   ;PRINT SERVICE ROUTINE
   INT 21H                     ;PRINTING ARRAY
   LEA SI, ARRAY                
   CALL DISPLAY             ;CALLING THE PROCEDURE DISPLAY

   MOV AH, 4CH                  ;RETURN CONTROL TO DOS   
   INT 21H
   MAIN ENDP                    ;ENDING MAIN ONLY
 
;SORTING
 SORTING PROC
   CMP BX, 1                    
   JLE SKIP              ;JUMP IF LESS THAN OR EQUAL

   DEC BX                     ;BX = BX - 1    
   MOV CX, BX                 ;SETTING CX = BX 
   MOV AX, SI                 ;SETTING AX = SI    

  OUTER_LOOP:                   ;LOOP LABEL                                ;| O
    MOV BX, CX                                                             ;|
    MOV SI, AX                                                             ;| U
    MOV DI, AX                                                             ;|
    MOV DL,[DI]                                                            ;| T
                                                                           ;|
  INNER_LOOP:                   ;LOOP LABEL                                ;| E 
   INC SI                                      ;|   I                      ;|
   CMP [SI], DL                                ;|   N                      ;| R
   JNG SKIP1                                   ;|   N                      ;|
   MOV DI, SI                                  ;|   E                      ;| L
   MOV DL, [DI]                                ;|   R                      ;|
                                               ;|   L                      ;| O
   SKIP1:                       ;LOOP LABEL    ;|   O                      ;|
   DEC BX                                      ;|   O                      ;| O
   JNZ INNER_LOOP                              ;|   P                      ;|
   MOV DL, [SI]                                                            ;| P
   XCHG DL, [DI]                                                           ;|
   MOV [SI], DL                                                            ;|
                                                                           ;|
   LOOP OUTER_LOOP                                                         ;|
   
   SKIP:                        ;LOOP LABEL
   RET                            
 SORTING ENDP

;PRINT PROCEDURE
DISPLAY PROC
   MOV CX, BX                     
PRINT:                  
   XOR AH, AH                   ;MAKING AH=0
   MOV AL, [SI]                 ;MOVING VALUE TO ACCUMALATOR REGISTER
   CALL OUTPUT                  ;CALLING THE PROCEDURE OUTPUT
   MOV AH, 2                    ;PRINTING A CHARACTER
   MOV DL, 20H                  ;ENTERING SPACEBAR ASCII TO OCCUPY MORE HORIZONTAL SPACE
   INT 21H                      
   INC SI                       
   LOOP PRINT                               
   RET                          ;RETURNING CONTROL TO PROC
 DISPLAY ENDP

;OUTPUT PROCEDURE
 OUTPUT PROC
   XOR CX, CX                     ;CX = 0
   MOV BX, 10                     
 OUTPUT1:                       
   XOR DX, DX                  ;SETTING DX = 0
   DIV BX            
   PUSH DX                     ;PUSHING ONTO STACK
   INC CX            
   OR AX, AX                   ;AX = 0
   JNE OUTPUT1                 ;JUMP IN NOT EQUAL TO ZERO
   MOV AH, 2                

   DISPLAY:                    ;LOOP LABEL
   POP DX                      ;POP OUT OF STACK
   OR DL,30H                   ;30H ASCII OF 0
   INT 21H                      
   LOOP DISPLAY                 
   
   RET                           ;RETURNING TO PROC
 OUTPUT ENDP
 END MAIN                 ;MAIN ENDS HERE