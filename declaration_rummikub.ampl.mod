param NB_NUM;
set numeros := {1..NB_NUM};
param NB_COUL;
set couleurs := {1..NB_COUL};
param NB_JOUEURS;
set joueurs := {1..NB_JOUEURS};

param NB_MUL;
param NB_GROUPES; # Nombre total de groupes possibles
param NB_CARTES;

param carte_table{numeros, couleurs} default 0; #ti
param carte_main{numeros, couleurs} default 0; #ri
param main{joueurs,numeros, couleurs} default 1;
param mont{numeros, couleurs} default NB_MUL;
param carte_table_joker;
param carte_main_joker;

#parametres auxilieres
param count integer;
param nb_tiles integer; #nombre de pieces en chaque groupe
param num integer;
param count_num integer;
param count_colour integer;
param i integer;
param j integer;
param k integer;