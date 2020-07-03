.MODEL SMALL
;------------------------------------------------------
.STACK 64        
;------------------------------------------------------                    
.DATA
mes db '<MINUSMISSION>PRESS ENTER TO DO MISSION','$'
mess db 'YOU SHOUID SOLVE QUISTION TO WIN  ',10,10,32,32,32,'FINISH ALL CORECTLY ',10,10,32,32,32,' IN TIME LESS THAN IN 45 SEC',10,10,32,32,32,'$'
messs db 10,10,32,'    AVIOD ANY QUISTION RITCH TO YOU','$'
mes1 db ' MISSION DONE :D ','YOUR SCORE IS ','$'
mes2 db "MISSION DOSN'T COMPLETED ",'               TRY AGIANTO DO <MINUSMISSION>','$'
mestime db 'TIME','$'
messcore db 'S.C','$'
mesloss db "MISSION DOSN'T COMPLETED :( ",'$'
mes22 db 'TRY!ENTER TO DO <MINUSMISSION>','$'
mesdone db 'Congratulations! :D','$'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
rx1 dw 2
ry1 dw 2
rx2 dw 82
ry2 dw 2
rx3 dw 162
ry3 dw 2
rx4 dw 242
ry4 dw 2
tempx dw ?
tempy dw ?
tempwidth dw ?
tempheight dw ?
sx1 dw 150
sy1 equ 178
bu dw ?
;;;;;;;;;;;
qx1 db 2
qy1 db 1
qx2 db 12
qy2 db 1
qx3 db 22
qy3 db 1
qx4 db 32
qy4 db 1
ax1 db 25
ay1 db 23
tempx1 db ?
tempy1 db ?
;;;;;;;;;;;;;;
time_aux db 0
count dw  1
;;;;;;;;;;;;;;;;
flagwhich db 0
;;;;;;;;;;;;;;;;
tempqueation1 db 8,2,7,5,3,2,8,1
tempqueation db 8,2,7,5,3,2,8,1
queation1 db 9,5,3,1,8,4,6,5
queation2 db 9,3,5,2,4,3,6,3
queation3 db 5,5,8,6,9,6,5,4
queation4 db 7,1,8,3,8,6,8,5
queation5 db 2,1,4,2,6,2,9,7
queation6 db 9,7,9,1,7,3,8,0
queation7 db 9,0,8,2,3,3,8,1
answer db   6,2,7,1,4,2,1,4,3,6,1,3,2,0,1,3,6,3,5,2,2,1,4,2,2,4,8,8,9,0,6,7
countq db 0
countq1 db 0
countq2 db 0
countq3 db 0
;------------------------------------------------------
score dw 0
.code  
drawrect proc
             mov tempx,cx
			 mov tempy,dx
			 add cx,76
			 mov tempwidth,cx
			 add dx,20
			 mov tempheight,dx
			 mov cx,tempx
			 mov dx,tempy
			 
              MOV AL,5 
              MOV AH,0CH
			  
	lo:	      mov dx,tempy
	          int 10H
	         
			  add dx,20 ;20 is the height
			  int 10H
			  
			  inc cx
			  cmp cx,tempwidth
			  jne lo
			  mov dx ,tempy
			  
    loo:	  
	          mov cx,tempx
	          int 10H
	         
			  mov cx,tempwidth ;20 is the height
			  int 10H
			  
			  inc dx
			  cmp dx,tempheight
			  jne loo

ret 
drawrect endp
clearrect proc
             mov tempx,cx
			 mov tempy,dx
			 add cx,76
			 mov tempwidth,cx
			 add dx,20
			 mov tempheight,dx
			 mov cx,tempx
			 mov dx,tempy
			 
              MOV AL,0
              MOV AH,0CH
			  
	cc:	      mov dx,tempy
	          int 10H
	         
			  add dx,20 ;20 is the height
			  int 10H
			  
			  inc cx
			  cmp cx,tempwidth
			  jne cc
			  mov dx ,tempy
			  
    ccc:	  
	          mov cx,tempx
	          int 10H
	        re:inc cx
              int 10H			  
			  cmp cx,tempwidth ;20 is the height
			  jne re
			  
			  inc dx
			  cmp dx,tempheight
			  jne ccc

ret 
clearrect endp
drawans proc 
    mov tempx1, dl
    mov tempy1, dh
	
    mov ah,2 
    mov dl, tempx1
    mov dh, tempy1
    mov bx,0
    int 10h 
	;;;;;;;;;
mov al,[si]
add al,48
mov ah,9          ;Display 
mov bh,0          ;Page 0 
mov cx,1          ;1 times 
mov bl,03h ;Green (A) on white(F) background 
int 10h 
sub al,48
ret
drawans endp
drawp proc 
             mov cx,sx1
			 mov dx,sy1
             mov tempx,cx
			 mov tempy,dx
			 add cx,20
			 mov tempwidth,cx
			 add dx,20
			 mov tempheight,dx
			 mov cx,tempx
			 mov dx,tempy
			 
              MOV AL,4 
              MOV AH,0CH
			  
	l:	      mov dx,tempy
	          int 10H
	         
			  add dx,20 ;20 is the height
			  int 10H
			  
			  inc cx
			  cmp cx,tempwidth
			  jne l
			  sub dx ,30
			  
    ll:	  
	          mov cx,tempx
	          int 10H
	         
			  mov cx,tempwidth ;20 is the height
			  int 10H
			  
			  inc dx
			  cmp dx,tempheight
			  jne ll
			  

ret 
drawp endp
clearp proc
             mov cx,sx1
			 mov dx,sy1
             mov tempx,cx
			 mov tempy,dx
			 add cx,20
			 mov tempwidth,cx
			 add dx,20
			 mov tempheight,dx
			 mov cx,tempx
			 mov dx,tempy
			 
              MOV AL,0 
              MOV AH,0CH
			  
	cll:	  mov dx,tempy
	          int 10H
	         
			  add dx,20 ;20 is the height
			  int 10H
			  
			  inc cx
			  cmp cx,tempwidth
			  jne cll
			  sub dx ,30
			  
    clll:	  
	          mov cx,tempx
	          int 10H
		ree:	  inc cx
	          int 10H
			  cmp cx,tempwidth ;20 is the height
			  jne ree
			  
			  inc dx
			  cmp dx,tempheight
			  jne clll

ret 
clearp endp
drawquestion proc 
    mov tempx1, dl
    mov tempy1, dh
	
    mov ah,2 
    mov dl, tempx1
    mov dh, tempy1
    mov bx,0
    int 10h 
	;;;;;;;;;
mov al,[di]
add al,48
mov ah,9          ;Display 
mov bh,0          ;Page 0 
mov cx,1          ;1 times 
mov bl,03h ;Green (A) on white(F) background 
int 10h 
sub al,48
inc di
;;;;;;;;;;;;;;;
    mov ah,2 
    mov dl, tempx1
    mov dh, tempy1
    mov bx,0
	add dl,3
    int 10h 
	;;;;;;;;;
mov ah,9          ;Display 
mov bh,0          ;Page 0 
mov al,'-'        ;Letter D 
mov cx,1          ;1 times 
mov bl,003h ;Green (A) on white(F) background 
int 10h 
;;;;;;;;;;;;;
    mov ah,2 
    mov dl, tempx1
    mov dh, tempy1
    mov bx,0
	add dl,6
    int 10h 
	;;;;;;;;;
mov al,[di]
add al,48
mov ah,9          ;Display 
mov bh,0          ;Page 0 
mov cx,1          ;1 times 
mov bl,003h ;Green (A) on white(F) background 
int 10h 
sub al,48
ret
drawquestion endp
clearquestion proc 
    mov tempx1, dl
    mov tempy1, dh
	
    mov ah,2 
    mov dl, tempx1
    mov dh, tempy1
    mov bx,0
    int 10h 
	;;;;;;;;;
mov al,[di]
add al,48
mov ah,9          ;Display 
mov bh,0          ;Page 0 
mov cx,1          ;1 times 
mov bl,0 ;Green (A) on white(F) background 
int 10h 
sub al,48
inc di
;;;;;;;;;;;;;;;
    mov ah,2 
    mov dl, tempx1
    mov dh, tempy1
    mov bx,0
	add dl,3
    int 10h 
	;;;;;;;;;
mov ah,9          ;Display 
mov bh,0          ;Page 0 
mov al,'-'        ;Letter D 
mov cx,1          ;1 times 
mov bl,0 ;Green (A) on white(F) background 
int 10h 
;;;;;;;;;;;;;
    mov ah,2 
    mov dl, tempx1
    mov dh, tempy1
    mov bx,0
	add dl,6
    int 10h 
	;;;;;;;;;
mov al,[di]
add al,48
mov ah,9          ;Display 
mov bh,0          ;Page 0 
mov cx,1          ;1 times 
mov bl,0 ;Green (A) on white(F) background 
int 10h 
sub al,48
ret
clearquestion endp

drawallrect proc
        mov cx,rx1
		mov dx,ry1
        call drawrect		
		mov cx,rx2
		mov dx,ry2
        call drawrect 
		mov cx,rx3
		mov dx,ry3
        call drawrect
		mov cx,rx4
		mov dx,ry4
        call drawrect
		lea di,tempqueation
		mov dl,qx1
		mov dh,qy1
        call drawquestion   
 		lea di,tempqueation+2
		mov dl,qx2
		mov dh,qy2
        call drawquestion
		lea di,tempqueation+4
		mov dl,qx3
		mov dh,qy3
        call drawquestion
		lea di,tempqueation+6
		mov dl,qx4
		mov dh,qy4
        call drawquestion	
ret
drawallrect endp

clearallrect proc
        mov cx,rx1
		mov dx,ry1
        call clearrect
		
		mov cx,rx2
		mov dx,ry2
        call clearrect
		
		mov cx,rx3
		mov dx,ry3
        call clearrect
		
		mov cx,rx4
		mov dx,ry4
        call clearrect
		lea di,tempqueation
		mov dl,qx1
		mov dh,qy1
        call clearquestion   
 		lea di,tempqueation+2
		mov dl,qx2
		mov dh,qy2
        call clearquestion  
		lea di,tempqueation+4
		mov dl,qx3
		mov dh,qy3
        call clearquestion  
		lea di,tempqueation+6
		mov dl,qx4
		mov dh,qy4
        call clearquestion  
		
        add ry1,8
		add ry2,8
		add ry3,8
		add ry4,8
		add qy1,1
		add qy2,1
		add qy3,1
		add qy4,1
		
ret
clearallrect endp

drawarrbu proc
add dx,20
mov bu,dx ;ely darbt 3leha

mov cx,sx1
add cx,10
mov dx,sy1
mov ah,0ch       ;Draw Pixel Command 
mov al,9h
back10:   
int 10h 
dec dx
cmp dx,bu     
jnz back10
ret
drawarrbu endp
clearbu proc
add dx,20
mov bu,dx ;ely darbt 3leha

mov cx,sx1
add cx,10
mov dx,sy1
mov ah,0ch       ;Draw Pixel Command 
mov al,0h
back100:   
int 10h 
dec dx
cmp dx,bu     
jnz back100
ret
clearbu endp
temp1 proc
  cmp countq,0
	  jne w
	  lea di,queation1
	  mov ax,[di]
	  lea bx,tempqueation
	  mov [bx],ax
	  w:
	  cmp countq,1
	  jne ww
	  lea di,queation2
	  mov ax,[di]
	  lea bx,tempqueation
	  mov [bx],ax
	  ww:
	  cmp countq,2
	  jne www
	  lea di,queation3
	  mov ax,[di]
	  lea bx,tempqueation
	  mov [bx],ax
	  www:
	  cmp countq,3
	  jne wwww
	  lea di,queation4
	  mov ax,[di]
	  lea bx,tempqueation
	  mov [bx],ax
	  wwww:
	  cmp countq,4
	  jne wwwww
	  lea di,queation5
	  mov ax,[di]
	  lea bx,tempqueation
	  mov [bx],ax
	  wwwww:
	  cmp countq,5
	  jne wwwwww
	  lea di,queation6
	  mov ax,[di]
	  lea bx,tempqueation
	  mov [bx],ax
	  wwwwww:
	  cmp countq,6
	  jne wwwwwww
	  lea di,queation7
	  mov ax,[di]
	  lea bx,tempqueation
	  mov [bx],ax
wwwwwww:
      cmp countq,7	
      jne s111
      jmp finishqu	  
s111:  inc countq	  
ret
temp1 endp
temp2 proc
     cmp countq1,0
	  jne w1
	  lea di,queation1+2
	  mov ax,[di]
	  lea bx,tempqueation+2
	  mov [bx],ax
	  w1:
	  cmp countq1,1
	  jne ww1
	  lea di,queation2+2
	  mov ax,[di]
	  lea bx,tempqueation+2
	  mov [bx],ax
	  ww1:
	  cmp countq1,2
	  jne www1
	  lea di,queation3+2
	  mov ax,[di]
	  lea bx,tempqueation+2
	  mov [bx],ax
	  www1:
	  cmp countq1,3
	  jne wwww1
	  lea di,queation4+2
	  mov ax,[di]
	  lea bx,tempqueation+2
	  mov [bx],ax
	  wwww1:
	  cmp countq1,4
	  jne wwwww1
	  lea di,queation5+2
	  mov ax,[di]
	  lea bx,tempqueation+2
	  mov [bx],ax
	  wwwww1:
	  cmp countq1,5
	  jne wwwwww1
	  lea di,queation6+2
	  mov ax,[di]
	  lea bx,tempqueation+2
	  mov [bx],ax
	   wwwwww1:
	  cmp countq1,6
	  jne wwwwwww1
	  lea di,queation7+2
	  mov ax,[di]
	  lea bx,tempqueation+2
	  mov [bx],ax
	 
      wwwwwww1:
      cmp countq1,7	
      jne s11
      jmp finishqu	  
s11:  inc countq1
	  
ret
temp2 endp
temp3 proc
 cmp countq2,0
	  jne w2
	  lea di,queation1+4
	  mov ax,[di]
	  lea bx,tempqueation+4
	  mov [bx],ax
	  w2:
	  cmp countq2,1
	  jne ww2
	  lea di,queation2+4
	  mov ax,[di]
	  lea bx,tempqueation+4
	  mov [bx],ax
	  ww2:
	  cmp countq2,2
	  jne www2
	  lea di,queation3+4
	  mov ax,[di]
	  lea bx,tempqueation+4
	  mov [bx],ax
	  www2:
	  cmp countq2,3
	  jne wwww2
	  lea di,queation4+4
	  mov ax,[di]
	  lea bx,tempqueation+4
	  mov [bx],ax
	  wwww2:
	  cmp countq2,4
	  jne wwwww2
	  lea di,queation5+4
	  mov ax,[di]
	  lea bx,tempqueation+4
	  mov [bx],ax
	  wwwww2:
	  cmp countq2,5
	  jne wwwwww2
	  lea di,queation6+4
	  mov ax,[di]
	  lea bx,tempqueation+4
	  mov [bx],ax 
	  wwwwww2:
	  cmp countq2,6
	  jne wwwwwww2
	  lea di,queation7+4
	  mov ax,[di]
	  lea bx,tempqueation+4
	  mov [bx],ax
wwwwwww2:
      cmp countq2,7	
      jne s1
      jmp finishqu	  
s1:  inc countq2
	 
ret
temp3 endp
temp4 proc
 cmp countq3,0
	  jne w3
	  lea di,queation1+6
	  mov ax,[di]
	  lea bx,tempqueation+6
	  mov [bx],ax
	  w3:
	  cmp countq3,1
	  jne ww3
	  lea di,queation2+6
	  mov ax,[di]
	  lea bx,tempqueation+6
	  mov [bx],ax
	  ww3:
	  cmp countq3,2
	  jne www3
	  lea di,queation3+6
	  mov ax,[di]
	  lea bx,tempqueation+6
	  mov [bx],ax
	  www3:
	  cmp countq3,3
	  jne wwww3
	  lea di,queation4+6
	  mov ax,[di]
	  lea bx,tempqueation+6
	  mov [bx],ax
	  wwww3:
	  cmp countq3,4
	  jne wwwww3
	  lea di,queation5+6
	  mov ax,[di]
	  lea bx,tempqueation+6
	  mov [bx],ax
	  wwwww3:
	  cmp countq3,5
	  jne wwwwww3
	  lea di,queation6+6
	  mov ax,[di]
	  lea bx,tempqueation+6
	  mov [bx],ax
	   wwwwww3:
	  cmp countq3,6
	  jne wwwwwww3
	  lea di,queation7+6
	  mov ax,[di]
	  lea bx,tempqueation+6
	  mov [bx],ax
	  
wwwwwww3:
      cmp countq3,7	
      jne s
      jmp finishqu	  
s:	  inc countq3
	 
ret
temp4 endp

cheakkey proc
	  mov ah,1
	  int 16h
	  jz e
	  mov ah,0
	  int 16h
	  cmp ah,4Dh
	  jne ec
	  call clearp
	  cmp sx1,270
	  jne v
	  mov sx1,30
	  mov ax1,5
	  jmp ec
v:	  add sx1,80
	  add ax1,10
	  ec:
	  cmp ah,4Bh       ;4Dh;right ;4Bh   ;LEFT.
	  jne ecc
	  call clearp
	  cmp sx1,30
	  jne v1
	  mov sx1,270
	  mov ax1,35
	  jmp ecc
v1:  sub sx1,80
	  sub ax1,10
	  ecc:
	  cmp al,32
	  je eccc
	   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     e: 
	    jmp ex
	   eccc:
	  cmp sx1,30
	  jne a
	  mov dx,ry1
	  mov flagwhich,1
	  mov al,byte ptr tempqueation
	  mov ah,byte ptr tempqueation+1
	  sub al,ah
	  cmp al,[si]
	  jne a
	  inc si
	  inc score
	    mov cx,rx1
		mov dx,ry1
		call clearrect
		mov ry1,2
		mov cx,rx1
		mov dx,ry1
		call drawrect
		call temp1 
		mov qx1,2
		mov qy1,1
		mov dl,2
		mov dh,1
		lea di,tempqueation
		call drawquestion
		mov dx,ry1
		call clearbu
	  jmp d
	  a:
	  cmp sx1,110
	  jne a1
	  mov dx,ry2
	  mov flagwhich,2
	  mov al,byte ptr tempqueation+2
	  mov ah,byte ptr tempqueation+3
	  sub al,ah
	  cmp al,[si]
	  jne a1
	  inc si
	  inc score
	  call temp2
	    mov cx,rx2
		mov dx,ry2
		call clearrect
		mov ry2,2
		mov cx,rx2
		mov dx,ry2
		call drawrect
		mov qx2,12
		mov qy2,1
		mov dl,12
		mov dh,1
		lea di,tempqueation+2
		call drawquestion
		mov dx,ry2
		call clearbu
	  jmp d
	  a1:cmp sx1,190
	  jne a11
	  mov dx,ry3
	  mov flagwhich,3
	  mov al,byte ptr tempqueation+4
	  mov ah,byte ptr tempqueation+5
	  sub al,ah
	  cmp al,[si]
	  jne a11
	  inc si
	  inc score
	  call temp3
	    mov cx,rx3
		mov dx,ry3
		call clearrect
		mov ry3,2
		mov cx,rx3
		mov dx,ry3
		call drawrect
		mov qx3,22
		mov qy3,1
		mov dl,22
		mov dh,1
		lea di,tempqueation+4
		call drawquestion
		mov dx,ry3
		call clearbu
	  jmp d
	  a11:
	  cmp sx1,270
	  jne d
	  mov dx ,ry4
	  mov flagwhich,4
	  mov al,byte ptr tempqueation+6
	  mov ah,byte ptr tempqueation+7
	  sub al,ah
	  cmp al,[si]
	  jne d
	  inc si
	  inc score
	  call temp4
	    mov cx,rx4
		mov dx,ry4
		call clearrect
		mov ry4,2
		mov cx,rx4
		mov dx,ry4
		call drawrect
		mov qx4,32
		mov qy4,1
		mov dl,32
		mov dh,1
		lea di,tempqueation+6
		call drawquestion
        mov dx,ry4
		call clearbu		
	
	  d:
	  call drawarrbu
	  call delayfast
		cmp flagwhich,1
		jne c1
		mov dx,ry1
		call clearbu
		
        c1:
		cmp flagwhich,2
		jne c2
		mov dx,ry2
		call clearbu
		
		c2:
		cmp flagwhich,3
		jne c3
		mov dx,ry3
		call clearbu
		
		c3:
		cmp flagwhich,4
		jne ex
		mov dx,ry4
		call clearbu
		
ex:	 
	  mov dl,ax1
	  mov dh,ay1
      call drawans
	  call drawp 
ret
cheakkey endp

display proc
mov cx,0
mov dx,0
la:
cmp ax,0
je printnum
mov bx,10
div bx
push dx
inc cx
mov dx,0
jmp la

printnum:
cmp cx,0
je exit
pop dx
add dx,48
mov ah, 2
int 21h
dec cx
jmp printnum

exit:
ret

display endp
delayfast proc 
Mov cx,00h   ;delay
mov dx,9028h
mov ah,86h
int 15h
ret
delayfast endp
temp proc
jmp start
ret
temp endp
main proc far             
mov ax,@data
mov ds,ax
lea si,answer
start:
MOV ah,0;SET VIDO MOOD
MOV al,13h ;CHOOSE VIDO MOOD
INT 10H 
;;;;;;;;
mov dl,1
mov dh,10
mov ah,2 
mov bh,0
int 10h
;;;;;;;;
mov ah, 9
mov dx, offset mes;Display string in the new location
int 21h
mov dl,3
mov dh,14
mov ah,2 
mov bh,0
int 10h
;;;;;;;;
mov ah, 9
mov dx, offset mess;Display string in the new location
int 21h
mov dl,5
mov dh,19
mov ah,2 
mov bh,0
int 10h
;;;;;;;;
mov ah, 9
mov dx, offset messs;Display string in the new location
int 21h
;;;;;;;;;;
        call drawp
        mov cx,rx1
		mov dx,ry1
        call drawrect	
		mov cx,rx2
		mov dx,ry2
        call drawrect 
		mov cx,rx3
		mov dx,ry3
        call drawrect
		mov cx,rx4
		mov dx,ry4
        call drawrect
;;;;;;;;;;
con:    mov ah,0
        int 16h 
		cmp al,13
		jne con
;;;;;;;;;
mov ax,0600h      ;Scroll Screen AH=06 (Scroll),AL=0 Entire Page
mov bh,0        ;Normal attributes
mov cx,0          ;from 0,0
mov dx,184FH      ;To 18h,4fh
int 10h           ;Clear Screen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;game;;;;;;;;;;;;;;;;
mov ah,2 
mov dl, 0
mov dh, 23
mov bx,0
int 10h 

mov ah, 9
mov dx, offset mestime;Display string in the new location
int 21h

mov ah,2 
mov dl, 37
mov dh, 23
mov bx,0
int 10h 

mov ah, 9
mov dx, offset messcore;Display string in the new location
int 21h

  ;;;;;;;;;;displayscore;;
mov ah,2 
mov dl,37
mov dh,24  
mov bx,0
int 10h 
;;;;;;;;
mov ah,9          ;Display
mov bh,0          ;Page 0
mov al,'0'        ;Letter D
mov cx,1h         ;5 times
mov bl,0eh        ;Green (A) on white(F) background
int 10h

mov sx1,190
     
gameloop:
      
cheak: 
        mov al,0
        call cheakkey
        mov ah,2ch ;togetthesystemtime
		int 21h  ;ch=hour cl=min dh=sec dl=msec
		
		cmp dh,time_aux
		je cheak
		mov time_aux,dh
mov ah,2 
mov dl, 0
mov dh, 24
mov bx,0
int 10h ;;;;set cursor;;;;
mov ax,count
call display
inc count
  ;;;;;;;;;;displayscore;;
mov ah,2 
mov dl,37
mov dh,24 
mov bx,0
int 10h 
;;;;;;;;
mov ax,score
call display
	   mov al,0
       call cheakkey
       call drawallrect
	   call clearallrect
	   call drawallrect
	   cmp ry1,160
	   jbe cm1
	   jmp los
	   cm1:cmp ry2,160
	   jbe cm2
	   jmp los
	   cm2:
	   cmp ry3,160
	   jbe cm3
	   jmp los
	   cm3:
	   cmp ry4,160
	   jbe cm4
	   jmp los
	   cm4:
	   cmp count,46
	   jne gameloop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
MOV ah,0;SET VIDO MOOD
MOV al,13h ;CHOOSE VIDO MOOD
INT 10H 
;;;;;;;;
cmp score,0
je los
finishqu:
mov dl,0
mov dh,10
mov ah,2 
mov bh,0
int 10h
;;;;;;;;
mov ah, 9
mov dx, offset mes1;Display string in the new location
int 21h
mov ah,2 
mov dl, 32
mov dh, 10
mov bx,0
int 10h ;;;;set cursor;;;;
mov ax,score
call display
mov dl,3
mov dh,18
mov ah,2 
mov bh,0
int 10h
;;;;;;;;
mov ah, 9
mov dx, offset mesdone;Display string in the new location
int 21h
call delayfast
call delayfast
jmp endd
;;;;;;;;
los:
MOV ah,0;SET VIDO MOOD
MOV al,13h ;CHOOSE VIDO MOOD
INT 10H 
;;;;;;;;
mov dl,5
mov dh,10
mov ah,2 
mov bh,0
int 10h
mov ah, 9
mov dx, offset mesloss;Display string in the new location
int 21h
mov dl,5
mov dh,15
mov ah,2 
mov bh,0
int 10h
;;;;;;;;
mov ah, 9
mov dx, offset mes22;Display string in the new location
int 21h
con1:   mov ah,0
        int 16h 
		cmp al,13
		jne con1
;;;reset;;;
mov countq,0
mov countq1,0
mov countq2,0
mov countq3,0
lea si,answer
mov cx,4
lea di,tempqueation
lea bx,tempqueation1
store:
mov ax,[bx]
mov [di],ax
add di,2
add bx,2
loop store
mov score,0
sss:
mov count,1
mov rx1 , 2
mov ry1 , 2
mov rx2 , 82
mov ry2 , 2
mov rx3 , 162
mov ry3 , 2
mov rx4 , 242
mov ry4 , 2
mov sx1 , 160
mov qx1 , 2
mov qy1 , 1
mov qx2 , 12
mov qy2 , 1
mov qx3 , 22
mov qy3 , 1
mov qx4 , 32
mov qy4 , 1
mov ax1 , 25
mov ay1 , 23
call temp
endd:	
hlt 
main endp 

end main 
