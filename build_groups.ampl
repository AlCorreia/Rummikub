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
param NB_BAR; #nombre de jokers

#initialisation des parametres auxilieres
let count := 1;
let nb_tiles := 3;
let num := 1;
let count_num := 1;
let count_colour := 0;
let c := 1;
let i := 1;
let j := 1;
let k := 1;
let l := 1;
let dd := 1;
let l2 := 1;


# Initialisation du tableau s
param s{1..NB_GROUPES, 1..(NB_NUM*NB_COUL)} default 0, integer, <= NB_MUL ; # Tableau avec les cartes de chaque groupe

#Groupes de 3, 4, 5 cartes consecutives sans joker (123, 1234, 12345)
let nb_tiles := 3;
repeat {
	let count_colour := 0;
	repeat {
		let j := 1;
		repeat {
			let i := 0;
           	repeat {
				let s[count, j + i + NB_NUM*count_colour] := 1 ;
				let i := i + 1;
			} until i = nb_tiles;
			let count := count + 1;
			let j := j + 1;
		} until j = NB_NUM - nb_tiles + 2;
		let count_colour := count_colour + 1;
	} until count_colour = 4; 
	let nb_tiles := nb_tiles + 1;
} while nb_tiles < 6; 

#Groupes de 3 cartes de couleurs differentes sans joker (111)
let nb_tiles := 3;
let i := 1;
repeat until i = (NB_NUM + 1) {
	let k := 0;
    repeat until k = 4 {
    	let j := 0;
        repeat until j = nb_tiles {
            let num := i + NB_NUM*j + k*NB_NUM;
            if(num > NB_COUL*NB_NUM) then { #attention joker = 53
                let num := num mod (NB_COUL*NB_NUM);
          	}
            let s[count, num] := 1;
            let j := j + 1;
       }
        let count := count + 1;
        let k := k + 1;
    }
    let i := i + 1;
};

#Groupes de 4 cartes de couleurs differentes sans joker (1111)
let nb_tiles := 4;
let i := 1;
repeat until i = (NB_NUM + 1){
	let j := 0;
    repeat until j = nb_tiles {
        let s[count, i + NB_NUM*j] := 1;
        let j := j + 1;
    }
    let count := count + 1;
    let i := i + 1;
};