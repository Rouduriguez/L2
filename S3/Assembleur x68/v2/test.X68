*-----------------------------------------------------------
* Trace la grille en fonction de la difficulte choisie
* Une grille par difficulté 
* A faire : imiter l'interface du demineur OG
*-----------------------------------------------------------
    ORG    $1000
START:                  
    MOVE.W  #675,D1
    SWAP    D1
    MOVE.W  #675,D1
    JSR RESOLUTION
    
    MOVE.L  #CHAR,A1
PRINT_DIFFICULTE: * soigner l'ecran de selection
    MOVE.L  #$00FF0000,D1
    JSR SET_FILL_COLOR
    MOVE.W  #100,D1
    MOVE.W  #100,D2
    MOVE.W  #200,D3
    MOVE.W  #150,D4
    JSR DRAW_FILL_RECT
    MOVE.L  #$0000FF00,D1
    JSR SET_FILL_COLOR
    MOVE.W  D3,D1
    ADD.W  #50,D1 * car D3 = D1 + 100
    ADD.W  #150,D3
    JSR DRAW_FILL_RECT
    MOVE.L  #$000000FF,D1
    JSR SET_FILL_COLOR
    MOVE.W  D3,D1
    ADD.W  #50,D1 
    ADD.W  #150,D3
    JSR DRAW_FILL_RECT
FIN_PRINT_BOUTONS:
    
CHOIX_DIFFICULTE:
    MOVE.L  #0,D1
    JSR GET_MOUSE
    AND.B   #1,D0
    CMP.B   #1,D0
    BNE CHOIX_DIFFICULTE
    SWAP    D1
    MOVE.W  D1,D2
    SWAP    D1
    JSR GET_PIX_COLOR
    MOVE.L  D0,D1
    CMP.L  #$00FF0000,D1
    BEQ FACILE
    CMP.L  #$0000FF00,D1
    BEQ MOYEN
    CMP.L  #$000000FF,D1
    BEQ DIFFICILE
    BRA CHOIX_DIFFICULTE
FIN_CHOIX_DIFFICULTE:
    MOVE.W  NB_COLONNES,NB_TRAITS
    ADD.W  #1,NB_TRAITS
    MOVE.W  #$FF00,D1
    JSR POS_CURS * Efface l'ecran
    JSR PRINT_LIGNES_GRILLE
    JSR COULEUR_GRILLE
    JSR PRINT_CHAR_GRILLE    

    
    JMP FINPRG
    
FACILE:
    * grille_facile += 25*rand(0,n-1) si on veut une grille random parmi n grilles
    MOVE.L  #GRILLE_FACILE,A0
    MOVE.W  #5,NB_COLONNES
    MOVE.W  #135,LARGEUR_CASE
    MOVE.B  #22,CASES_RESTANTES * nb Cases - nb Bombes
    BRA FIN_CHOIX_DIFFICULTE
MOYEN:
    * grille += 100*rand(0,n-1)
    MOVE.L  #GRILLE_MOYENNE,A0
    MOVE.W  #9,NB_COLONNES
    MOVE.W  #75,LARGEUR_CASE
    MOVE.B  #90,CASES_RESTANTES * 100 - (10 bombes)
    BRA FIN_CHOIX_DIFFICULTE
DIFFICILE:
    * grille += 225*rand(0,n-1)
    MOVE.L  #GRILLE_DIFFICILE,A0
    MOVE.W  #15,NB_COLONNES
    MOVE.W  #45,LARGEUR_CASE
    MOVE.B  #185,CASES_RESTANTES * 225 - (40 bombes)
    BRA FIN_CHOIX_DIFFICULTE
    

    INCLUDE 'BIBPERIPH.x68'
    INCLUDE 'BIBLIO.x68'
    INCLUDE 'BIBGRAPH.x68'
    INCLUDE 'BIB_DEMINEUR.x68'
    
        
    ORG     $3000

NB_COLONNES:    DS.W 1
NB_TRAITS: DS.W 1
LARGEUR_CASE:   DS.W 1
CENTRE_CASE:    DS.W 1
X_MAX:  DC.W 675 * (multiple de 45)
X:  DS.W 1
Y:  DS.W 1
COULEUR_CACHEE: DC.L $00E6E0B0
COULEUR_CRAYON: DC.L $00BBBBBB
CHRONO: DC.L 0
CHAR:   DC.W 0
CHAINE_CHRONO:  DS.B 4 
CHAINE: DS.B 200
EASY:   DC.B 'Easy...',0
MEDIUM: DC.B 'Medium.',0
HARD:   DC.B 'Hard !',0
N:  DC.B 'N'
CASES_RESTANTES:    DS.B 1
MSG_VICTOIRE:   DC.B 'Bravo pour cette belle victoire !',0
MSG_DEFAITE:    DC.B 'Dommage ! C est perdu...',0
GRILLE_FACILE: DC.B 'B2B101322001B100111000000'
GRILLE_MOYENNE:	DC.B '00001110000001B210000013B20000003B30111112B20B11B1111012221000012B211111B212B11B1'
GRILLE_DIFFICILE: DC.B '0001110000000111111B211000001B2B2223B332100112B32B22BBB2121112B32224B43B2B1122B11B323B2211B2122213B311011B312B102B31102BB21B221212B113B111111B101222B200000122112B3210000112B22B3B1000001B33B213231110124B31101B2BB101B3B20001121'

    END    START 
