* NL December
* Ordered Logits with ELO

clear

use "C:\Users\janva\Dropbox\2024\0. NL\Clean-ELO-top7.dta"

gen hometeam=Home
gen awayteam=Away

gen phome=(1/whhx)/((1/whhx)+(1/whdx)+(1/whax))
gen pdraw=(1/whdx)/((1/whhx)+(1/whdx)+(1/whax))
gen paway=(1/whax)/((1/whhx)+(1/whdx)+(1/whax))
gen check=phome+pdraw+paway
sum check


gen THA=(hometeam=="AZ")
gen THB=(hometeam=="Ajax")
gen THC=(hometeam=="Feyenoord")
gen THD=(hometeam=="Heerenveen")
gen THE=(hometeam=="PSV")
gen THF=(hometeam=="Utrecht")
gen THG=(hometeam=="Vitesse")

gen TAA=(awayteam=="AZ")
gen TAB=(awayteam=="Ajax")
gen TAC=(awayteam=="Feyenoord")
gen TAD=(awayteam=="Heerenveen")
gen TAE=(awayteam=="PSV")
gen TAF=(awayteam=="Utrecht")
gen TAG=(awayteam=="Vitesse")

gen Homewin=(fthg>ftag)
gen Awaywin=(ftag>fthg)
gen SurpHwin=Homewin-phome
gen SurpAwin=Awaywin-paway

tab home away

* Table D1

preserve
*1 Feyenoord-Utrecht-Ajax (BCF)
gen HTeam1=THB
gen HTeam2=THC
gen HTeam3=THF
gen ATeam1=TAB
gen ATeam2=TAC
gen ATeam3=TAF
keep if HTeam1==1 | HTeam2==1 | HTeam3==1
keep if ATeam1==1 | ATeam2==1 | ATeam3==1
gen Q1=HTeam1-ATeam1
gen Q2=HTeam2-ATeam2
gen T1and3=HTeam1*ATeam3-HTeam3*ATeam1
gen homepoints=(fthg>ftag)*3+(fthg==ftag)
gen DELO=(ELO_home-ELO_away)/100
ologit homepoints Q1 Q2 DELO T1and3,robust
gen Ehomepoints=phome*3+pdraw
regress Ehomepoints Q1 Q2 DELO T1and3,robust
restore


preserve
*2 Heerenveen-PSV-Utrecht (DEF) 
gen HTeam1=THE
gen HTeam2=THF
gen HTeam3=THD
gen ATeam1=TAE
gen ATeam2=TAF
gen ATeam3=TAD
keep if HTeam1==1 | HTeam2==1 | HTeam3==1
keep if ATeam1==1 | ATeam2==1 | ATeam3==1
gen Home1=HTeam1
gen Home2=HTeam2
gen Home3=HTeam3
gen Q1=HTeam1-ATeam1
gen Q2=HTeam2-ATeam2
gen Q3=HTeam3-ATeam3
gen T1and2=HTeam1*ATeam2-HTeam2*ATeam1
gen T1and3=HTeam1*ATeam3-HTeam3*ATeam1
gen T2and3=HTeam2*ATeam3-HTeam3*ATeam2
gen homepoints=(fthg>ftag)*3+(fthg==ftag)
gen DELO=(ELO_home-ELO_away)/100
ologit homepoints Q1 Q2 DELO T1and3,robust
gen Ehomepoints=phome*3+pdraw
regress Ehomepoints Q1 Q2 DELO T1and3,robust
restore

preserve
*3 Feyenoord-Utrecht-Heerenveen (CFD) 
gen HTeam1=THC
gen HTeam2=THF
gen HTeam3=THD
gen ATeam1=TAC
gen ATeam2=TAF
gen ATeam3=TAD
keep if HTeam1==1 | HTeam2==1 | HTeam3==1
keep if ATeam1==1 | ATeam2==1 | ATeam3==1
gen Home1=HTeam1
gen Home2=HTeam2
gen Home3=HTeam3
gen Q1=HTeam1-ATeam1
gen Q2=HTeam2-ATeam2
gen Q3=HTeam3-ATeam3
gen T1and2=HTeam1*ATeam2-HTeam2*ATeam1
gen T1and3=HTeam1*ATeam3-HTeam3*ATeam1
gen T2and3=HTeam2*ATeam3-HTeam3*ATeam2
gen homepoints=(fthg>ftag)*3+(fthg==ftag)
gen DELO=(ELO_home-ELO_away)/100
ologit homepoints Q1 Q2 DELO T1and3,robust
gen Ehomepoints=phome*3+pdraw
regress Ehomepoints Q1 Q2 DELO T1and3,robust
restore

*********************************************
preserve
*4 Heerenveen-Vitesse-Utrecht (DGF) 
gen HTeam1=THD
gen HTeam2=THG
gen HTeam3=THF
gen ATeam1=TAD
gen ATeam2=TAG
gen ATeam3=TAF
keep if HTeam1==1 | HTeam2==1 | HTeam3==1
keep if ATeam1==1 | ATeam2==1 | ATeam3==1
tab hometeam
gen Home1=HTeam1
gen Home2=HTeam2
gen Home3=HTeam3
gen Q1=HTeam1-ATeam1
gen Q2=HTeam2-ATeam2
gen Q3=HTeam3-ATeam3
gen T1and2=HTeam1*ATeam2-HTeam2*ATeam1
gen T1and3=HTeam1*ATeam3-HTeam3*ATeam1
gen T2and3=HTeam2*ATeam3-HTeam3*ATeam2
gen homepoints=(fthg>ftag)*3+(fthg==ftag)
gen DELO=(ELO_home-ELO_away)/100
ologit homepoints Q1 Q2 DELO T1and3,robust
gen Ehomepoints=phome*3+pdraw
regress Ehomepoints Q1 Q2 DELO T1and3,robust
restore


preserve
*5 Feyenoord-Ajax-PSV (BCE) 
gen HTeam1=THE
gen HTeam2=THB
gen HTeam3=THC
gen ATeam1=TAE
gen ATeam2=TAB
gen ATeam3=TAC
keep if HTeam1==1 | HTeam2==1 | HTeam3==1
keep if ATeam1==1 | ATeam2==1 | ATeam3==1
tab home away
gen Home1=HTeam1
gen Home2=HTeam2
gen Home3=HTeam3
gen Q1=HTeam1-ATeam1
gen Q2=HTeam2-ATeam2
gen Q3=HTeam3-ATeam3
gen T1and2=HTeam1*ATeam2-HTeam2*ATeam1
gen T1and3=HTeam1*ATeam3-HTeam3*ATeam1
gen T2and3=HTeam2*ATeam3-HTeam3*ATeam2
tab home T1and3
gen homepoints=(fthg>ftag)*3+(fthg==ftag)
gen DELO=(ELO_home-ELO_away)/100
ologit homepoints Q1 Q2 DELO T1and3,robust
gen Ehomepoints=phome*3+pdraw
regress Ehomepoints Q1 Q2 DELO T1and3,robust
restore

preserve
*6 AZ-Ajax-Feyenoord (ABC) 
gen HTeam1=THB
gen HTeam2=THC
gen HTeam3=THA
gen ATeam1=TAB
gen ATeam2=TAC
gen ATeam3=TAA
keep if HTeam1==1 | HTeam2==1 | HTeam3==1
keep if ATeam1==1 | ATeam2==1 | ATeam3==1
gen Home1=HTeam1
gen Home2=HTeam2
gen Home3=HTeam3
gen Q1=HTeam1-ATeam1
gen Q2=HTeam2-ATeam2
gen Q3=HTeam3-ATeam3
gen T1and2=HTeam1*ATeam2-HTeam2*ATeam1
gen T1and3=HTeam1*ATeam3-HTeam3*ATeam1
gen T2and3=HTeam2*ATeam3-HTeam3*ATeam2
gen homepoints=(fthg>ftag)*3+(fthg==ftag)
gen DELO=(ELO_home-ELO_away)/100
ologit homepoints Q1 Q2 DELO T1and3,robust
gen Ehomepoints=phome*3+pdraw
regress Ehomepoints Q1 Q2 DELO T1and3,robust
restore

preserve
*7 AZ-Heerenveen-PSV (EAD) 
gen HTeam1=THE
gen HTeam2=THA
gen HTeam3=THD
gen ATeam1=TAE
gen ATeam2=TAA
gen ATeam3=TAD
keep if HTeam1==1 | HTeam2==1 | HTeam3==1
keep if ATeam1==1 | ATeam2==1 | ATeam3==1
tab home away
gen Home1=HTeam1
gen Home2=HTeam2
gen Home3=HTeam3
gen Q1=HTeam1-ATeam1
gen Q2=HTeam2-ATeam2
gen Q3=HTeam3-ATeam3
gen T1and2=HTeam1*ATeam2-HTeam2*ATeam1
gen T1and3=HTeam1*ATeam3-HTeam3*ATeam1
gen T2and3=HTeam2*ATeam3-HTeam3*ATeam2
gen homepoints=(fthg>ftag)*3+(fthg==ftag)
gen DELO=(ELO_home-ELO_away)/100
ologit homepoints Q1 Q2 DELO T1and3,robust
gen Ehomepoints=phome*3+pdraw
regress Ehomepoints Q1 Q2 DELO T1and3,robust
restore

preserve
*8 Ajax-Heerenveen-PSV (BDE) 
gen HTeam1=THE
gen HTeam2=THB
gen HTeam3=THD
gen ATeam1=TAE
gen ATeam2=TAB
gen ATeam3=TAD
keep if HTeam1==1 | HTeam2==1 | HTeam3==1
keep if ATeam1==1 | ATeam2==1 | ATeam3==1
gen Home1=HTeam1
gen Home2=HTeam2
gen Home3=HTeam3
gen Q1=HTeam1-ATeam1
gen Q2=HTeam2-ATeam2
gen Q3=HTeam3-ATeam3
gen T1and2=HTeam1*ATeam2-HTeam2*ATeam1
gen T1and3=HTeam1*ATeam3-HTeam3*ATeam1
gen T2and3=HTeam2*ATeam3-HTeam3*ATeam2
gen homepoints=(fthg>ftag)*3+(fthg==ftag)
gen DELO=(ELO_home-ELO_away)/100
ologit homepoints Q1 Q2 DELO T1and3,robust
gen Ehomepoints=phome*3+pdraw
regress Ehomepoints Q1 Q2 DELO T1and3,robust
restore
