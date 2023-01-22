PSECT udata_acs
Contador1: DS 1		    ;reserva 1 byte
Contador2: DS 1             ;reserva 1 byte
PSECT code
;Donde debemos tener encuenta que 1Tcy = 1us 
;Retardo de 10us
;10us -->(6+4k)
Delay_10us:                  ;2 Tcy
    MOVLW   1                ;1 Tcy
    MOVWF   Contador1,0    ;1 Tcy
Loop10us:
    NOP                      ;k*Tcy
    DECFSZ Contador1,1,0     ;(k-1)+3Tcy
    GOTO   Loop10us          ;(k-1)*2Tcy
    RETURN                   ;2 Tcy
;Retardo de 25us
;25us -->(3k+7)
Delay_25us:                  ;2 Tcy
    MOVLW  6                 ;1 Tcy
    MOVWF  Contador1,0      ;1 Tcy
    NOP                      ;1 Tcy
Loop25us:             
    DECFSZ Contador1,1,0     ;(k-1)+3Tcy
    GOTO   Loop25us          ;(k-1)*2Tcy
    RETURN                   ;2Tcy
;Retardo de 50us
;50us -->(4k+6)
Delay_50us:                  ;2 Tcy
    MOVLW   11               ;1 Tcy
    MOVWF   Contador1,0    ;1 Tcy
Loop50us:
    NOP                      ;k*Tcy
    DECFSZ Contador1,1,0     ;(k-1)+3Tcy
    GOTO   Loop50us         ;(k-1)*2Tcy
    RETURN                   ;2 Tcy
;Retardo de 100us
;100us -->(3k+7)
Delay_100us:                 ;2 Tcy               
    MOVLW  31                ;1 Tcy
    MOVWF  Contador1,0      ;1 Tcy
    NOP                      ;1 Tcy
Loop100us:             
    DECFSZ Contador1,1,0     ;(k-1)+3Tcy
    GOTO   Loop100us          ;(k-1)*2Tcy
    RETURN                   ;2Tcy
;Retardo de 200us
;200us -->(4K+8)
Delay_200us:                 ;2 Tcy
    MOVLW  48                ;1 Tcy
    MOVWF  Contador1,0      ;1 Tcy
    NOP                      ;1 Tcy
    NOP                      ;1 Tcy
Loop200us:
    NOP                      ;K*Tcy
    DECFSZ Contador1,1,0     ;(k-1)+3Tcy
    GOTO   Loop200us          ;(k-1)*2Tcy
    RETURN                   ;2Tcy
;Retardo de 250us
;250us -->(3k+7)
Delay_250us:                 ;2 Tcy               
    MOVLW  81                ;1 Tcy
    MOVWF  Contador1,0      ;1 Tcy
    NOP                      ;1 Tcy
Loop250us:             
    DECFSZ Contador1,1,0     ;(k-1)+3Tcy
    GOTO   Loop250us         ;(k-1)*2Tcy
    RETURN                   ;2Tcy
;Retardo de 500us
;500us -->(4K+8)
Delay_500us:                 ;2 Tcy
    MOVLW  123               ;1 Tcy
    MOVWF  Contador1,0      ;1 Tcy
    NOP                      ;1 Tcy
    NOP                      ;1 Tcy
Loop500us:
    NOP                      ;K*Tcy
    DECFSZ Contador1,1,0     ;(k-1)+3Tcy
    GOTO   Loop500us          ;(k-1)*2Tcy
    RETURN                   ;2Tcy
;Retardo de 1ms
;1ms 
Delay_1ms:               ; 2 Tcy
    MOVLW   1            ; 1 Tcy --k2
    MOVWF   Contador2,0  ; 1 Tcy
Ext_Loop1ms:
    MOVLW   249          ;1 Tcy--k1
    MOVWF   Contador1,0  ;1 Tcy
Int_Loop1ms:
    NOP                  ; k1*Tcy
    DECFSZ Contador1,1,0 ; (k1-1)+3Tcy
    GOTO Int_Loop1ms        ; (k1-1)*2Tcy
    DECFSZ  Contador2,1,0
    GOTO  Ext_Loop1ms
    RETURN		  ;2 Tcy
;Retardo de 5ms
;5ms 
Delay_5ms:                ; 2 Tcy
    MOVLW   5             ; 1 Tcy --k2
    MOVWF   Contador2,0   ; 1 Tcy
Ext_Loop5ms:
    MOVLW   249           ;1 Tcy--k1
    MOVWF   Contador1,0   ;1 Tcy
Int_Loop5ms:
    NOP                   ; k1*Tcy
    DECFSZ Contador1,1,0  ; (k1-1)+3Tcy
    GOTO Int_Loop5ms         ; (k1-1)*2Tcy
    DECFSZ  Contador2,1,0
    GOTO  Ext_Loop5ms
    RETURN		  ;2 Tcy
;Retardo 10ms
;10ms 
Delay_10ms:               ; 2 Tcy
    MOVLW   10            ; 1 Tcy --k2
    MOVWF   Contador2,0   ; 1 Tcy
Ext_Loop10ms:
    MOVLW   249           ;1 Tcy--k1
    MOVWF   Contador1,0   ;1 Tcy
Int_Loop10ms:
    NOP                   ; k1*Tcy
    DECFSZ Contador1,1,0  ; (k1-1)+3Tcy
    GOTO Int_Loop10ms         ; (k1-1)*2Tcy
    DECFSZ  Contador2,1,0
    GOTO  Ext_Loop10ms
    RETURN		  ;2 Tcy
;Retardo de 25ms
;25ms 
Delay_25ms:               ; 2 Tcy
    MOVLW   25            ; 1 Tcy --k2
    MOVWF   Contador2,0   ; 1 Tcy
Ext_Loop25ms:
    MOVLW   249           ;1 Tcy--k1
    MOVWF   Contador1,0   ;1 Tcy
Int_Loop25ms:
    NOP                   ; k1*Tcy
    DECFSZ Contador1,1,0  ; (k1-1)+3Tcy
    GOTO Int_Loop25ms        ; (k1-1)*2Tcy
    DECFSZ  Contador2,1,0
    GOTO  Ext_Loop25ms
    RETURN		  ;2 Tcy
;Retardo de 50ms
;50ms 
Delay_50ms:               ; 2 Tcy
    MOVLW   50            ; 1 Tcy --k2
    MOVWF   Contador2,0   ; 1 Tcy
Ext_Loop50ms:
    MOVLW   249           ;1 Tcy--k1
    MOVWF   Contador1,0   ;1 Tcy
Int_Loop50ms:
    NOP                   ; k1*Tcy
    DECFSZ Contador1,1,0  ; (k1-1)+3Tcy
    GOTO Int_Loop50ms         ; (k1-1)*2Tcy
    DECFSZ  Contador2,1,0
    GOTO  Ext_Loop50ms
    RETURN		  ;2 Tcy
;Retardo de 100ms
;100ms -->(
Delay_100ms:              ; 2 Tcy
    MOVLW   100           ; 1 Tcy --k2
    MOVWF   Contador2,0   ; 1 Tcy
Ext_Loop100ms:
    MOVLW   249           ;1 Tcy--k1
    MOVWF   Contador1,0   ;1 Tcy
Int_Loop100ms:
    NOP                   ; k1*Tcy
    DECFSZ Contador1,1,0  ; (k1-1)+3Tcy
    GOTO Int_Loop100ms        ; (k1-1)*2Tcy
    DECFSZ  Contador2,1,0
    GOTO  Ext_Loop100ms
    RETURN		  ;2 Tcy
;Retardo de 200ms
;200ms 
Delay_200ms:              ; 2 Tcy
    MOVLW   200           ; 1 Tcy --k2
    MOVWF   Contador2,0   ; 1 Tcy
Ext_Loop200ms:
    MOVLW   249           ;1 Tcy--k1
    MOVWF   Contador1,0   ;1 Tcy
Int_Loop200ms:
    NOP                   ; k1*Tcy
    DECFSZ Contador1,1,0  ; (k1-1)+3Tcy
    GOTO Int_Loop200ms         ; (k1-1)*2Tcy
    DECFSZ  Contador2,1,0
    GOTO  Ext_Loop200ms
    RETURN		  ;2 Tcy
;Retardo de 250ms    
;250ms 
Delay_250ms:              ; 2 Tcy
    MOVLW   250           ; 1 Tcy --k2
    MOVWF   Contador2,0   ; 1 Tcy
   ;T=(6+4k)us            ; 1Tcy=1us
Ext_Loop250ms:
    MOVLW   249           ;1 Tcy--k1
    MOVWF   Contador1,0   ;1 Tcy
Int_Loop250ms:
    NOP                   ; k1*Tcy  
    DECFSZ Contador1,1,0  ; (k1-1)+3Tcy
    GOTO Int_Loop250ms         ; (k1-1)*2Tcy
    DECFSZ Contador2,1,0
    GOTO   Ext_Loop250ms
    RETURN		  ;2 Tcy



