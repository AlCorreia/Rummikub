#model

var y{m in 0..NB_NUM, n in 1..NB_COUL} <= NB_MUL, integer; 
var x{1..NB_GROUPES} binary; # Groupes qui apparaissent sur la table

maximize obj: y[0,1]*30 + sum {m in 1..NB_NUM, n in 1..NB_COUL} y[m,n]*m;

subject to 
c1 {m in 1..NB_NUM, n in 1..NB_COUL} : 
	sum{o in 1..NB_GROUPES} s[o, (n-1)*NB_NUM + m]*x[o] = y[m,n] + carte_table[m,n];
c2 : sum{o in 1..NB_GROUPES} s[o, 0]*x[o] = y[0,1] + carte_table[0,1];
c3 {m in 1..NB_NUM, n in 1..NB_COUL} :
	y[m,n] <= carte_main[m,n];
c4 : y[0,1] <= carte_main[0,1];

