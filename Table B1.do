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

gen homepoints=(fthg>ftag)*3+(fthg==ftag)
gen DELO=(ELO_home-ELO_away)/100
gen Ehomepoints=phome*3+pdraw
gen Shomepoints=homepoints-Ehomepoints
gen AZ=TAA-THA
gen AJ=TAB-THB
gen FE=TAC-THC
gen HE=TAD-THD
gen PS=TAE-THE
gen UT=TAF-THF
gen VI=TAG-THG

* Table B1 - panel a
ologit homepoints Ehomepoints if hometeam=="AZ" | awayteam=="AZ",robust
ologit homepoints Ehomepoints if hometeam=="Ajax" | awayteam=="Ajax",robust
ologit homepoints Ehomepoints if hometeam=="Feyenoord" | awayteam=="Feyenoord",robust
ologit homepoints Ehomepoints if hometeam=="Heerenveen" | awayteam=="Heerenveen",robust
ologit homepoints Ehomepoints if hometeam=="PSV" | awayteam=="PSV",robust
ologit homepoints Ehomepoints if hometeam=="Utrecht" | awayteam=="Utrecht",robust
ologit homepoints Ehomepoints if hometeam=="Vitesse" | awayteam=="Vitesse",robust

* Table B1 - panel b

ologit homepoints Ehomepoints AJ FE HE PS UT VI if hometeam=="AZ" | awayteam=="AZ",robust
ologit homepoints Ehomepoints AZ FE HE PS UT VI if hometeam=="Ajax" | awayteam=="Ajax",robust
ologit homepoints Ehomepoints AZ AJ HE PS UT VI if hometeam=="Feyenoord" | awayteam=="Feyenoord",robust
ologit homepoints Ehomepoints AZ AJ FE PS UT VI if hometeam=="Heerenveen" | awayteam=="Heerenveen",robust
ologit homepoints Ehomepoints AZ AJ FE HE UT VI if hometeam=="PSV" | awayteam=="PSV",robust
ologit homepoints Ehomepoints AZ AJ FE HE PS VI if hometeam=="Utrecht" | awayteam=="Utrecht",robust
ologit homepoints Ehomepoints AZ AJ FE HE PS UT if hometeam=="Vitesse" | awayteam=="Vitesse",robust

