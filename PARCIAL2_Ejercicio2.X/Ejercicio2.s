;-------------------------------------------------------------------------------
;@file:        Ejercicio2.s
;@date:        30/01/2023
;@brief:       el programa implementado inicia con el led de la placa prendiendo y 
;              y apagando con un retardo de 500ms  , siembargo en el momento  de presionar el pulsador 
;              inicia un secuencia de leds establecida prendiendo: RC0 Y RC7 ,RC1 Y RC6
;              RC2 Y RC5 ,RC3 Y RC4  Se apagan todos y luego empieza RC4 Y RC3 .RC2 Y RC5 
;              RC1 Y RC6 ,RC0 Y RC7 se apagan todos asi sucesivamente , la secuencia se detiene
;              luego de 5 repeticiones o que el pulsador RB4 Se presione , con el pulsador 
;              RF2 se reinicia la secuencia ,Se apaga los leds  ,recordar 
;               que el retardo entre los leds es 250 ms ,la frecuencia del oscilador es de 4MHz,
;              tener encuenta que hemos remapeado las INT0--RA3 ;INT1--RB4 ;INT2--RF2 .
;@author:      Rumiche Chunga Gian Pierre Alexis
;@group :      Grupo 6
;------------------------------------------------------------------------------  
   
PROCESSOR 18F57Q84
#include "Bit_Configuracion.inc"   ;/config statements should precede project file includes./
#include <xc.inc>
#include "Retardos.inc"

PSECT udata_acs		    ;PSECT para utilizar el Access RAM
offset: DS	1	    ;Reserva (DS) un byte en Access RAM
counter: DS	1	    ;Reserva (DS) un byte en Access RAM
repeat_5: DS	1           ;Reserva (DS) un byte en Access RAM
Stop: DS	1           ;Reserva (DS) un byte en Access RAM
Resetear: DS	1           ;Reserva (DS) un byte en Access RAM
LED_Muestreo: DS 1          ;Reserva (DS) un byte en Access RAM
    
PSECT resetVect,class=CODE,reloc=2  
resetVect:
    GOTO Main  

PSECT ISRVectlowpriority,class=CODE,reloc=2    ;Codigo de INT0 -->Prioridad baja
ISRVectlowpriority:
    MOVLW   0x00         ;0x00--> w
    MOVWF   Stop,0       ;(w)-->Stop
    MOVWF   Resetear,0   ;(w)--> Resetear
    MOVLW   0x05         ; 0x05-->W
    MOVWF   repeat_5,0   ;(w)-->repeat_5
    BTFSS   PIR1,0,0	 ;¿Se ha producido la INT0?
    GOTO    ExitInt0     ;salta a la etiqueta Exit
    GOTO    Reload       ;salta a la etiqueta Reload 
ExitInt0:    
    RETFIE		    ;Retorno de interrupcion 
        
PSECT ISRVecthighpriority,class=CODE,reloc=2  ;Codigo INT1, INT2 --> Alta prioridad
ISRVecthighpriority:
    BTFSC   PIR6,0,0	    ;¿Se ha producido la INT1?
    GOTO    STOP_led_INT1   ;salta a la etiqueta STOP_led_INT1
Apagar_leds:
    BTFSC   PIR10,0,0       ;¿Se ha producido la INT2?
    BCF	    PIR10,0,0       ; limpiamos el flag de INT2
    CLRF    LATC,1
    SETF    Resetear,0
Exit_Int12:
    RETFIE  
   
PSECT CODE  
Main:
    ;Salto a Subrutinas
    CAll    Config_OSC,1    ;salta a la subrutina Config_OSC
    CALL    Config_PORT,1   ;Salta a la subrutina Config_PORT
    CALL    Config_PPS,1    ;Salta a la subrutina Config_PPS
    CALL    Config_INTX,1   ;Salta a la subrutina Config_INTX

LED_PIC:
    ;Programa principal
    CALL    Delay_250ms     ;retardo de 250ms
    CALL    Delay_250ms     ;retardo de 250ms
    BSF	    LATF,3,0        ;se apaga el led
    CALL    Delay_250ms     ;retardo de 250ms
    CALL    Delay_250ms     ;retardo de 250ms
    BCF	    LATF,3,0        ;se prende el led
    GOTO    LED_PIC         ;saltamos a la etiqueta LED_PIC

Reload:
    BCF	    PIR1,0,0	    ;Limpiamos el flag
    MOVLW   0x0A	    ;Definimos el counter
    MOVWF   counter,0	    ; (w)-->counter lo guardamos en el registro counter
    MOVLW   0x00            ;0x00-->w
    MOVWF   offset,0	    ;Valor inicial del offset es cero
    GOTO    Loop            ;salta  a la etiqueta Loop
    
Loop:   
    BANKSEL PCLATU
    MOVLW   low highword(Table)
    MOVWF   PCLATU,1
    MOVLW   high(Table)
    MOVWF   PCLATH,1
    RLNCF   offset,0,0	    
    CALL    Table
    BTFSC   Resetear,1,0  ;si Resetear es cero va a saltar a la sgte de instruccion
    GOTO    ExitInt0 
    BTFSC   Stop,1,0      ;si Stop es cero va a saltar a la sgte de instruccion
    GOTO    ExitInt0      ;salta a la etiqueta ExitInt0
    MOVWF   LATC,0
    MOVWF   LED_Muestreo,0
    CALL    Delay_250ms
    DECFSZ  counter,1,0   ;si counter es cero va a saltar a la sgte de instruccion
    GOTO    SEC_Offset       ;;salta a la etiqueta NEW_SEQ
      

REPETICIONES_5:
    DECFSZ  repeat_5,1,0  ;repeat_5 si al decrementarle uno  y no es 0 salta  a la siguiente instruccioon
    GOTO    Reload        ;Salta a la etiqueta Reload
    GOTO    ExitInt0      ;Salta a la etiqueta ExitInt0
    
    
SEC_Offset:
    INCF    offset,1,0     ;le incrementamos en uno al offset
    GOTO    Loop           ;salta a la etiqueta Loop

   
Table:
    ;Tabla de corrimiento de leds
    ADDWF   PCL,1,0	    ;(w) + PCL  = (offset) + PCL
    RETLW   10000001B	    ;offset: 0
    RETLW   01000010B	    ;offset: 1
    RETLW   00100100B	    ;offset: 2
    RETLW   00011000B	    ;offset: 3
    RETLW   00000000B	    ;offset: 4
    RETLW   00011000B	    ;offset: 5
    RETLW   00100100B	    ;offset: 6
    RETLW   01000010B	    ;offset: 7
    RETLW   10000001B	    ;offset: 8
    RETLW   00000000B	    ;offset: 9
    RETURN  
    

STOP_led_INT1:
    BCF	    PIR6,0,0	    ;Limpiamos el falg de la INT1
    MOVF    LED_Muestreo,0,0  ;me muestra el valor en el que se quedo la secuencia
    MOVWF   LATC,1            ;lo muevo al puerto C
    SETF    Stop,0            ;se pone en 1 la  variable Stop
    GOTO    Exit_Int12       ;Salta a la etiqueta Exit_Int12
    

 ;Configuraciones del oscilador ,Puertos, configuracion PPS,Configuracion instruccion  
;Subrutinas
Config_OSC:
    BANKSEL OSCCON1 
    MOVLW   0x60
    MOVWF   OSCCON1,1 ;SELECIONAMOS EL BLOQUE DEL OSCILADOR INTERNO CON UN DIV:1
    MOVLW   0x02
    MOVWF   OSCFRQ,1 ;SELECIONAMOS UNA FRECUENCIA DE 4MHZ
    RETURN
    
Config_PORT:
    ;Configuracion del led del pic 
    BANKSEL PORTF	
    BCF	    PORTF,3,1   ;RF3 cada vez que vea un 0 va a encender RF3=1
    BSF	    LATF,3,1    ;RF3 estado inicial en 1
    CLRF    ANSELF,1    ;RF3 como digital 
    BCF	    TRISF,3,1   ;RB4 como salida 
    
    ;Configuracion de button RF2
    BCF	    PORTF,2,1   ;RF3=1
    BSF	    TRISF,2,1   ;Habilitar RF2 como entrada
    BSF	    WPUF,2,1    ;Habilitar la resistencia  pull-up

    ;Configuracion de button RB4
    BANKSEL PORTB 
    BCF    PORTB,4,1      ;
    BCF    ANSELB,4,1     ;RB4 DIGITAL
    BSF     TRISB,4,1     ; RB4 como  Entrada 
    BSF	    WPUB,4,1      ;habilitar la resistencia pull-up
    ;Configuracion de button del uC   
    BANKSEL PORTA	
    BCF	    PORTA,3,1    ;
    CLRF    ANSELA,1     ;PORTA DIGITAL
    BSF	    TRISA,3,1    ;RA3 COMO ENTRADA
    BSF	    WPUA,3,1     ;habilitar la resistencia pull-up
    
    ;habilitacion del puerto C para los leds :
    BANKSEL PORTC	
    SETF    PORTC,1     
    CLRF    LATC,1      
    CLRF    ANSELC,1    ;PORTC DIGITAL
    CLRF    TRISC,1     ;PORTC COMO SALIDA 
    RETURN
       
Config_PPS:
    BANKSEL INT0PPS
    MOVLW   0x03        ;0x03-->(w)
    MOVWF   INT0PPS,1	;INT0 --> RA3
    
    BANKSEL INT1PPS
    MOVLW   0x0C        ;0x0C-->(w)
    MOVWF   INT1PPS,1	;INT1 --> RB4
    
    BANKSEL INT2PPS
    MOVLW   0x2A        ;0x2A-->(w)
    MOVWF   INT2PPS,1	;INT2 --> RF2
    RETURN
    
     
Config_INTX:
;   Secuencia para configurar interrupcion:
;    1. Definir prioridades
;    2. Configurar interrupcion
;    3. Limpiar el flag
;    4. Habilitar la interrupcion
;    5. Habilitar las interrupciones globales
    
    BSF	    INTCON0,5,0 ;INTCON0<IPEN> = 1 --> Habilitar prioridades
    BANKSEL IPR1
    BCF	    IPR1,0,1    ;IPR1<INT0IP> = 0 --> INT0 de baja prioridad
    BSF	    IPR6,0,1    ;IPR6<INT1IP> = 1 --> INT1 de alta prioridad
    BSF	    IPR10,0,1   ;IPR10<INT2IP> = 1 --> INT2 de alta prioridad
    
   ;Config. INT0
    BCF	INTCON0,0,0 ; INTCON0<INT0EDG> = 0 --> INT0 por flanco de bajada
    BCF	PIR1,0,0    ; PIR1<INT0IF> = 0 -- limpiamos el flag de interrupcion
    BSF	PIE1,0,0    ; PIE1<INT0IE> = 1 -- habilitamos la interrupcion ext0
    
    
   ;Config. INT1
    BCF	INTCON0,1,0 ; INTCON0<INT1EDG> = 0 --> INT0 por flanco de bajada
    BCF	PIR6,0,0    ; PIR6<INT1IF> = 0 -- limpiamos el flag de interrupcion
    BSF	PIE6,0,0    ; PIE6<INT1IE> = 1 -- habilitamos la interrupcion ext1
   
   
   
   ;Config. INT2
    BCF	INTCON0,2,0 ; INTCON0<INT2EDG> = 0 --> INT0 por flanco de bajada
    BCF	PIR10,0,0    ; PIR10<INT2IF> = 0 -- limpiamos el flag de interrupcion
    BSF	PIE10,0,0    ; PIE10<INT2IE> = 1 -- habilitamos la interrupcion ext2
    
   ;Config. GLOBAL
    BSF	INTCON0,7,0 ; INTCON0<GIE/GIEH> = 1 -- habilitamos las interrupciones de forma global
    BSF	INTCON0,6,0 ; INTCON0<GIEL> = 1 -- habilitamos las interrupciones de baja prioridad
    RETURN
        
END resetVect


