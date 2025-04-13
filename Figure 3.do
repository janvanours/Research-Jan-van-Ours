clear
set obs 17  // Create 7 nodes

// Assign X and Y coordinates for visualization
gen x = .
gen y = .

// Manually set positions for tree structure
replace x = 3 if _n == 1   // Root (Top)
replace y = 8 if _n == 1   

replace x = 2 if _n == 2   // Left child of root
replace y = 7 if _n == 2   

replace x = 4 if _n == 3   // Right child of root
replace y = 7 if _n == 3   

replace x = 1.5 if _n == 4   // Left child of node 2
replace y = 5 if _n == 4   

replace x = 4.5 if _n == 5   // Right child of node 2
replace y = 5 if _n == 5   

replace x = 2 if _n == 6   // Left child of node 4
replace y = 3 if _n == 6   

replace x = 4 if _n == 7   // Right child of node 4
replace y = 3 if _n == 7   

replace x = 4 if _n==8
replace y = 3 if _n==8

generate str c = "Feyenoord" in 1
replace c = "PSV" in 2
replace c = "Ajax" in 3
replace c = "Heerenveen" in 4
replace c = "Utrecht" in 5
replace c = "AZ" in 6
replace c = "Vitesse" in 7

*scatter y x, msymbol(O) mlabel(c) xlabel(1(1)5) ylabel(2(1)8)

// Define edges (start and end positions)
gen x1 = .
gen y1 = .
gen x2 = .
gen y2 = .

// Connect edges (parent → child) with dotted lines
* Feyenoord - PSV
replace x1 = 8 if _n == 1  
replace y1 = 3 if _n == 1
replace x2 = 7.05  if _n == 1
replace y2 = 2.05  if _n == 1
* Ajax - Feyenoord 
replace x1 = 7  if _n == 2  
replace y1 = 4  if _n == 2
replace x2 = 7.95  if _n == 2
replace y2 = 3.05  if _n == 2
* PSV - Ajax
replace x1 = 7  if _n == 3  
replace y1 = 2  if _n == 3
replace x2 = 7  if _n == 3
replace y2 = 3.95  if _n == 3
* Heerenveen - PSV
replace x1 = 5  if _n == 4  
replace y1 = 1.5  if _n == 4
replace x2 = 6.95  if _n == 4
replace y2 = 1.95  if _n == 4
* AZ - Heerenveen
replace x1 = 3  if _n == 5  
replace y1 = 2  if _n == 5
replace x2 = 4.95  if _n == 5
replace y2 = 1.55  if _n == 5
* PSV - AZ
replace x1 = 7  if _n == 6  
replace y1 = 2  if _n == 6
replace x2 = 3.05  if _n == 6
replace y2 = 2  if _n == 6
* PSV - Utrecht
replace x1 = 7  if _n == 7  
replace y1 = 2  if _n == 7
replace x2 = 5.05  if _n == 7
replace y2 = 4.45  if _n == 7
* Ajax - Heerenveen
replace x1 = 7  if _n == 8  
replace y1 = 4  if _n == 8
replace x2 = 5.05  if _n == 8
replace y2 = 1.55  if _n == 8
* Utrecht - Ajax
replace x1 = 5  if _n == 8  
replace y1 = 4.5  if _n == 8
replace x2 = 6.95  if _n == 8
replace y2 = 4.05  if _n == 8
* Utrecht - AZ
replace x1 = 5  if _n == 9  
replace y1 = 4.5  if _n == 9
replace x2 = 3.05  if _n == 9
replace y2 = 2.05  if _n == 9
* Ajax - Heerenveen 
replace x1 = 7 if _n == 10  
replace y1 = 4 if _n == 10
replace x2 = 5.05  if _n == 10
replace y2 = 1.55  if _n == 10
* AZ - Ajax 
replace x1 = 3 if _n == 11  
replace y1 = 2 if _n == 11
replace x2 = 6.95  if _n == 11
replace y2 = 3.95 if _n == 11
* Heerenveen - Feyenoord 
replace x1 = 5 if _n == 12  
replace y1 = 1.5 if _n == 12
replace x2 = 7.95  if _n == 12
replace y2 = 2.95 if _n == 12
* Feyenoord - AZ
replace x1 = 8  if _n == 13  
replace y1 = 3  if _n == 13
replace x2 = 3.1  if _n == 13
replace y2 = 2.05  if _n == 13
* Feyenoord - Utrecht
replace x1 = 8  if _n == 14  
replace y1 = 3  if _n == 14
replace x2 = 5.05  if _n == 14
replace y2 = 4.45  if _n == 14
* Utrecht - Heerenveen
replace x1 = 5  if _n == 15  
replace y1 = 4.5  if _n == 15
replace x2 = 5  if _n == 15
replace y2 = 1.55  if _n == 15
* Heerenveen - Vitesse
replace x1 = 5  if _n == 16  
replace y1 = 1.5  if _n == 16
replace x2 = 3.05  if _n == 16
replace y2 = 3.95  if _n == 16
* Vitesse - Utrecht
replace x1 = 3  if _n == 17  
replace y1 = 4  if _n == 17
replace x2 = 4.95  if _n == 17
replace y2 = 4.5  if _n == 17


* Figure 3 (needs manual adjustment)
graph twoway ///
    (scatter y x, msymbol(O) mcolor(black)  mlabel(c) mlabcolor(black) msize(medium) ) /// Nodes
    (pcarrow x1 y1 x2 y2, lpattern(solid) lcolor(black) msize(2) barbsize(1) mcolor(black)), legend(off) 	xlabel(0(1)6,nogrid) ylabel(2(1)9,nogrid) 	
	
