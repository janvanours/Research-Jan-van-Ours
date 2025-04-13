* Table 1

clear

use "Clean-ELO-top7.dta"

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
gen THD=(hometeam=="Groningen")
gen THE=(hometeam=="Heerenveen")
gen THF=(hometeam=="PSV")
gen THG=(hometeam=="Twente")
gen THH=(hometeam=="Utrecht")
gen THI=(hometeam=="Vitesse")
gen THJ=(hometeam=="Willem II")


gen TAA=(awayteam=="AZ")
gen TAB=(awayteam=="Ajax")
gen TAC=(awayteam=="Feyenoord")
gen TAD=(awayteam=="Groningen")
gen TAE=(awayteam=="Heerenveen")
gen TAF=(awayteam=="PSV")
gen TAG=(awayteam=="Twente")
gen TAH=(awayteam=="Utrecht")
gen TAI=(awayteam=="Vitesse")
gen TAJ=(awayteam=="Willem II")

*********** TABLE 1 

* Ajax
gen ppgAja=THB*((fthg>ftag)*3+(fthg==ftag))+TAB*((fthg<ftag)*3+(fthg==ftag))
gen epgAja=THB*(phome*3+pdraw)+TAB*(paway*3+pdraw)
gen surAja=ppgAja-epgAja
gen awinAja=THB*(fthg>ftag)+TAB*(fthg<ftag)
gen ewinAja=THB*(phome)+TAB*(paway)
gen swinAja=awinAja-ewinAja
sum ****Aja if THB==1 | TAB==1

* PSV
gen ppgPSV=THF*((fthg>ftag)*3+(fthg==ftag))+TAF*((fthg<ftag)*3+(fthg==ftag))
gen epgPSV=THF*(phome*3+pdraw)+TAF*(paway*3+pdraw)
gen surPSV=ppgPSV-epgPSV
gen awinPSV=THF*(fthg>ftag)+TAF*(fthg<ftag)
gen ewinPSV=THF*(phome)+TAF*(paway)
gen swinPSV=awinPSV-ewinPSV
sum ****PSV if THF==1 | TAF==1

* Feyenoord
gen ppgFey=THC*((fthg>ftag)*3+(fthg==ftag))+TAC*((fthg<ftag)*3+(fthg==ftag))
gen epgFey=THC*(phome*3+pdraw)+TAC*(paway*3+pdraw)
gen surFey=ppgFey-epgFey
gen awinFey=THC*(fthg>ftag)+TAC*(fthg<ftag)
gen ewinFey=THC*(phome)+TAC*(paway)
gen swinFey=awinFey-ewinFey
sum ****Fey if THC==1 | TAC==1

* AZ 
gen ppgAZ=THA*((fthg>ftag)*3+(fthg==ftag))+TAA*((fthg<ftag)*3+(fthg==ftag))
gen epgAZ=THA*(phome*3+pdraw)+TAA*(paway*3+pdraw)
gen surAZ=ppgAZ-epgAZ
gen awinAZ=THA*(fthg>ftag)+TAA*(fthg<ftag)
gen ewinAZ=THA*(phome)+TAA*(paway)
gen swinAZ=awinAZ-ewinAZ
sum ****AZ if THA==1 | TAA==1

* Utrecht
gen ppgUtr=THH*((fthg>ftag)*3+(fthg==ftag))+TAH*((fthg<ftag)*3+(fthg==ftag))
gen epgUtr=THH*(phome*3+pdraw)+TAH*(paway*3+pdraw)
gen surUtr=ppgUtr-epgUtr
gen awinUtr=THH*(fthg>ftag)+TAH*(fthg<ftag)
gen ewinUtr=THH*(phome)+TAH*(paway)
gen swinUtr=awinUtr-ewinUtr
sum ****Utr if THH==1 | TAH==1

* Heerenveen
gen ppgHeer=THE*((fthg>ftag)*3+(fthg==ftag))+TAE*((fthg<ftag)*3+(fthg==ftag))
gen epgHeer=THE*(phome*3+pdraw)+TAE*(paway*3+pdraw)
gen surHeer=ppgHeer-epgHeer
gen awinHeer=THE*(fthg>ftag)+TAE*(fthg<ftag)
gen ewinHeer=THE*(phome)+TAE*(paway)
gen swinHeer=awinHeer-ewinHeer
sum ****Heer if THE==1 | TAE==1


* Vitesse
gen ppgVit=THI*((fthg>ftag)*3+(fthg==ftag))+TAI*((fthg<ftag)*3+(fthg==ftag))
gen epgVit=THI*(phome*3+pdraw)+TAI*(paway*3+pdraw)
gen surVit=ppgVit-epgVit
gen awinVit=THI*(fthg>ftag)+TAI*(fthg<ftag)
gen ewinVit=THI*(phome)+TAI*(paway)
gen swinVit=awinVit-ewinVit
sum ****Vit if THI==1 | TAI==1

* Overview Table 1 (except column on ELO-rating)

tabstat ****Aja if THB==1 | TAB==1
tabstat ****AZ if THA==1 | TAA==1
tabstat ****Fey if THC==1 | TAC==1
tabstat ****Heer if THE==1 | TAE==1
tabstat ****PSV if THF==1 | TAF==1
tabstat ****Utr if THH==1 | TAH==1
tabstat ****Vit if THI==1 | TAI==1




*************************************************************************************************************