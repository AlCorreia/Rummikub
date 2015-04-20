param NB_NUM;
set numeros := {0..NB_NUM};
param NB_COUL;
set couleurs := {1..NB_COUL};

param NB_MUL; #Nombre de jeux de cartes
param NB_GROUPES; # Nombre total de groupes possibles
param carte_table{numeros, couleurs}; #ti
param carte_main{numeros, couleurs}; #ri
param carte_table_joker;
param carte_main_joker;



