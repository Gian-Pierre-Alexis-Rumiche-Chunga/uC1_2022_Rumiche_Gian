;-------------------------------------------------------------------------------
;@file:        P2-Display_7SEG.s
;@date:        15/01/2023
;@brief:       Desarrollar un programa alfanumerico que cuando el boton no este
;             presionado muestra los valores del 0 a 9, cuando el boton 
;             este presionado  muestre los valores del A al F , con un retardo 
;             de 1 segundo sabiendo la frecuencia del oscilador es de 4MHz  
;@author:      Rumiche Chunga Gian Pierre Alexis
;------------------------------------------------------------------------------
Processor 18F57Q84
#include "Bit_config.inc"// config statements should precede project file includes.   
#include <xc.inc>
#include "Retardos.inc"
PSECT resetVect,class=CODE,reloc=2
resetvect:
    GOTO main
PSECT CODE
main:
    CALL config_osc,1    ;Nos lleva a la configuracion del oscilador
    CALL config_port,1   ;Nos lleva a la config_port
    BTFSS LATA,3,0 ;verifica si se presiona el pulsador
    GOTO forma_A   ;nos lleva a la etiqueta forma_A
;tiene un retardo de 1 segundo
forma_el_0:           
    CALL Delay_250ms  
    CALL Delay_250ms  
    MOVLW 01000000B   ;se guarda en el registro de trabajo
    MOVWF LATD,1       ;se guarda en el registro LATD
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0    ;se verifica si se presion el pulsador  o no
    GOTO forma_A       ;nos lleva a la etiqueta forma_A
;tiene un retardo de 1 segundo
forma_el_1:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 01111001B     ;se guarda en el registro de trabajo
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0     ;se verifica si se presion el pulsador  o no
    GOTO forma_A        ;nos lleva a la etiqueta forma_A
;tiene un retardo de 1 segundo
forma_el_2:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00100100B     ;se guarda en el registro de trabajo
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0     ;se verifica si se presion el pulsador  o no
    GOTO forma_A        ;nos lleva a la etiqueta forma_A
;tiene un retardo de 1 segundo
forma_el_3:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00110000B      ;se guarda en el registro de trabajo
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0      ;se verifica si se presion el pulsador  o no
    GOTO forma_A         ;nos lleva a la etiqueta forma_A
;tiene un retardo de 1 segundo
forma_el_4:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00011001B     ;se guarda en el registro de trabajo
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0      ;se verifica si se presion el pulsador  o no
    GOTO forma_A         ;nos lleva a la etiqueta forma_A
;tiene un retardo de 1 sg
forma_el_5:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00010010B    ;se guarda en el registro de trabajo
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0     ;se verifica si se presion el pulsador  o no
    GOTO forma_A        ;nos lleva a la etiqueta forma_A
;tiene un retardo de 1 segundo
forma_el_6:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVlW 00000010B    ;se guarda en el registro de trabajo
    MOVWF LATD,1       ;(w)->f  en el registro indicado
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0    ;se verifica si se presion el pulsador  o no
    GOTO forma_A       ;nos lleva a la etiqueta forma_A
;tiene un retardo de 1 segundo
forma_el_7:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 01111000B      ;se guarda en el registro de trabajo
    MOVWF LATD,1         ;(w)->f  en el registro indicado 
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0       ;se verifica si se presion el pulsador  o no
    GOTO forma_A          ;nos lleva a la etiqueta forma_A
;tiene un retardo de 1 segundo
forma_el_8:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00000000B     ;se guarda en el registro de trabajo
    MOVWF LATD,1        ;(w)->f  en el registro indicado
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0      ;se verifica si se presion el pulsador  o no
    GOTO forma_A         ;nos lleva a la etiqueta forma_A
;tiene un retardo de 1 segundo
forma_el_9:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00011000B      ;se guarda en el registro de trabajo
    MOVWF LATD,1         ;(w)->f  en el registro indicado
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSS PORTA,3,0       ;se verifica si se presion el pulsador  o no  
    GOTO forma_A          ;nos lleva a la etiqueta forma_A
    GOTO forma_el_0
;tiene un retardo de 1 segundo
forma_A:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00001000B     ;se guarda en el registro de trabajo
    MOVWF LATD,1        ;(w)->f  en el registro indicado
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSC PORTA,3,0      ;se verifica si se presion el pulsador  o no
    GOTO forma_el_0      ;nos lleva a la etiqueta forma_el_0
;tiene un retardo de 1 segundo
forma_B:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00000011B      ;se guarda en el registro de trabajo
    MOVWF LATD,1         ;(w)->f  en el registro indicado 
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSC PORTA,3,0      ;se verifica si se presion el pulsador  o no
    GOTO forma_el_0      ;nos lleva a la etiqueta forma_el_0
;tiene un retardo de 1 segundo
forma_C:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 01000110B     ;se guarda en el registro de trabajo
    MOVWF LATD,1        ;(w)->f  en el registro indicado
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSC PORTA,3,0      ;se verifica si se presion el pulsador  o no
    GOTO forma_el_0      ;nos lleva a la etiqueta forma_el_0 
;tiene un retardo de 1 segundo
forma_d:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00100001B     ;se guarda en el registro de trabajo
    MOVWF LATD,1        ;(w)->f  en el registro indicado
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSC PORTA,3,0      ;se verifica si se presion el pulsador  o no
    GOTO forma_el_0      ;nos lleva a la etiqueta forma_el_0
;tiene un retardo de 1 segundo    
forma_e:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00000110B    ;se guarda en el registro de trabajo
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSC PORTA,3,0      ;se verifica si se presion el pulsador  o no
    GOTO forma_el_0      ;nos lleva a la etiqueta forma_el_0
;tiene un retardo de 1 segundo
forma_f:
    CALL Delay_250ms
    CALL Delay_250ms
    MOVLW 00001110B     ;se guarda en el registro de trabajo
    MOVWF LATD,1
    CALL Delay_250ms
    CALL Delay_250ms
    BTFSC PORTA,3,0      ;se verifica si se presion el pulsador  o no
    GOTO forma_el_0      ;nos lleva a la etiqueta forma_el_0 
    GOTO forma_A         ;nos lleva a la etiqueta forma_A
config_osc:
    BANKSEL OSCCON1
    MOVLW 0X60 ;SELECIONAMOS EL BLOQUE DEL OSCILADOR INTERNO CON UN DIV:1
    MOVWF OSCCON1,1
    BANKSEL OSCFRQ
    MOVLW 0x02;SELECIONAMOS UNA FRECUENCIA DE 4MHZ
    MOVWF OSCFRQ,1
    RETURN
config_port:
    BANKSEL PORTD
    SETF PORTD,1     ; PORTD <7:0> =1 
    SETF LATD,1      ; LATD <7:0> =1 
    CLRF ANSELD,1    ; PORTD DIGITAL 
    CLRF TRISD,1     ; salida 
;configurando boton 
    BANKSEL PORTA 
    SETF PORTA,1     ; PORTA<7:0> =1
    CLRF ANSELA,1    ;PORTA DIGITAL 
    BSF TRISA,3,1    ;RA3 COMO ENTRADA
    BSF WPUA,3,1     ;ACTIVAMOS LA RESISTENCIA PULL-UP DEL PIN RA3
    RETURN  
END resetvect





