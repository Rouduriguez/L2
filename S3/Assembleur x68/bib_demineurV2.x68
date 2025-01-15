RESET_D:
    MOVE.L  #0,D0
    MOVE.L  #0,D1
    MOVE.L  #0,D2
    MOVE.L  #0,D3
    MOVE.L  #0,D4
    MOVE.L  #0,D5
    MOVE.L  #0,D6
    *MOVE.L  #0,D7
    RTS

PRINT_LIGNES_GRILLE:
    JSR RESET_D
    MOVE.L #$00FFFFFF,D1
    JSR SET_PEN_COLOR
    MOVE.B #3,D1
    JSR WIDTH_PEN
    JSR RESET_D
    MOVE X_MAX,D4
LIGNES_VERTICALES:
    JSR DRAW_LINE
    ADD.W LARGEUR_CASE,D1
    ADD.W LARGEUR_CASE,D3
    ADD.W #1,D5    
    CMP.W NB_TRAITS,D5
    BNE LIGNES_VERTICALES
FIN_LIGNES_VERTICALES:
    JSR RESET_D
    MOVE X_MAX,D3
LIGNES_HORIZONTALES:
    JSR DRAW_LINE
    ADD.W LARGEUR_CASE,D2
    ADD.W LARGEUR_CASE,D4    
    ADD.W #1,D5    
    CMP.W NB_TRAITS,D5
    BNE LIGNES_HORIZONTALES
    JSR RESET_D
    RTS   
    
COULEUR_GRILLE: * compteurs : D5 pour x et D6 y
    JSR RESET_D
    MOVE.L COULEUR_CRAYON,D1
    JSR SET_PEN_COLOR
    MOVE.L COULEUR_CACHEE,D1
    JSR SET_FILL_COLOR
    JSR RESET_D
    MOVE.W  LARGEUR_CASE,D3
    MOVE.W  LARGEUR_CASE,D4   
REPETE_COULEUR_LARGEUR:  
    JSR DRAW_FILL_RECT
    ADD.W   LARGEUR_CASE,D1
    ADD.W   LARGEUR_CASE,D3
    ADD.W   #1,D5
    CMP.W   NB_COLONNES,D5
    BNE REPETE_COULEUR_LARGEUR
REPETE_COULEUR_HAUTEUR:
    MOVE.W  #0,D1 * "retour chariot"
    MOVE.W  LARGEUR_CASE,D3
    ADD.W   LARGEUR_CASE,D2
    ADD.W   LARGEUR_CASE,D4
    MOVE.W  #0,D5    
    ADD.W   #1,D6
    CMP.W   NB_COLONNES,D6
    BNE REPETE_COULEUR_LARGEUR
    JSR RESET_D
    RTS
    

PRINT_CHAR_GRILLE: * compteurs : D3 pour x et D4 y
    JSR RESET_D
    MOVE.W  LARGEUR_CASE,D1
    ASR.W   #1,D1
    MOVE.W  D1,D2
    MOVE.L #GRILLE_SOLUTION,A1    
REPETE_CHAR_LARGEUR:    
    JSR DRAW_STRING
    ADD.L   #2,A1
    ADD.W   LARGEUR_CASE,D1
    ADD.B   #1,D3
    CMP.B   NB_COLONNES,D3
    BNE REPETE_CHAR_LARGEUR
REPETE_CHAR_HAUTEUR:
    MOVE.W  LARGEUR_CASE,D1 * "retour chariot"
    ASR.W   #1,D1
    ADD.W   LARGEUR_CASE,D2
    MOVE.W  #0,D3
    ADD.B   #1,D4
    CMP.B   NB_COLONNES,D4
    BNE REPETE_CHAR_LARGEUR
    JSR RESET_D
    RTS
    
GET_I: * X/Y .W -> D1.B = indice de la case cliquee    
    JSR RESET_D
    MOVE.L  #GRILLE_SOLUTION,A0
    MOVE.W  X,D1
    MOVE.W  Y,D2
    DIVU    LARGEUR_CASE,D1 * indice x
    DIVU    LARGEUR_CASE,D2 * indice y
    MULU    NB_COLONNES,D2   
    ADD.W   D2,D1
    *MOVE.B  (A0,xxx),D1
    *JSR     AFFCAR
    RTS
