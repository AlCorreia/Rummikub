let fin := 0;
repeat {
	let i_alea := floor(Uniform(1,NB_NUM + 1));
	let j_alea := floor(Uniform(1,NB_COUL + 1));
	if carte_main[i_alea, j_alea] < NB_MUL && carte_table[i_alea, j_alea] < NB_MUL then
		let fin := 1;
	} until fin = 1;
	
	printf "/nCarte piochee %d %d \n", i_alea, j_alea;
	