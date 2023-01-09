;-------------------------------------------------------------------------------
;@file:        Retardos.inc
;@author:      Rumiche Chunga Gian Pierre Alexis
;@date:        08/01/2023
;@Tarjeta:     Curiosity  Nano PIC18f57q84
;@brief:        El presente programa esta elaborado para la implementacion de
;           los retardos en ms como en us,la frecuencia del oscilador es de 4MHz.
;@Version and program:  MPLAB X IDE v6.00
;------------------------------------------------------------------------------   
    
PSECT udata_acs
Contador1: DS 1		    ;reserva 1 byte
Contador2: DS 1             ;reserva 1 byte
PSECT code
;Retardo de 10us
;10us -->(6+4k)
Delay_10us:                  ;2 Tcy
    MOVLW   1                ;1 Tcy
    MOVWF   Contador1,1,0    ;1 Tcy
Ext_Loop:
    NOP                      ;k*Tcy
    DECFSZ Contador1,1,0     ;(k-1)+3Tcy
    GOTO   Ext_Loop          ;(k-1)*2Tcy
    RETURN                   ;2 Tcy
;Retardo de 25us
;25us -->(3k+7)
Delay_25us:                  ;2 Tcy
    MOVLW  6                 ;1 Tcy
    MOVWF  Contador,1,0      ;1 Tcy
    NOP                      ;1 Tcy
Ext_Loop:             
    DECFSZ Contador1,1,0     ;(k-1)+3Tcy
    GOTO   Ext_Loop          ;(k-1)*2Tcy
    RETURN                   ;2Tcy
;Retardo de 50us
;50us -->(4k+6)
Delay_50us:                  ;2 Tcy
    MOVLW   11               ;1 Tcy
    MOVWF   Contador1,1,0    ;1 Tcy
Ext_Loop:
    NOP                      ;k*Tcy
    DECFSZ Contador1,1,0     ;(k-1)+3Tcy
    GOTO   Ext_Loop          ;(k-1)*2Tcy
    RETURN                   ;2 Tcy
;Retardo de 100us
;100us -->(3k+7)
Delay_100us:                 ;2 Tcy               
    MOVLW  31                ;1 Tcy
    MOVWF  Contador,1,0      ;1 Tcy
    NOP                      ;1 Tcy
Ext_Loop:             
    DECFSZ Contador1,1,0     ;(k-1)+3Tcy
    GOTO   Ext_Loop          ;(k-1)*2Tcy
    RETURN                   ;2Tcy
;Retardo de 200us
;200us -->(4K+8)
Delay_200us:                 ;2 Tcy
    MOVLW  48                ;1 Tcy
    MOVWF  Contador,1,0      ;1 Tcy
    NOP                      ;1 Tcy
    NOP                      ;1 Tcy
Ext_Loop:
    NOP                      ;K*Tcy
    DECFSZ Contador1,1,0     ;(k-1)+3Tcy
    GOTO   Ext_Loop          ;(k-1)*2Tcy
    RETURN                   ;2Tcy
;Retardo de 250us
;250us -->(3k+7)
Delay_250us:                 ;2 Tcy               
    MOVLW  81                ;1 Tcy
    MOVWF  Contador,1,0      ;1 Tcy
    NOP                      ;1 Tcy
Ext_Loop:             
    DECFSZ Contador1,1,0     ;(k-1)+3Tcy
    GOTO   Ext_Loop          ;(k-1)*2Tcy
    RETURN                   ;2Tcy
;Retardo de 500us
;500us -->(4K+8)
Delay_500us:                 ;2 Tcy
    MOVLW  123               ;1 Tcy
    MOVWF  Contador,1,0      ;1 Tcy
    NOP                      ;1 Tcy
    NOP                      ;1 Tcy
Ext_Loop:
    NOP                      ;K*Tcy
    DECFSZ Contador1,1,0     ;(k-1)+3Tcy
    GOTO   Ext_Loop          ;(k-1)*2Tcy
    RETURN                   ;2Tcy
;Retardo de 1ms
;1ms 
Delay_1ms:               ; 2 Tcy
    MOVLW   1            ; 1 Tcy --k2
    MOVWF   Contador2,0  ; 1 Tcy
Ext_Loop:
    MOVLW   249          ;1 Tcy--k1
    MOVWF   Contador1,0  ;1 Tcy
Int_Loop:
    NOP                  ; k1*Tcy
    DECFSZ Contador1,1,0 ; (k1-1)+3Tcy
    GOTO Int_Loop        ; (k1-1)*2Tcy
    DECFSZ  Contador2,1,0
    GOTO  Ext_Loop
    RETURN		  ;2 Tcy
;Retardo de 5ms
;5ms 
Delay_5ms:                ; 2 Tcy
    MOVLW   5             ; 1 Tcy --k2
    MOVWF   Contador2,0   ; 1 Tcy
Ext_Loop:
    MOVLW   249           ;1 Tcy--k1
    MOVWF   Contador1,0   ;1 Tcy
Int_Loop:
    NOP                   ; k1*Tcy
    DECFSZ Contador1,1,0  ; (k1-1)+3Tcy
    GOTO Int_Loop         ; (k1-1)*2Tcy
    DECFSZ  Contador2,1,0
    GOTO  Ext_Loop
    RETURN		  ;2 Tcy
;Retardo 10ms
;10ms 
Delay_10ms:               ; 2 Tcy
    MOVLW   10            ; 1 Tcy --k2
    MOVWF   Contador2,0   ; 1 Tcy
Ext_Loop:
    MOVLW   249           ;1 Tcy--k1
    MOVWF   Contador1,0   ;1 Tcy
Int_Loop:
    NOP                   ; k1*Tcy
    DECFSZ Contador1,1,0  ; (k1-1)+3Tcy
    GOTO Int_Loop         ; (k1-1)*2Tcy
    DECFSZ  Contador2,1,0
    GOTO  Ext_Loop
    RETURN		  ;2 Tcy
;Retardo de 25ms
;25ms 
Delay_25ms:               ; 2 Tcy
    MOVLW   25            ; 1 Tcy --k2
    MOVWF   Contador2,0   ; 1 Tcy
Ext_Loop:
    MOVLW   249           ;1 Tcy--k1
    MOVWF   Contador1,0   ;1 Tcy
Int_Loop:
    NOP                   ; k1*Tcy
    DECFSZ Contador1,1,0  ; (k1-1)+3Tcy
    GOTO Int_Loop         ; (k1-1)*2Tcy
    DECFSZ  Contador2,1,0
    GOTO  Ext_Loop
    RETURN		  ;2 Tcy
;Retardo de 50ms
;50ms 
Delay_50ms:               ; 2 Tcy
    MOVLW   50            ; 1 Tcy --k2
    MOVWF   Contador2,0   ; 1 Tcy
Ext_Loop:
    MOVLW   249           ;1 Tcy--k1
    MOVWF   Contador1,0   ;1 Tcy
Int_Loop:
    NOP                   ; k1*Tcy
    DECFSZ Contador1,1,0  ; (k1-1)+3Tcy
    GOTO Int_Loop         ; (k1-1)*2Tcy
    DECFSZ  Contador2,1,0
    GOTO  Ext_Loop
    RETURN		  ;2 Tcy
;Retardo de 100ms
;100ms -->(
Delay_100ms:              ; 2 Tcy
    MOVLW   100           ; 1 Tcy --k2
    MOVWF   Contador2,0   ; 1 Tcy
Ext_Loop:
    MOVLW   249           ;1 Tcy--k1
    MOVWF   Contador1,0   ;1 Tcy
Int_Loop:
    NOP                   ; k1*Tcy
    DECFSZ Contador1,1,0  ; (k1-1)+3Tcy
    GOTO Int_Loop         ; (k1-1)*2Tcy
    DECFSZ  Contador2,1,0
    GOTO  Ext_Loop
    RETURN		  ;2 Tcy
;Retardo de 200ms
;200ms 
Delay_200ms:              ; 2 Tcy
    MOVLW   200           ; 1 Tcy --k2
    MOVWF   Contador2,0   ; 1 Tcy
Ext_Loop:
    MOVLW   249           ;1 Tcy--k1
    MOVWF   Contador1,0   ;1 Tcy
Int_Loop:
    NOP                   ; k1*Tcy
    DECFSZ Contador1,1,0  ; (k1-1)+3Tcy
    GOTO Int_Loop         ; (k1-1)*2Tcy
    DECFSZ  Contador2,1,0
    GOTO  Ext_Loop
    RETURN		  ;2 Tcy
;Retardo de 250ms    
;250ms 
Delay_250ms:              ; 2 Tcy
    MOVLW   250           ; 1 Tcy --k2
    MOVWF   Contador2,0   ; 1 Tcy
   ;T=(6+4k)us            ; 1Tcy=1us
Ext_Loop:
    MOVLW   249           ;1 Tcy--k1
    MOVWF   Contador1,0   ;1 Tcy
Int_Loop:
    NOP                   ; k1*Tcy
    DECFSZ Contador1,1,0  ; (k1-1)+3Tcy
    GOTO Int_Loop         ; (k1-1)*2Tcy
    DECFSZ Contad0or2,1,0
    RETURN		  ;2 Tcy


