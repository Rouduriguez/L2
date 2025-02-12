SET_ZERO_AFFICHEUR:
    MOVE.W  OX_AFFICHEUR,D1
    MOVE.W  OY_AFFICHEUR,D2
    RTS
    
SEG_A:
    JSR SET_ZERO_AFFICHEUR
    MOVE.W  D1,D3
    ADD.W   LON_SEG,D3
    MOVE.W  D2,D4
    JSR DRAW_LINE
    RTS
    
SEG_B:
    JSR SET_ZERO_AFFICHEUR
    ADD.W   LON_SEG,D1
    MOVE.W  D1,D3
    MOVE.W  D2,D4
    ADD.W   LON_SEG,D4
    JSR DRAW_LINE
    RTS
    
SEG_C:
    JSR SET_ZERO_AFFICHEUR
    ADD.W   LON_SEG,D1
    MOVE.W  D1,D3
    ADD.W   LON_SEG,D2
    MOVE.W  D2,D4
    ADD.W   LON_SEG,D4
    JSR DRAW_LINE
    RTS
    
SEG_D:
    JSR SET_ZERO_AFFICHEUR
    MOVE.W  D1,D3
    ADD.W   LON_SEG,D3
    ADD.W   LON_SEG,D2
    ADD.W   LON_SEG,D2
    MOVE.W  D2,D4
    JSR DRAW_LINE
    RTS    
    
SEG_E:
    JSR SET_ZERO_AFFICHEUR
    MOVE.W  D1,D3
    ADD.W   LON_SEG,D2
    MOVE.W  D2,D4
    ADD.W   LON_SEG,D4
    JSR DRAW_LINE
    RTS
    
SEG_F:
    JSR SET_ZERO_AFFICHEUR
    MOVE.W  D1,D3
    MOVE.W  D2,D4
    ADD.W   LON_SEG,D4
    JSR DRAW_LINE
    RTS  

SEG_G:
    JSR SET_ZERO_AFFICHEUR
    MOVE.W  D1,D3
    ADD.W   LON_SEG,D3
    ADD.W   LON_SEG,D2
    MOVE.W  D2,D4
    JSR DRAW_LINE
    RTS 

AFF_ZERO:
    JSR SEG_A
    JSR SEG_B
    JSR SEG_C
    JSR SEG_D
    JSR SEG_E
    JSR SEG_F
    RTS
    
AFF_UN:
    JSR SEG_B
    JSR SEG_C
    RTS
    
AFF_DEUX:
    JSR SEG_A
    JSR SEG_B
    JSR SEG_G
    JSR SEG_E
    JSR SEG_D
    RTS
    
AFF_TROIS:
    JSR SEG_A
    JSR SEG_B
    JSR SEG_C
    JSR SEG_D
    JSR SEG_G
    RTS
    
AFF_QUATRE:
    JSR SEG_F
    JSR SEG_G
    JSR SEG_B
    JSR SEG_C
    RTS
    
AFF_CINQ:
    JSR SEG_A
    JSR SEG_F
    JSR SEG_G
    JSR SEG_C
    JSR SEG_D
    RTS
    
AFF_SIX:
    JSR SEG_A
    JSR SEG_C
    JSR SEG_D
    JSR SEG_E
    JSR SEG_F
    JSR SEG_G
    RTS
    
AFF_SEPT:
    JSR SEG_A
    JSR SEG_B
    JSR SEG_C
    RTS
       
AFF_HUIT:
    JSR SEG_A
    JSR SEG_B
    JSR SEG_C
    JSR SEG_D
    JSR SEG_E
    JSR SEG_F
    JSR SEG_G
    RTS
    
AFF_NEUF:
    JSR SEG_A
    JSR SEG_B
    JSR SEG_C
    JSR SEG_D
    JSR SEG_F
    JSR SEG_G
    RTS

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
