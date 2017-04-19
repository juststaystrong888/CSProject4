
;
;This program blinks the sequence of 3 letters in Morse code on the LED. my sequence:AIL. each letter consist of number of dots, spaces and dashes, which represented as a series of on-off lights.
;Where A:dot(200ms), space(200ms),dash(600ms), space between letters(600ms)
;I:dot(200ms), space(200ms),dot(200ms),space between letters(600ms)
;L:dot(200ms),space(200ms),dash(600ms),space(200ms),dot(200ms),space(200ms),dot(200ms),final inter-space(600ms)

.equ SREG, 0x3f    ; Define SREG label (status register) with its address
.equ PORTB, 0x05   ;Define address of PORTB
.equ DDRB,0x04     ;Data Direction Register for PORTB
.org 0             ;specify the start address
;reset system status
main: ldi r16, 0   ;set register r16 to zero
      out SREG,r16 ;copy contents of r16 to SREG, i.e., clear SREG
      ;configure PORTB for output
      
hello: ldi r16,0x01 ; copies hexadecimal 0x01 to r16
       out DDRB, r16 ;writes r16 to DDRB, setting up bit 0 in output mode

      ;the first dot of the letter A  
      ldi r16, 0x01  ; copies hexadecimal 0x01 to r16
      out PORTB, r16  ; writes contents of r16 to PORTB

      ldi r19, 20 ;decline register r19(parameter) as the number of 10 ms delay sub-routine times 20
      call delay ;call sub-routine
      
      ;the inter-part space of the letter A  
      ldi r16, 0x00 ; copies hexadecimal 0x00 to r16
      out PORTB, r16 ; writes contents of r16 to PORTB

      ldi r19, 20
      call delay

      ;the first dash of the letter A
      ldi r16, 0x01
      out PORTB, r16

      ldi r19, 60  ;decline register r19 as the number of 10 ms delays sub-routine times 60
      call delay ;call sub-routine
      
       ;the inter-letter space between the letters A and I 
      ldi r16, 0x00
      out PORTB, r16
      
      ldi r19, 60
      call delay

      ;the first dot of the letter I  
      ldi r16, 0x01
      out PORTB, r16

      ldi r19, 20
      call delay
      
      ;the inter-part space of the letter I  
      ldi r16, 0x00
      out PORTB, r16
    
      ldi r19, 20
      call delay

      ;the second dot of the letter I  
      ldi r16, 0x01
      out PORTB, r16

      ldi r19, 20
      call delay
      
      ;the inter-letter space between the letters I and L 
      ldi r16, 0x00
      out PORTB, r16
    
      ldi r19, 60
      call delay

      ;the first dot of the letter L  
      ldi r16, 0x01
      out PORTB, r16

      ldi r19, 20
      call delay
      
      ;the inter-part space of the letter L  
      ldi r16, 0x00
      out PORTB, r16

      ldi r19, 20
      call delay

      ;the first dash of the letter L
      ldi r16, 0x01
      out PORTB, r16

      ldi r19, 60
      call delay
      
       ;the inter-part space of the letter L 
      ldi r16, 0x00
      out PORTB, r16
      
      ldi r19, 20
      call delay

      ;the second dot of the letter I  
      ldi r16, 0x01
      out PORTB, r16

      ldi r19, 20
      call delay
      
      ;the inter-part space of the letter L  
      ldi r16, 0x00
      out PORTB, r16
    
      ldi r19, 20
      call delay

      ;the third dot of the letter L  
      ldi r16, 0x01
      out PORTB, r16

      ldi r19, 20
      call delay

      ;the final inter-letter space 
      ldi r16, 0x00
      out PORTB, r16
    
      ldi r19, 60
      call delay



mainloop:rjmp hello ;jump back to mainloop address
    
;delay for 10 ms
	  
delay:   ldi r17, 255
         ldi r18, 125
   
loop: nop ;do nothing
      dec r17     ;decrement r17,r17=r17-1
      cpi r17, 0  ;compare r17 to 0
      brne loop   ;branch if r17<>0
      ldi r17, 255 ;
      dec r18      ;decrement r18,r18=r18-1
      cpi r18, 0   ;compare r17 to 0
      brne loop    ;branch if r17<>0
      ldi r18, 125
      dec r19      ;decrement r19,r19=r19-1
      cpi r19, 0   ;compare r19 to 0
      brne loop    ;branch if r19<>0
      ret   ;return
	

  


