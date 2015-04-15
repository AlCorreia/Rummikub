let fin := 0;
repeat {
	let i_alea := floor(Uniform(1,NB_NUM));
	let j_alea := floor(Uniform(1,NB_COUL));
	if carte_main[i_alea, j_alea] = 0 && carte_main[i_alea, j_alea] = 1 then
		let fin := 1;
	} until fin = 1;
	
	printf "carte piochee % % \n", i_alea, j_alea;
	