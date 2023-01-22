;-------------------------------------------------------------------------------
;@file:        P1-Corrimiento_Leds.s
;@date:        15/01/2023
;@brief:       El presente programa vamos a poder observar el corriento de led 
;;             ;habiendo un retardo de 250 ms en corriemto impar,habiendo un 
 ;             retardo de 500 ms en corriemto par , habiendo 2 led el cual
 ;             podamos identificarlos corrimientos pares y impares;
 ;             sabiendo la frecuencia del oscilador es de 4MHz.
 ;@author:     Rumiche Chunga Gian Pierre Alexis
;------------------------------------------------------------------------------    
Processor 18F57Q84
#include "Bit_configuracion.inc"// config statements should precede project file includes.
#include <xc.inc>
#include "Retardos.inc"
PSECT resetvect,class=CODE,reloc=2
resetvect:
    GOTO main
PSECT CODE  
main:
    CALL config_osc,1   ;Nos lleva a la configuracion del oscilador
    CALL config_port,1  ;Nos lleva a la config_pot
    
sin_presionar:
    BTFSC PORTA,3,0  ;Nos pregunta si el boton se ha pulsado o no
    GOTO sin_presionar     ;me lleva a la etiqueta sin_presionar sale de hay hasta que se pulse
;Retardo impar de 250 ms 
Led_1:
    BCF LATE,1,1      ;led de corrimiento par  se apaga 
    BSF LATE,0,1      ;nos señala el led de corrimiento impar se prende
    BCF LATC,7,1      ;se apaga el led 8 para cumplir el programa
    BSF LATC,0,1      ;se prende el led 1 
    CALL Delay_250ms  ;Retardos de 250ms
    BTFSC PORTA,3,0   ;salta una instruccion si se presiona el pulsador
    GOTO Led_2        ;salta a la etiqueta Led_2
STOP_Led1:
    CALL Delay_250ms
    BTFSC PORTA,3,0   ;se verifica si se pulso el boton o no
    GOTO STOP_Led1   ;salta a STOP_Led1
Led_2: 
    BCF LATC,0,1     ;se apaga el Led 1
    BSF LATC,1,1     ;se prende el Led 2
    CALL Delay_250ms ;Retardo de 250 ms 
    BTFSC PORTA,3,0   ;salta una instruccion si se presiona el pulsador
    GOTO Led_3        ;salta a la etiqueta Led_3
STOP_Led2:
    CALL Delay_250ms
    BTFSC PORTA,3,0    ;se verifica si se pulsa o no el boton
    GOTO STOP_Led2     ;salta a la etiqueta STOP_Led2
Led_3:
    BCF LATC,1,1     ;se apaga el led 2 
    BSF LATC,2,1      ;se prende el led 3
    CALL Delay_250ms  ;Retardo de 250 ms
    BTFSC PORTA,3,0    ;se verifica si se pulsa o no
    GOTO Led_4       ;salta a la etiqueta Led_4
STOP_Led3:
    CALL Delay_250ms
    BTFSC PORTA,3,0   ;se verifica si se pulsa o no el boton
    GOTO STOP_Led3
Led_4:
    BCF LATC,2,1      ;se apaga el led 3
    BSF LATC,3,1      ;se prende el led 4
    CALL Delay_250ms  ;Retardo de 250 ms
    BTFSC PORTA,3,0   ;salta una instruccion si se presiona el pulsador
    GOTO Led_5        ;salta a la etiqueta Led_5
STOP_Led4:
    CALL Delay_250ms
    BTFSC PORTA,3,0  ;se verifica si se pulsa o no el boton
    GOTO STOP_Led4  
Led_5:
    BCF LATC,3,1      ;se apaga el led 4
    BSF LATC,4,1      ;se prende el led 5
    CALL Delay_250ms  ;Retardo de 250 ms
    BTFSC PORTA,3,0   ;salta una instruccion si se presiona el pulsador
    GOTO Led_6        ;salta a la etiqueta Led_6
STOP_Led5:            ;etiqueta para que se detenga el led
    CALL Delay_250ms
    BTFSC PORTA,3,0  ;si presionamos el pulsador sigue al siguente led  
    GOTO STOP_Led5
Led_6:
    BCF LATC,4,1   ;se apaga el led 5
    BSF LATC,5,1   ;se prende el led 6
    CALL Delay_250ms ;Retardo de 250 ms
    BTFSC PORTA,3,0  ;salta una instruccion si se presiona el pulsador
    GOTO Led_7
STOP_Led6:
    CALL Delay_250ms
    BTFSC PORTA,3,0  ;si presionamos el pulsador sigue al siguente led 
    GOTO STOP_Led6 
Led_7:
    BCF LATC,5,1     ;se apaga el led 6
    BSF LATC,6,1     ;se prende el led 7
    CALL Delay_250ms  
    BTFSC PORTA,3,0  ;salta una instruccion si se presiona el pulsador
    GOTO Led_8
STOP_Led7:
    CALL Delay_250ms  
    BTFSC PORTA,3,0  ;si presionamos el pulsador sigue al siguente led 
    GOTO STOP_Led7
Led_8:
    BCF LATC,6,1       ;se apaga  el led 7
    BSF LATC,7,1       ;se prende el led 8
    CALL  Delay_250ms  ;Retardo de 250 ms
    BTFSC PORTA,3,0    ;salta una instruccion si se presiona el pulsador
    GOTO LED_1par
STOP_Led8:
    CALL Delay_250ms
    BTFSC PORTA,3,0   ;si presionamos el pulsador sigue al siguente led 
    GOTO STOP_Led8 
;empieza el corriemiento Par con un retardo  de 500ms
LED_1par:
    BCF LATE,0,1     ;el led que indica los corrientos impares se apaga
    BSF LATE,1,1     ;el led que indica los corrientos pares se prende
    BCF LATC,7,1     ;el led 8 se aapga
    BSF LATC,0,1     ;el led 1 se prende
    CALL Delay_250ms 
    BTFSC PORTA,3,0  ;nos pregunta si el boton se ah pulsado o no
    GOTO LED_2par   
STOP1:
    CALL Delay_250ms
    BTFSC PORTA,3,0  ;Nos pregunta si el boton se ah pulsado o no
    GOTO STOP1
LED_2par: 
    CALL Delay_250ms
    BCF LATC,0,1     ;se apaga el led 1
    BSF LATC,1,1     ;se prende el led 2
    CALL Delay_250ms
    BTFSC PORTA,3,0  ;Nos pregunta si el boton se ha pulsado o no
    GOTO LED_3par    
STOP2:
    CALL Delay_250ms
    BTFSC PORTA,3,0  ;Nos pregunta si el boton se ha pulsado o no
    GOTO STOP2
LED_3par:
    CALL Delay_250ms
    BCF LATC,1,1     ;se apaga el 2 
    BSF LATC,2,1     ;se prende el led 3
    CALL Delay_250ms
    BTFSC PORTA,3,0   ;Nos pregunta si el boton se ha pulsado o no
    GOTO LED_4par
STOP3:
    CALL Delay_250ms
    BTFSC PORTA,3,0   ;Nos pregunta si el boton se ha pulsado o no
    GOTO STOP3
LED_4par:
    CALL Delay_250ms
    BCF LATC,2,1      ;se apaga el 2
    BSF LATC,3,1      ;se prende el led 4
    CALL Delay_250ms
    BTFSC PORTA,3,0   ;Nos pregunta si el boton se ha pulsado o no
    GOTO LED_5par
STOP4:
    CALL Delay_250ms
    BTFSC PORTA,3,0   ;Nos pregunta si el boton se ha pulsado o no
    GOTO STOP4   
LED_5par:
    CALL Delay_250ms
    BCF LATC,3,1      ;se apaga el led 4
    BSF LATC,4,1      ;se prende el led 5
    CALL Delay_250ms  
    BTFSC PORTA,3,0   ;Nos pregunta si el boton se ha pulsado o no
    GOTO LED_6par
STOP5:
    CALL Delay_250ms
    BTFSC PORTA,3,0   ;Nos pregunta si el boton se ha pulsado o no
    GOTO STOP5
LED_6par:
    CALL Delay_250ms
    BCF LATC,4,1     ;se apaga el led 5
    BSF LATC,5,1     ;se prende el led 6
    CALL Delay_250ms
    BTFSC PORTA,3,0  ;Nos pregunta si el boton se ha pulsado o no
    GOTO LED_7par
STOP6:
    CALL Delay_250ms
    BTFSC PORTA,3,0  ;Nos pregunta si el boton se ha pulsado o no
    GOTO STOP6
LED_7par:
    CALL Delay_250ms
    BCF LATC,5,1      ;se apaga el led 6
    BSF LATC,6,1      ;se prende el led 7
    CALL Delay_250ms  
    BTFSC PORTA,3,0   ;Nos pregunta si el boton se ha pulsado o no
    GOTO LED_8par
STOP7:
    CALL Delay_250ms
    BTFSC PORTA,3,0   ;Nos pregunta si el boton se ha pulsado o no
    GOTO STOP7
LED_8par:
    CALL Delay_250ms
    BCF LATC,6,1      ;se apaga el led 7
    BSF LATC,7,1      ;se prende el led 8
    CALL Delay_250ms
    BTFSC PORTA,3,0   ;Nos pregunta si el boton se ha pulsado o no
    GOTO Led_1
STOP8:
    CALL Delay_250ms
    BTFSC PORTA,3,0   ;;Nos pregunta si el boton se ha pulsado o no
    GOTO STOP8
    GOTO Led_1
config_osc:
    ;Configuracion del oscilador interno a una frecuencia de 4MHz 
    BANKSEL OSCCON1
    MOVLW 0X60h ;SELECIONAMOS EL BLOQUE DEL OSCILADOR INTERNO CON UN DIV:1
    MOVWF OSCCON1,1
    BANKSEL OSCFRQ
    MOVLW 0x02h;SELECIONAMOS UNA FRECUENCIA DE 4MHZ
    MOVWF OSCFRQ,1
    RETURN
config_port: ;PORT-LAT-ANSEL-TRIS
    BANKSEL PORTE
    SETF PORTE,1   ;PORTE<7:0>=1
    CLRF LATE,1    ;LATE<7:0>=0
    CLRF ANSELE,1  ;PORTE Digital
    CLRF TRISE,1   ;PORTE salida
    
    BANKSEL PORTC
    SETF PORTC,1   ;PORTC<7:0>
    CLRF LATC,1    ;LATE<7:0>=0
    CLRF ANSELC,1  ;PORTC Digital
    CLRF TRISC,1   ;PORTC salida
;configurando boton 
    BANKSEL PORTA 
    SETF PORTA,1     ;PORTA<7:0>=1
    CLRF ANSELA,1    ;PORTA DIGITAL 
    BSF TRISA,3,1    ;RA3 COMO ENTRADA
    BSF WPUA,3,1     ;ACTIVAMOS LA RESISTENCIA PULL-UP DEL PIN RA3
    RETURN

END resetvect


