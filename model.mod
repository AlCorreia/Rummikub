#model

var y{m in 1..NB_NUM, n in 1..NB_COUL} <= NB_MUL, integer; 
var x{1..NB_GROUPES} binary; 

maximize obj:sum {m in 1..NB_NUM, n in 1..NB_COUL} y[m,n]*m;

subject to 
c1 {m in 1..NB_NUM, n in 1..NB_COUL} : 
	sum{o in 1..NB_GROUPES} s[o, (n-1)*NB_NUM + m]*x[o] = y[m,n] + carte_table[m,n];
c2 {m in 1..NB_NUM, n in 1..NB_COUL} : 
	y[m,n] <= carte_main[m,n];