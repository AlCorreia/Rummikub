param NB_NUM;
set numeros := {1..NB_NUM};
param NB_COUL;
set couleurs := {0..NB_COUL};
param NB_MUL; #Nombre de jeux de cartes
param NB_BAR; #Nombre de jokers
param NB_GROUPES; # Nombre total de groupes possibles
param carte_table{numeros, couleurs}; #ti
param carte_main{numeros, couleurs}; #ri
param carte_table_joker;
param carte_main_joker;


#parametres auxilieres
param count integer;
param nb_tiles integer; #nombre de pieces en chaque groupe
param num integer;
param count_num integer;
param count_colour integer;
param c integer;
param i integer;
param j integer;
param k integer;
param l integer;
param l2 integer; 
param dd integer; 