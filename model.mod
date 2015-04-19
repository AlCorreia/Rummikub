#model

var y{1..NB_NUM*NB_COUL} <= NB_MUL, integer; 
var x{1..NB_GROUPES} binary; 

maximize obj:sum {m in 1..NB_NUM*NB_COUL} y[m]*m;

subject to 
c1 {m in 1..NB_NUM, n in 1..NB_COUL} : 
	sum{o in 1..NB_GROUPES} s[o, (n-1)*NB_NUM + m]*x[o] = y[(n-1)*NB_NUM + m] + carte_table[m,n];
c2 {m in 1..NB_NUM, n in 1..NB_COUL} : 
	y[(n-1)*NB_NUM + m] <= carte_main[m,n];
