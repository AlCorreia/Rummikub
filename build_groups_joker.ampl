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
let NB_BAR := NB_MUL; 


# Initialisation du tableau s
param s{1..NB_GROUPES, 0..(NB_NUM*NB_COUL)} default 0, integer, <= NB_MUL ; # Tableau avec les cartes de chaque groupe

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

if NB_BAR >= 1 then {

	#Groupes de 3, 4, 5 cartes consecutives avec 1 joker sans decalage (12J, 123J, 1234J)
	let nb_tiles := 2;
	repeat until nb_tiles = 5 {
		let count_colour := 0;
	    repeat until count_colour = 4 {
	    	let j := 1;	
	    	repeat until j = NB_NUM - nb_tiles + 2 {
	       		let i := 0;
	            repeat until i = nb_tiles {
	                let s[count, j + i + NB_NUM*count_colour] := 1;
	                let i := i + 1;
	            };
	            let s[count, 0] := 1;
	            let count := count + 1;
	            let j := j + 1;
	        };
	        let count_colour := count_colour + 1;
	    };
	    let nb_tiles := nb_tiles + 1;
	};

	#Groupes de 3, 4, 5 cartes consecutives avec 1 joker decale de 1 carte (1J3, 1J34 12J4, 1J345 12J45, 123J5)
	let nb_tiles := 2;
	repeat until nb_tiles = 5 {
		let count_colour := 0;
	    repeat until count_colour = 4 {
	    	let j := 1;	
	    	repeat until j = (NB_NUM - nb_tiles + 1) {
	            let i := 0;
	            repeat until i = (nb_tiles - 1) {
	            	let k := 0;
	            	repeat until k = (i + 1) {
	                    let s[count, j + NB_NUM*count_colour + k] := 1;
	                    let k := k + 1;
	                }; #Boucle k
	                let l := 0;
	                repeat until l = (nb_tiles - 1 - i) {
	                    let s[count, j + NB_NUM*count_colour + 2 + l + i] := 1;
	                    let l := l + 1;
	                }; #Boucle l
	                let s[count, 0] := 1;
	                let count := count + 1;
	                let i := i + 1;
	           }; #Boucle i
	           let j := j + 1;
	        }; #Boucle j
	        let count_colour := count_colour + 1;
	    }; #Boucle count_colour
	    let nb_tiles := nb_tiles + 1;
	}; #Boucle nb_tiles

	#Groupes de 3, 4 cartes de couleurs differentes avec 1 joker sans decalage (11J, 111J)
	let nb_tiles := 2;
	repeat until nb_tiles = 4 {
		let i := 1;
		repeat until i = NB_NUM + 1 {
			let k := 0;
	        repeat until k = 4 {
	        	let j := 0;
	           	repeat until j = nb_tiles {
	                let num := i + NB_NUM*j + k*NB_NUM;
	                if num > NB_COUL*NB_NUM then 
	                    let num := num mod (NB_COUL*NB_NUM);
	                let s[count, num] := 1;
	                let j := j + 1;
	            }; #Boucle j
	            let s[count, 0] := 1;
	            let count := count + 1;
	        	let k := k + 1;
	        }; #Boucle k
	    	let i := i + 1;
	    }; #Boucle i
	    let nb_tiles := nb_tiles + 1;
	}; #Boucle nb_tiles
	
	#Groupes de 3 cartes de couleurs differentes avec 1 joker decale de 1 carte (1J1)	
	let nb_tiles := 2;
	let i := 1; 
	repeat until i = NB_NUM + 1 {
		let k := 0; 
	    repeat until k = 2 {
	        let j := 0;
	        repeat until j = nb_tiles {
	            let num := i + NB_NUM*j*2 + k*NB_NUM;
	            if num > NB_COUL*NB_NUM then
	                let num := num mod (NB_COUL*NB_NUM);
	                
	            let s[count, num] := 1;
	            let j := j + 1;
	        }; #Boucle j
	            
	        let s[count, 0] := 1;
	        let count := count + 1;
	        let k := k + 1;
	    }; #Boucle k
	    let i := i + 1; 
	}; #Boucle i

}; #if NB_BAR >= 1

if NB_BAR >= 2 then {
	
	#Groupes de 4 cartes de couleurs differentes avec 2 jokers decale de 1 carte (1J1J)
	let nb_tiles := 2;
	let i := 1; 
	repeat until i = NB_NUM + 1 {
		let k := 0; 
	    repeat until k = 2 {
	        let j := 0;
	        repeat until j = nb_tiles {
	            let num := i + NB_NUM*j*2 + k*NB_NUM;
	            if num > NB_COUL*NB_NUM then
	                let num := num mod (NB_COUL*NB_NUM);
	                
	            let s[count, num] := 1;
	            let j := j + 1;
	        }; #Boucle j
	        
	            let s[count, 0] := 2;
	        let count := count + 1;
	        let k := k + 1;
	    }; #Boucle k
	    let i := i + 1; 
	}; #Boucle i
	
	#Groupes de 4 cartes de couleurs differentes avec 2 jokers sans decalage (11JJ)
	let nb_tiles := 2;
	let i := 1; 
	repeat until i = NB_NUM + 1 {
		let k := 0; 
	    repeat until k = 4 {
	        let j := 0;
	        repeat until j = nb_tiles {
	            let num := i + NB_NUM*j + k*NB_NUM;
	            if num > NB_COUL*NB_NUM then
	                let num := num mod (NB_COUL*NB_NUM);
	                
	            let s[count, num] := 1;
	            let j := j + 1;
	        }; #Boucle j
	        
	            let s[count, 0] := 2;
	        let count := count + 1;
	        let k := k + 1;
	    }; #Boucle k
	    let i := i + 1; 
	}; #Boucle i
	
	#Groupes de 3 cartes consecutives/memes couleurs avec 2 jokers decalage (1JJ)
	#Groupes de 4, 5 cartes consecutives avec 2 jokers sans decalage (11JJ, 111JJ)
	let nb_tiles := 1;
	repeat until nb_tiles = 4 {
		let count_colour := 0;
		repeat until count_colour = 4 {
			let j := 1;
			repeat until j = (NB_NUM - nb_tiles + 2) {
				let i := 0; 
	            repeat until i = nb_tiles {
	                let s[count, j + i + NB_NUM*count_colour] := 1;
	                let i := i + 1;
	           	}; #Boucle i
	            let s[count, 0] := 2;
	            let count := count + 1;
	            let j := j + 1;
	        }; #Boucle j
	        let count_colour := count_colour + 1;
	    }; #Boucle count_colour
	    let nb_tiles := nb_tiles + 1;
	}; #Boucle nb_tiles
	
	#Groupes de 4, 5 cartes consecutives avec 2 jokers decalge de 1, 2 cartes (1J1J 1JJ1, 1J11J 1JJ11 11J1J 11JJ1)
	let nb_tiles := 2;
	repeat until nb_tiles = 4 {
		let count_colour := 0;
		repeat until count_colour = 4 {
			let j := 1;
			repeat until j = (NB_NUM - nb_tiles + 1) {
				let i := 0;
				repeat until i = nb_tiles - 1 {
	                let dd := 2;
	                repeat until dd = 4{
	                    if (j mod (NB_NUM - nb_tiles) != 0 || dd != 3) then {
	                    	let l := 0;
	                    	repeat until l = i + 1 {
	                        	let s[count, j + NB_NUM*count_colour + l] := 1;
	                        	let l := l + 1;
	                        }; # Boucle l
	 						let l2 := 0;                    
	                        repeat until l2 = (nb_tiles - 1 - i) {
	                        	let s[count, j + NB_NUM*count_colour + dd + l2 + i] := 1;
	                        	let l2 := l2 + 1;
	                        }; # Boucle l2
	                        
	                        let s[count, 0] := 2;
	                        let count := count + 1;
	                   	}; # if
	                    let dd := dd + 1;
	                }; #Boucle dd
	                let i := i + 1;
	            }; #Boucle i
	            let j := j + 1;
	        }; #Boucle j
	        let count_colour := count_colour + 1;
	    }; #Boucle count_colour
	    let nb_tiles := nb_tiles + 1;
	}; #Boucle nb_tiles
	
	#Groupes de 5 cartes consecutives avec 2 jokers decalage de 1 a 1 cartes (1J1J1)
	let nb_tiles := 3;
	let count_colour := 0;
	repeat until count_colour = 4 {
		let j := 1;
		repeat until j = NB_NUM - nb_tiles {
	        let s[count, j + NB_NUM*count_colour] := 1;
	        let s[count, j + NB_NUM*count_colour + 2] := 1;
	        let s[count, j + NB_NUM*count_colour + 4] := 1;
	        let s[count, 0] := 2;
	        let count := count + 1;
	        let j := j + 1;
	    }; # Boucle j
	    let count_colour := count_colour + 1;
	}; # Boucle count_colour

}; #if NB_BAR >= 2

if NB_BAR >= 3 then {

	#Groupes de 3 cartes consecutives/memes couleurs avec 3 jokers (JJJ)
	let s[count, 0] := 3;
	let count := count + 1;
	
	#Groupes de 4 cartes consecutives/memes couleurs avec 3 jokers (1JJJ)
	#Groupes de 5 cartes consecutives avec 3 jokers sans decalage (11JJJ)
	let nb_tiles := 1;
	repeat until nb_tiles = 3 {
		let count_colour := 0;
		repeat until count_colour = 4 {
			let j := 1;
			repeat until j = (NB_NUM - nb_tiles + 2) {
				let i := 0;
				repeat until i = nb_tiles {
					let s[count, j + i + NB_NUM*count_colour] := 1;
					let i := i + 1;
				}; #Boucle i
				
				let s[count, 0] := 3;
			let count := count + 1;
			let j := j + 1;
			}; #Boucle j
		let count_colour := count_colour + 1;
		}; #Boucle count_colour 
	let nb_tiles := nb_tiles + 1;
	}; #Boucle nb_tiles
	
	#Groupes de 5 cartes consecutives avec 3 jokers decalge de 1, 2, 3 (1J1JJ 1JJ1J 1JJJ1)
	let nb_tiles := 2;
	let l := 1;
	repeat until l = 4 {
		let count_colour := 0;
		repeat until count_colour = 4 {
			let j := 1;
			repeat until j = (NB_NUM - nb_tiles + 2 - l) {
				let s[count, j + NB_NUM*count_colour] := 1;
				let s[count, j + NB_NUM*count_colour + 1 + l] := 1;
				
				let s[count, 0] := 3;
			let count := count + 1;
			let j := j + 1;
			}; #Boucle j
		let count_colour := count_colour + 1;
		}; #Boucle count_colour 
	let l := l + 1;
	}; #Boucle l

}; #if NB_BAR >= 3

if NB_BAR >= 4 then {
	
	#Groupes de 3 cartes consecutives/memes couleurs avec 4 jokers (JJJJ)
	let s[count, 0] := 4;
	let count := count + 1;
	
	#Groupes de 5 cartes consecutives/memes couleurs avec 4 jokers (1JJJJ)
	let nb_tiles := 1;
	let count_colour := 0;
	repeat until count_colour = 4 {
		let j := 1;
		repeat until j = (NB_NUM - nb_tiles + 2) {
			let i := 0;
			repeat until i = nb_tiles {
				let s[count, j + i + NB_NUM*count_colour] := 1;
				let i := i + 1;
			}; #Boucle i
				
			let s[count, 0] := 4;
		let count := count + 1;
		let j := j + 1;
		}; #Boucle j
	let count_colour := count_colour + 1;
	}; #Boucle count_colour 

}; #if NB_BAR >= 4

if NB_BAR >= 5 then {
	
	#Groupes de 5 cartes consecutives/memes couleurs avec 5 jokers (JJJJJ)
	let s[count, 0] := 5;
	let count := count + 1;

}; #if NB_BAR >= 5