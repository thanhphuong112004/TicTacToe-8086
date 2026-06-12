.MODEL SMALL
.STACK 500H

.DATA 

; CAC DONG T1, T2, T3 VA T4 DUOC DUNG DE VE LOGO TIC - TAC - TOE
T1 DB  4,  4, 4,  4,  4, 32,  4, 32,  4,  4,  4,  4, 32, 32, 32,  4,  4,  4, 4,  4, 32, 32,  4,  4, 32, 32,  4, 4,  4,  4,  32, 32, 32,   4,  4, 4,  4,  4,  32, 32,  4,   4, 32, 32, 4, 4, 4, 4, '$'
T2 DB 32, 32, 4, 32, 32, 32,  4, 32,  4, 32, 32, 32, 32, 32, 32, 32, 32, 4, 32, 32, 32,  4, 32, 32,  4, 32,  4, 32, 32, 32, 32, 32, 32 , 32, 32, 4, 32, 32,  32,  4, 32,  32,  4, 32, 4,'$'
T3 DB 32, 32, 4, 32, 32, 32,  4, 32,  4, 32, 32, 32, 32, 32, 32, 32, 32, 4, 32, 32, 32,  4,  4,  4,  4, 32,  4, 32, 32, 32, 32, 32, 32 , 32, 32, 4, 32, 32,  32,  4, 32,  32,  4, 32, 4, 4, 4, 4,'$' 
T4 DB 32, 32, 4, 32, 32, 32,  4, 32,  4,  4,  4,  4, 32,  4, 32, 32, 32, 4, 32, 32, 32,  4, 32, 32,  4, 32,  4,  4,  4,  4, 32,  4, 32 , 32, 32, 4, 32, 32,  32, 32,  4,   4, 32, 32, 4, 4, 4, 4,'$'
;--------------------------------------------------------------------

TAGLINE DB  'Do an mon hoc ktmt&hn' 

; ----------------- CHUOI THONG BAO MENU -----------------------
M1 DB '1. Che do 2 nguoi choi$'
M2 DB '2. Choi voi may$'
M3 DB '3. Thoat chuong trinh$'
M_PROMPT DB 'Nhap lua chon cua ban (1-3): $'

; ----------------- CAC CHUOI THONG BAO TRONG GAME -----------------
PAK DB 'Nhan phim bat ky de tiep tuc...$'
PAE DB 'Nhan Enter de quay lai Menu...$'

; LUAT CHOI
R DB 'LUAT CHOI:$' 
R1 DB '1. Hai nguoi choi se thay phien nhau di.$'
R2 DB '2. Nguoi choi 1 se bat dau truoc.$'
R3 DB '3. Nguoi choi 1 danh dau "X" va Nguoi choi 2 danh dau "O".$'
R4 DB '4. Ban co duoc danh so cac o tu 1 den 9.$'
R5 DB '5. Nhap SO O de dat dau cua ban.$'
R6 DB '6. Tao thanh 3 dau giong nhau theo hang ngang, doc hoac cheo de THANG.$'   
R7 DB 'Chuc ban may man!$'
 
; KY HIEU NGUOI CHOI
PC1 DB ' (X)$'
PC2 DB ' (O)$' 

; DUONG KE BAN CO -------
L1 DB '   |   |   $'
L2 DB '-----------$'
N1 DB ' | $'
; -------------------

; CAC O BAN CO ------
C1 DB '1$' 
C2 DB '2$'
C3 DB '3$'
C4 DB '4$'
C5 DB '5$'
C6 DB '6$'
C7 DB '7$'
C8 DB '8$'
C9 DB '9$'
; -------------------

; CAC BIEN TRANG THAI GAME
PLAYER DB 50, '$' 
MOVES DB 0
DONE DB 0
DR DB 0 

; CAC THONG BAO KHI NHAP CHON -------------------------
INP DB 32, ':: Nhap so o muon di: $'
TKN DB 'O nay da co nguoi chon! Nhan phim bat ky...$' 

; NUOC DI HIEN TAI (X/O) ---------------------------
CUR DB 88

; KET QUA CHUNG CUOC -------------------------------
W1 DB 'Nguoi choi $'
W2 DB ' da CHIEN THANG!$'
DRW DB 'Tran dau HOA!$'

; THONG BAO KHI NHAP SAI VADO XOA DONG LUAN LUU -----------------------------
WI DB  32, 32, 32, 'Nhap sai! Nhan phim bat ky de nhap la...$' 
EMP DB '                                                       $'  

;--------------------------------------------------------

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
; --------- HIEN THI MAN HINH CHAO MONG ---------    
    TITLESCREEN:
    
        ; VE LOGO START -----------------
            MOV AH, 2
            MOV BH, 0
            MOV DH, 6
            MOV DL, 14
            INT 10H 
            
        LEA DX, T1
        MOV AH, 9
        INT 21H

            MOV AH, 2
            MOV DH, 7
            MOV DL, 14
            INT 10H 
            
        LEA DX, T2
        MOV AH, 9
        INT 21H
                         
            MOV AH, 2
            MOV DH, 8
            MOV DL, 14
            INT 10H 
           
        LEA DX, T3
        MOV AH, 9
        INT 21H
                
            MOV AH, 2
            MOV DH, 9
            MOV DL, 14
            INT 10H  
              
        LEA DX, T2
        MOV AH, 9
        INT 21H

            MOV AH, 2
            MOV DH, 10
            MOV DL, 14
            INT 10H 
        
        LEA DX, T4
        MOV AH, 9
        INT 21H 
        ; VE LOGO END -----------------
        
            MOV AH, 2
            MOV DH, 12
            MOV DL, 22
            INT 10H 
            
        LEA DX, TAGLINE  
        MOV AH, 9
        INT 21H
        
            MOV AH, 2
            MOV DH, 13
            MOV DL, 24
            INT 10H  
         
        LEA DX, PAK  
        MOV AH, 9
        INT 21H
        
        MOV AH, 7    
        INT 21H
        
            ; XOA MAN HINH     
            MOV AX,0600H 
            MOV BH,07H 
            MOV CX,0000H 
            MOV DX,184FH 
            INT 10H 
            
            JMP MENU_SCREEN


; ----------- HIEN THI MENU CHINH --------------

    MENU_SCREEN:
        ; XOA MAN HINH
        MOV AX,0600H 
        MOV BH,07H 
        MOV CX,0000H 
        MOV DX,184FH 
        INT 10H 

        ; MUC 1
        MOV AH, 2
        MOV BH, 0
        MOV DH, 8
        MOV DL, 22
        INT 10H 
        LEA DX, M1
        MOV AH, 9
        INT 21H

        ; MUC 2
        MOV AH, 2
        MOV DH, 10
        MOV DL, 22
        INT 10H 
        LEA DX, M2
        MOV AH, 9
        INT 21H

        ; MUC 3
        MOV AH, 2
        MOV DH, 12
        MOV DL, 22
        INT 10H 
        LEA DX, M3
        MOV AH, 9
        INT 21H

        ; DONG NHAC NGUOI DUNG
        MOV AH, 2
        MOV DH, 15
        MOV DL, 22
        INT 10H 
        LEA DX, M_PROMPT
        MOV AH, 9
        INT 21H

        ; NHAN LUA CHON TU BAN PHIM
        MOV AH, 1
        INT 21H

        CMP AL, 49 ; Phím '1' -> Choi game
        JZ RULES

        CMP AL, 50 ; Phím '2'
        JZ AI_MODE

        CMP AL, 51 ; Phím '3' -> Thoát
        JNZ MENU_SCREEN ; Neu KHONG PHAI phim 3 (va cung da qua kiem tra 1, 2) thi load lai Menu
        
        JMP EXIT ; Neu DUNG LA phim 3 thi nhay vinh vien toi nhan EXIT

    AI_MODE:
        ; Tam thoi quay lai menu vi chua ho tro
        MOV AH, 2
        MOV DH, 17
        MOV DL, 22
        INT 10H
        LEA DX, PAK
        MOV AH, 9
        INT 21H
        MOV AH, 7
        INT 21H
        JMP MENU_SCREEN


; ----------- HIEN THI LUAT CHOI --------------
                                               
    RULES:
            MOV AX,0600H 
            MOV BH,07H 
            MOV CX,0000H 
            MOV DX,184FH 
            INT 10H

            MOV AH, 2
            MOV BH, 0
            MOV DH, 5
            MOV DL, 7
            INT 10H
        
        LEA DX, R
        MOV AH, 9
        INT 21H
        
            MOV AH, 2
            MOV DH, 7
            MOV DL, 7
            INT 10H 
        
        LEA DX, R1   
        MOV AH, 9
        INT 21H 
        
            MOV AH, 2
            MOV DH, 8
            MOV DL, 7
            INT 10H 
        
        LEA DX, R2   
        MOV AH, 9
        INT 21H
        
            MOV AH, 2
            MOV DH, 9
            MOV DL, 7
            INT 10H 
        
        LEA DX, R3   
        MOV AH, 9
        INT 21H
        
            MOV AH, 2
            MOV DH, 10
            MOV DL, 7
            INT 10H
        
        LEA DX, R4   
        MOV AH, 9
        INT 21H
  
            MOV AH, 2
            MOV DH, 11
            MOV DL, 7
            INT 10H      
            
        LEA DX, R5  
        MOV AH, 9
        INT 21H
            
            MOV AH, 2
            MOV DH, 12
            MOV DL, 7
            INT 10H
            
        LEA DX, R6
        MOV AH, 9
        INT 21H
           
            MOV AH, 2
            MOV DH, 13
            MOV DL, 7
            INT 10H
             
       LEA DX, R7
       MOV AH, 9
       INT 21H
            
            MOV AH, 2
            MOV DH, 15
            MOV DL, 7
            INT 10H     
        
        LEA DX, PAK 
        MOV AH, 9
        INT 21H
        
        MOV AH, 7   
        INT 21H 
        
 ; ---------- KET THUC LUAT CHOI ---------
 
        
 ; ---------- KHOI TAO BIEN TRUOC KHI CHOI ---------------------
       
       INIT: 
            MOV PLAYER, 50     
            MOV MOVES, 0  
            MOV DONE, 0
            MOV DR, 0 
            
            MOV C1, 49
            MOV C2, 50
            MOV C3, 51
            MOV C4, 52
            MOV C5, 53
            MOV C6, 54
            MOV C7, 55
            MOV C8, 56
            MOV C9, 57
                                                  
            JMP PLRCHANGE

; ---------- END INITALIZATION --------------

                       
; ------------ THONG BAO CHIEN THANG ------------------------

    VICTORY:
            LEA DX, W1
            MOV AH, 9
            INT 21H
            
            LEA DX, PLAYER
            MOV AH, 9
            INT 21H
            
            LEA DX, W2
            MOV AH, 9
            INT 21H
            
                ; SET CURSOR DE HIEN DONG CHU QUAY VE MENU
                MOV AH, 2
                MOV DH, 18
                MOV DL, 20 
                INT 10H  
                
            LEA DX, PAE  ; Nhan Enter de ve menu
            MOV AH, 9
            INT 21H
            
    WAIT_ENTER_V:
            MOV AH, 7    ; Nhan nut nhung khong hien thi ra (No Echo)
            INT 21H    
            CMP AL, 13   ; Kiem tra neu dung la phim Enter (ASCII = 13)
            JNZ WAIT_ENTER_V
            
            JMP MENU_SCREEN 
            
            
; ------------ THONG BAO HOA ------------  

    DRAW:
            LEA DX, DRW
            MOV AH, 9
            INT 21H 
            
                ; SET CURSOR
                MOV AH, 2
                MOV DH, 18
                MOV DL, 20 
                INT 10H
                
            LEA DX, PAE 
            MOV AH, 9
            INT 21H
            
    WAIT_ENTER_D:
            MOV AH, 7   
            INT 21H    
            CMP AL, 13   ; Cho den khi nguoi dung an dung phim Enter
            JNZ WAIT_ENTER_D
            
            JMP MENU_SCREEN                      


; ------------ KIEM TRA DIEU KIEN THANG/HOA -----------

    CHECK:   ; Co 8 truong hop thang co the xay ra 
        
        CHECK1:  ; DUONG 1, 2, 3 
            MOV AL, C1
            MOV BL, C2 
            MOV CL, C3
            
            CMP AL, BL
            JNZ CHECK2
            
            CMP BL, CL
            JNZ CHECK2
            
            MOV DONE, 1
            JMP BOARD
            
        CHECK2:  ; DUONG 4, 5, 6 
            MOV AL, C4
            MOV BL, C5 
            MOV CL, C6
            
            CMP AL, BL
            JNZ CHECK3
            
            CMP BL, CL
            JNZ CHECK3
          
            MOV DONE, 1
            JMP BOARD
                       
       CHECK3:  ; DUONG 7, 8, 9
            MOV AL, C7
            MOV BL, C8 
            MOV CL, C9
            
            CMP AL, BL
            JNZ CHECK4
            
            CMP BL, CL
            JNZ CHECK4 
            
            MOV DONE, 1
            JMP BOARD
                         
       CHECK4:   ; DUONG 1, 4, 7
            MOV AL, C1
            MOV BL, C4 
            MOV CL, C7
            
            CMP AL, BL
            JNZ CHECK5
            
            CMP BL, CL
            JNZ CHECK5
        
            MOV DONE, 1
            JMP BOARD
              
       CHECK5:   ; DUONG 2, 5, 8
            MOV AL, C2
            MOV BL, C5 
            MOV CL, C8
            
            CMP AL, BL
            JNZ CHECK6
            
            CMP BL, CL
            JNZ CHECK6
        
            MOV DONE, 1
            JMP BOARD
                   
       CHECK6:   ; DUONG 3, 6, 9
            MOV AL, C3
            MOV BL, C6 
            MOV CL, C9
            
            CMP AL, BL
            JNZ CHECK7
            
            CMP BL, CL
            JNZ CHECK7
        
            MOV DONE, 1
            JMP BOARD
                    
        CHECK7:   ; DUONG 1, 5, 9
            MOV AL, C1
            MOV BL, C5 
            MOV CL, C9
            
            CMP AL, BL
            JNZ CHECK8
            
            CMP BL, CL
            JNZ CHECK8
        
            MOV DONE, 1
            JMP BOARD  
                    
        CHECK8:   ; DUONG 3, 5, 7
            MOV AL, C3
            MOV BL, C5 
            MOV CL, C7
            
            CMP AL, BL
            JNZ DRAWCHECK
            
            CMP BL, CL
            JNZ DRAWCHECK
            
            MOV DONE, 1
            JMP BOARD
            
       DRAWCHECK:
            MOV AL, MOVES
            CMP AL, 9
            JB PLRCHANGE
            
            MOV DR, 1
            JMP BOARD
            
            JMP EXIT
       

; ------------ DOI LUOT NGUOI CHOI ----------        
    PLRCHANGE:
                         
        CMP PLAYER, 49
        JZ P2
        CMP PLAYER, 50
        JZ P1
        
        P1:
            MOV PLAYER, 49
            MOV CUR, 88
            JMP BOARD
             
        P2:
            MOV PLAYER, 50
            MOV CUR, 79
            JMP BOARD


; ------------- VEL LAI BAN CO ----------   
    BOARD: 
               
        MOV AX,0600H 
        MOV BH,07H 
        MOV CX,0000H 
        MOV DX,184FH 
        INT 10H
    
        MOV AH, 2
        MOV BH, 0
        MOV DH, 6
        MOV DL, 30
        INT 10H   
        
    LEA DX, L1
    MOV AH, 9
    INT 21H 
     
        MOV AH, 2
        MOV DH, 7
        MOV DL, 30 
        INT 10H
    
    MOV AH, 2
    MOV DL, 32
    INT 21H

; --------------------------------    
    ; CELL 1 
    LEA DX, C1
    MOV AH, 9
    INT 21H 
    
    LEA DX, N1
    MOV AH, 9
    INT 21H
    
    ; CELL 2
    LEA DX, C2
    MOV AH, 9
    INT 21H
    
    LEA DX, N1
    MOV AH, 9
    INT 21H
    
    ; CELL 3
    LEA DX, C3
    MOV AH, 9
    INT 21H
; ---------------------------------    
    
        MOV AH, 2
        MOV DH, 8
        MOV DL, 30 
        INT 10H 
     
    LEA DX, L2
    MOV AH, 9
    INT 21H 
    
        MOV AH, 2
        MOV DH, 9
        MOV DL, 30 
        INT 10H
    
    LEA DX, L1
    MOV AH, 9
    INT 21H 
    
        MOV AH, 2
        MOV DH, 10
        MOV DL, 30 
        INT 10H
    
    MOV AH, 2
    MOV DL, 32
    INT 21H
    
; --------------------------------    
    ; CELL 4 
    LEA DX, C4
    MOV AH, 9
    INT 21H 
    
    LEA DX, N1
    MOV AH, 9
    INT 21H
    
    ; CELL 5
    LEA DX, C5
    MOV AH, 9
    INT 21H
    
    LEA DX, N1
    MOV AH, 9
    INT 21H
    
    ; CELL 6
    LEA DX, C6
    MOV AH, 9
    INT 21H
; ---------------------------------     

        MOV AH, 2
        MOV DH, 11
        MOV DL, 30 
        INT 10H
        
    LEA DX, L1
    MOV AH, 9
    INT 21H 
 
        MOV AH, 2
        MOV DH, 12
        MOV DL, 30 
        INT 10H 
     
    LEA DX, L2
    MOV AH, 9
    INT 21H 
    
        MOV AH, 2
        MOV DH, 13
        MOV DL, 30 
        INT 10H
    
    LEA DX, L1
    MOV AH, 9
    INT 21H 
    
        MOV AH, 2
        MOV DH, 14
        MOV DL, 30 
        INT 10H 
    
    MOV AH, 2
    MOV DL, 32
    INT 21H   
    
         
; --------------------------------    
    ; CELL 7 
    LEA DX, C7
    MOV AH, 9
    INT 21H 
    
    LEA DX, N1
    MOV AH, 9
    INT 21H
    
    ; CELL 8
    LEA DX, C8
    MOV AH, 9
    INT 21H
    
    LEA DX, N1
    MOV AH, 9
    INT 21H
    
    ; CELL 9
    LEA DX, C9
    MOV AH, 9
    INT 21H
; ---------------------------------     

        MOV AH, 2
        MOV DH, 15
        MOV DL, 30 
        INT 10H 
     
    LEA DX, L1
    MOV AH, 9
    INT 21H
     
        MOV AH, 2
        MOV DH, 16
        MOV DL, 20 
        INT 10H
    
    ; DIEU HUONG NEU TRAN DAU KET THUC
    CMP DONE, 1
    JZ VICTORY
    
    CMP DR, 1
    JZ DRAW
     
; ------------ KET THUC VE BAN CO -------
         
; ------------ XU LY NHAP NUOC DI --------------

    INPUT:
    LEA DX, W1
    MOV AH, 9
    INT 21H
    
    MOV AH, 2
    MOV DL, PLAYER
    INT 21H
    
    CMP PLAYER, 49
    JZ PL1
    
        LEA DX, PC2
        MOV AH, 9
        INT 21H
        JMP TAKEINPUT
    
        PL1:
            LEA DX, PC1
            MOV AH, 9
            INT 21H 
    
    TAKEINPUT:
    LEA DX, INP
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H 
    
    INC MOVES 
     
    MOV BL, AL 
    SUB BL, 48
    
    MOV CL, CUR 
    
    ; KIEM TRA GIA TRI NHAP (1 HOAC 9)
    CMP BL, 1
    JZ  C1U 
    
    CMP BL, 2
    JZ  C2U
    
    CMP BL, 3
    JZ  C3U
    
    CMP BL, 4
    JZ  C4U
    
    CMP BL, 5
    JZ  C5U
    
    CMP BL, 6
    JZ  C6U
    
    CMP BL, 7
    JZ  C7U
    
    CMP BL, 8
    JZ  C8U
    
    CMP BL, 9
    JZ  C9U  
    ;---------------------------------
    
    ; TRUONG HOP NHAP GIA TRI HOP LE
    DEC MOVES 
    
        MOV AH, 2
        MOV DH, 16
        MOV DL, 20 
        INT 10H 
        
    LEA DX, WI  
    MOV AH, 9
    INT 21H
    
    MOV AH, 7   
    INT 21H
    
        MOV AH, 2
        MOV DH, 16
        MOV DL, 20 
        INT 10H
        
    LEA DX, EMP  
    MOV AH, 9
    INT 21H  
    
        MOV AH, 2
        MOV DH, 16
        MOV DL, 20 
        INT 10H
    
    JMP INPUT
    
    TAKEN:
        DEC MOVES
            MOV AH, 2
            MOV DH, 16
            MOV DL, 20 
            INT 10H   
            
        LEA DX, TKN   
        MOV AH, 9
        INT 21H  
        
        MOV AH, 7     
        INT 21H 
        
            MOV AH, 2
            MOV DH, 16
            MOV DL, 20 
            INT 10H
            
        LEA DX, EMP   
        MOV AH, 9
        INT 21H 
        
            MOV AH, 2
            MOV DH, 16
            MOV DL, 20 
            INT 10H
        
        JMP INPUT
        
    ; CAP NHAT LAI KI TU TREN BAN CO
        C1U:
            CMP C1, 88  
            JZ TAKEN
            CMP C1, 79  
            JZ TAKEN 
            
            MOV C1, CL
            JMP CHECK
             
        C2U:
            CMP C2, 88  
            JZ TAKEN
            CMP C2, 79  
            JZ TAKEN 
            
            MOV C2, CL
            JMP CHECK
        C3U:
            CMP C3, 88  
            JZ TAKEN
            CMP C3, 79  
            JZ TAKEN 
            
            MOV C3, CL
            JMP CHECK
        C4U: 
            CMP C4, 88  
            JZ TAKEN
            CMP C4, 79  
            JZ TAKEN 
            
            MOV C4, CL
            JMP CHECK 
        C5U: 
            CMP C5, 88  
            JZ TAKEN
            CMP C5, 79  
            JZ TAKEN 
            
            MOV C5, CL
            JMP CHECK
        C6U:
            CMP C6, 88  
            JZ TAKEN
            CMP C6, 79  
            JZ TAKEN 
            
            MOV C6, CL
            JMP CHECK
        C7U: 
            CMP C7, 88   
            JZ TAKEN
            CMP C7, 79   
            JZ TAKEN 
            
            MOV C7, CL
            JMP CHECK 
        C8U: 
            CMP C8, 88   
            JZ TAKEN
            CMP C8, 79   
            JZ TAKEN 
            
            MOV C8, CL
            JMP CHECK
        C9U:
            CMP C9, 88   
            JZ TAKEN
            CMP C9, 79   
            JZ TAKEN 
            
            MOV C9, CL
            JMP CHECK
; --------------------------------            

    EXIT:
    MOV AH, 4CH
    INT 21H 
    MAIN ENDP
END MAIN