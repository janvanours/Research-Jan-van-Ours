* ELO-ratings 2001-2024 Eredivisie

clear
use "ELO-ratings.dta"

twoway line Feyenoord season,lcolor(black)lpattern(solid)  || line Ajax season, lcolor(red) lpattern(dash)  || line PSV season, lcolor(blue) lpattern(longdash)  ylabel(1450(50)2200) xlabel(2001(2)2024) graphregion(color(white)) xtitle("Season") ytitle("Elo-rating") legend(label (1 "Feyenoord") label(2 "Ajax") label(3 "PSV") ring(0) bplacement(south) col(4)) yline(0, lcolor(blue) lpattern(solid)) 

twoway line AZ season,lcolor(black)lpattern(solid)  || line Heerenveen season, lcolor(red) lpattern(dash)  || line Utrecht season, lcolor(blue) lpattern(longdash) || line Vitesse season, lcolor(black) lpattern(dash_dot)  ylabel(1450(50)2200) xlabel(2001(2)2024) graphregion(color(white)) xtitle("Season") ytitle("Elo-rating") legend(label (1 "AZ") label(2 "Heerenveen") label(3 "Utrecht") label(4 "Vitesse") ring(0) bplacement(south) col(4)) yline(0, lcolor(blue) lpattern(solid)) 

* For column 1 of Table 1
sum
