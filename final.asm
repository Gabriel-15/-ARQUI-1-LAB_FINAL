;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%GABRIEL ORLANDO AJSIVINAC XICAY%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%FINAL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
spila segment stack
    DB 32 DUP ('stack___')
spila ends

sdatos segment
    encabezado db "UNIVERSIDAD DE SAN CARLOS DE GUATEMALA",13,10,
                    "FACULTAD DE INGENIERIA",13,10,
                    "Arquitectura de Computradoras y Ensambladores A",13,10,
                    "Segundo Semestre 2021",13,10,
                    "Examen Final de Laboratorio",13,10,
                    "GABRIEL ORLANDO AJSIVINAC XICAY",13,10,
                    "CARNET: 201213010",13,10,
                    "--------------------------------------------","$"
    ejemplomsj db "ingrese numero ejemplo: 50,1000,100","$"

    entrada db 50 dup ("$")  ;variable para capturar lo que se ingresa
    extra db 80 dup ("$")
    long dw 0
    ids dw 0
    ;==========================
    menu_p db "*****BIENVENIDO*****", 10d,13d,"$"
    msg1 db "Ingrese numero: ","$"
    saltoLinea db 10d, 13d, "$"
    msg4 db "INCORRECTO","$"

sdatos ends

scodigo segment 'CODE'
    
	ASSUME SS:spila, DS:sdatos, CS:scodigo         
	
		
	Println proc
	    mov dx, offset saltoLinea
		mov ah, 09
		int 21h
	    ret
	Println endp
	
  
	
	CAST proc 
	    xor ax,ax
	    xor bx,bx
	    xor cx,cx
	    mov si,0
	    mov di,0
	    cmp long,4d
	    jl pl
	    mov bl, extra[si]
	    sub bl,'0'
	    for1:
	        cmp cl,bl
	        je ffor1   
	        mov entrada[di],"M"
	        inc di 
	        inc cl
	        jmp for1
        FFOR1:	         
	    inc si   
	    xor cx,cx
	    pl:
	        cmp long,3d
	        jl sl
	        mov bl, extra[si]
	        sub bl,'0'
	        cmp bl,5
	        jl CD
	        jae DC
	        CD:
	            cmp bl,4
	            jne CC
	            mov entrada[di],"C"
	            inc di
	            mov entrada[di],"D"
	            inc di   
	            jmp F_PL    
	            CC:
	                cmp cl,bl
	                je F_PL
	                mov entrada[di],"C"
	                inc di 
	                inc cl
	                jmp CC    
	                  
	        DC:
	            cmp bl,9
	            jne DCC
	            mov entrada[di],"C"
	            inc di
	            mov entrada[di],"M"
	            inc di   
	            jmp F_PL   
	        DCC:
	            sub bl,5d
	            xor cx,cx
	            mov entrada[di],"D"
	            inc di
	            jmp CC    
	           
	    F_PL:    
        inc si   
	    xor cx,cx	        
	    sl:
	        cmp long,2d
	        jl tl
	        mov bl, extra[si]
	        sub bl,'0'
	        CMP BL,5
	        jl XL 
	        jae LX
	        XL:
	           cmp bl,4
	            jne xx
	            mov entrada[di],"X"
	            inc di
	            mov entrada[di],"L"
	            inc di   
	            jmp F_PL1    
	            xx:
	                cmp cl,bl
	                je F_PL1
	                mov entrada[di],"X"
	                inc di 
	                inc cl
	                jmp XX
	        LX:  
	            cmp bl,9
	            jne LXX
	            mov entrada[di],"X"
	            inc di
	            mov entrada[di],"C"
	            inc di   
	            jmp F_PL1   
	        LXX:
	            sub bl,5d
	            xor cx,cx
	            mov entrada[di],"L"
	            inc di
	            jmp XX
	    F_PL1:    
        inc si   
	    xor cx,cx    
	    tl:
	        mov bl, extra[si]
	        sub bl,'0'
	        CMP BL,5
	        jl IV 
	        jae VI
	        IV:
	           cmp bl,4
	            jne II
	            mov entrada[di],"I"
	            inc di
	            mov entrada[di],"V"
	            inc di   
	            jmp F_PL2    
	            II:
	                cmp cl,bl
	                je F_PL2
	                mov entrada[di],"I"
	                inc di 
	                inc cl
	                jmp II
	        VI:  
	            cmp bl,9
	            jne vii
	            mov entrada[di],"I"
	            inc di
	            mov entrada[di],"X"
	            inc di   
	            jmp F_PL2   
	        vii:
	            sub bl,5d
	            xor cx,cx
	            mov entrada[di],"V"
	            inc di
	            jmp ii
        F_PL2:         
            CALL PRINTLN
             mov entrada[di],36d           
             mov dx, offset entrada
		     mov ah, 09
		     int 21h
		     CALL PRINTLN	            
	    ret
	CAST endp 
	
	EXEC proc 
    CALL PRINTLN
        mov dx, offset encabezado
        mov ah, 9
        int 21h  
    CALL PRINTLN
	
	mov dx, offset ejemplomsj
        mov ah, 9
        int 21h
	CALL PRINTLN	
	    ini:
			CALL PRINTLN
	        MOV LONG,0
	        mov dx, offset menu_p
		    mov ah, 09
		    int 21h                 
		    CALL println
		    mov dx, offset msg1
		    mov ah, 09
		    int 21h
	        mov si,0
            mov si, offset extra
	        lop:
    	        mov ah,01
	            int 21h
	            mov [si],al 
	            inc si    
	            inc long
	            cmp al,13d
	            jne lop
	            dec long
	            CALL CAST
	            JMP ini
	    ret
	EXEC endp
	
	main proc far 
	    
	    push ds
		mov si, 0
		push si
		mov ax, sdatos
		mov ds,ax
		mov es,ax 
        CALL EXEC

    main endp
	
scodigo ends


end main
    

    