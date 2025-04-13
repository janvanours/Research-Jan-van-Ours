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

sort Seizoen hometeam awayteam

* Expected wins - Table 2 panel a
*gen Ehomepoints=(phome)
*gen Eawaypoints=(paway)

* Actual Wins - Table 2 panel b
*gen Ehomepoints=(Homewin)
*gen Eawaypoints=(Awaywin)

* Surprise Wins - Table 2 panel c
gen Ehomepoints=(SurpHwin)
gen Eawaypoints=(SurpAwin)


gen ABwin=(THA==1)*(TAB==1)*(Ehomepoints)+(TAA==1)*(THB==1)*(Eawaypoints)
gen ACwin=(THA==1)*(TAC==1)*(Ehomepoints)+(TAA==1)*(THC==1)*(Eawaypoints)
gen ADwin=(THA==1)*(TAD==1)*(Ehomepoints)+(TAA==1)*(THD==1)*(Eawaypoints)
gen AEwin=(THA==1)*(TAE==1)*(Ehomepoints)+(TAA==1)*(THE==1)*(Eawaypoints)
gen AFwin=(THA==1)*(TAF==1)*(Ehomepoints)+(TAA==1)*(THF==1)*(Eawaypoints)
gen AGwin=(THA==1)*(TAG==1)*(Ehomepoints)+(TAA==1)*(THG==1)*(Eawaypoints)

gen BAwin=(THB==1)*(TAA==1)*(Ehomepoints)+(TAB==1)*(THA==1)*(Eawaypoints)
gen BCwin=(THB==1)*(TAC==1)*(Ehomepoints)+(TAB==1)*(THC==1)*(Eawaypoints)
gen BDwin=(THB==1)*(TAD==1)*(Ehomepoints)+(TAB==1)*(THD==1)*(Eawaypoints)
gen BEwin=(THB==1)*(TAE==1)*(Ehomepoints)+(TAB==1)*(THE==1)*(Eawaypoints)
gen BFwin=(THB==1)*(TAF==1)*(Ehomepoints)+(TAB==1)*(THF==1)*(Eawaypoints)
gen BGwin=(THB==1)*(TAG==1)*(Ehomepoints)+(TAB==1)*(THG==1)*(Eawaypoints)

gen CAwin=(THC==1)*(TAA==1)*(Ehomepoints)+(TAC==1)*(THA==1)*(Eawaypoints)
gen CBwin=(THC==1)*(TAB==1)*(Ehomepoints)+(TAC==1)*(THB==1)*(Eawaypoints)
gen CDwin=(THC==1)*(TAD==1)*(Ehomepoints)+(TAC==1)*(THD==1)*(Eawaypoints)
gen CEwin=(THC==1)*(TAE==1)*(Ehomepoints)+(TAC==1)*(THE==1)*(Eawaypoints)
gen CFwin=(THC==1)*(TAF==1)*(Ehomepoints)+(TAC==1)*(THF==1)*(Eawaypoints)
gen CGwin=(THC==1)*(TAG==1)*(Ehomepoints)+(TAC==1)*(THG==1)*(Eawaypoints)

gen DAwin=(THD==1)*(TAA==1)*(Ehomepoints)+(TAD==1)*(THA==1)*(Eawaypoints)
gen DBwin=(THD==1)*(TAB==1)*(Ehomepoints)+(TAD==1)*(THB==1)*(Eawaypoints)
gen DCwin=(THD==1)*(TAC==1)*(Ehomepoints)+(TAD==1)*(THC==1)*(Eawaypoints)
gen DEwin=(THD==1)*(TAE==1)*(Ehomepoints)+(TAD==1)*(THE==1)*(Eawaypoints)
gen DFwin=(THD==1)*(TAF==1)*(Ehomepoints)+(TAD==1)*(THF==1)*(Eawaypoints)
gen DGwin=(THD==1)*(TAG==1)*(Ehomepoints)+(TAD==1)*(THG==1)*(Eawaypoints)

gen EAwin=(THE==1)*(TAA==1)*(Ehomepoints)+(TAE==1)*(THA==1)*(Eawaypoints)
gen EBwin=(THE==1)*(TAB==1)*(Ehomepoints)+(TAE==1)*(THB==1)*(Eawaypoints)
gen ECwin=(THE==1)*(TAC==1)*(Ehomepoints)+(TAE==1)*(THC==1)*(Eawaypoints)
gen EDwin=(THE==1)*(TAD==1)*(Ehomepoints)+(TAE==1)*(THD==1)*(Eawaypoints)
gen EFwin=(THE==1)*(TAF==1)*(Ehomepoints)+(TAE==1)*(THF==1)*(Eawaypoints)
gen EGwin=(THE==1)*(TAG==1)*(Ehomepoints)+(TAE==1)*(THG==1)*(Eawaypoints)

gen FAwin=(THF==1)*(TAA==1)*(Ehomepoints)+(TAF==1)*(THA==1)*(Eawaypoints)
gen FBwin=(THF==1)*(TAB==1)*(Ehomepoints)+(TAF==1)*(THB==1)*(Eawaypoints)
gen FCwin=(THF==1)*(TAC==1)*(Ehomepoints)+(TAF==1)*(THC==1)*(Eawaypoints)
gen FDwin=(THF==1)*(TAD==1)*(Ehomepoints)+(TAF==1)*(THD==1)*(Eawaypoints)
gen FEwin=(THF==1)*(TAE==1)*(Ehomepoints)+(TAF==1)*(THE==1)*(Eawaypoints)
gen FGwin=(THF==1)*(TAG==1)*(Ehomepoints)+(TAF==1)*(THG==1)*(Eawaypoints)

gen GAwin=(THG==1)*(TAA==1)*(Ehomepoints)+(TAG==1)*(THA==1)*(Eawaypoints)
gen GBwin=(THG==1)*(TAB==1)*(Ehomepoints)+(TAG==1)*(THB==1)*(Eawaypoints)
gen GCwin=(THG==1)*(TAC==1)*(Ehomepoints)+(TAG==1)*(THC==1)*(Eawaypoints)
gen GDwin=(THG==1)*(TAD==1)*(Ehomepoints)+(TAG==1)*(THD==1)*(Eawaypoints)
gen GEwin=(THG==1)*(TAE==1)*(Ehomepoints)+(TAG==1)*(THE==1)*(Eawaypoints)
gen GFwin=(THG==1)*(TAF==1)*(Ehomepoints)+(TAG==1)*(THF==1)*(Eawaypoints)

***************
bysort Seizoen: egen ProfABwin=total(ABwin)
bysort Seizoen: egen ProfACwin=total(ACwin)
bysort Seizoen: egen ProfADwin=total(ADwin)
bysort Seizoen: egen ProfAEwin=total(AEwin)
bysort Seizoen: egen ProfAFwin=total(AFwin)
bysort Seizoen: egen ProfAGwin=total(AGwin)

bysort Seizoen: egen ProfBAwin=total(BAwin)
bysort Seizoen: egen ProfBCwin=total(BCwin)
bysort Seizoen: egen ProfBDwin=total(BDwin)
bysort Seizoen: egen ProfBEwin=total(BEwin)
bysort Seizoen: egen ProfBFwin=total(BFwin)
bysort Seizoen: egen ProfBGwin=total(BGwin)

bysort Seizoen: egen ProfCAwin=total(CAwin)
bysort Seizoen: egen ProfCBwin=total(CBwin)
bysort Seizoen: egen ProfCDwin=total(CDwin)
bysort Seizoen: egen ProfCEwin=total(CEwin)
bysort Seizoen: egen ProfCFwin=total(CFwin)
bysort Seizoen: egen ProfCGwin=total(CGwin)

bysort Seizoen: egen ProfDAwin=total(DAwin)
bysort Seizoen: egen ProfDBwin=total(DBwin)
bysort Seizoen: egen ProfDCwin=total(DCwin)
bysort Seizoen: egen ProfDEwin=total(DEwin)
bysort Seizoen: egen ProfDFwin=total(DFwin)
bysort Seizoen: egen ProfDGwin=total(DGwin)

bysort Seizoen: egen ProfEAwin=total(EAwin)
bysort Seizoen: egen ProfEBwin=total(EBwin)
bysort Seizoen: egen ProfECwin=total(ECwin)
bysort Seizoen: egen ProfEDwin=total(EDwin)
bysort Seizoen: egen ProfEFwin=total(EFwin)
bysort Seizoen: egen ProfEGwin=total(EGwin)

bysort Seizoen: egen ProfFAwin=total(FAwin)
bysort Seizoen: egen ProfFBwin=total(FBwin)
bysort Seizoen: egen ProfFCwin=total(FCwin)
bysort Seizoen: egen ProfFDwin=total(FDwin)
bysort Seizoen: egen ProfFEwin=total(FEwin)
bysort Seizoen: egen ProfFGwin=total(FGwin)

bysort Seizoen: egen ProfGAwin=total(GAwin)
bysort Seizoen: egen ProfGBwin=total(GBwin)
bysort Seizoen: egen ProfGCwin=total(GCwin)
bysort Seizoen: egen ProfGDwin=total(GDwin)
bysort Seizoen: egen ProfGEwin=total(GEwin)
bysort Seizoen: egen ProfGFwin=total(GFwin)


collapse ProfABwin ProfACwin ProfADwin ProfAEwin ProfAFwin ProfAGwin ProfBAwin ProfBCwin ProfBDwin ProfBEwin ProfBFwin ProfBGwin ProfCAwin ProfCBwin ProfCDwin ProfCEwin ProfCFwin ProfCGwin ProfDAwin ProfDBwin ProfDCwin ProfDEwin ProfDFwin ProfDGwin ProfEAwin ProfEBwin ProfECwin ProfEDwin ProfEFwin ProfEGwin ProfFAwin ProfFBwin ProfFCwin ProfFDwin ProfFEwin ProfFGwin ProfGAwin ProfGBwin ProfGCwin ProfGDwin ProfGEwin ProfGFwin ,by(Seizoen)


********************************************
gen ABwin=(ProfABwin)-(ProfBAwin)
gen ACwin=(ProfACwin)-(ProfCAwin)
gen ADwin=(ProfADwin)-(ProfDAwin)
gen AEwin=(ProfAEwin)-(ProfEAwin)
gen AFwin=(ProfAFwin)-(ProfFAwin)
gen AGwin=(ProfAGwin)-(ProfGAwin)

gen BAwin=(ProfBAwin)-(ProfABwin)
gen BCwin=(ProfBCwin)-(ProfCBwin)
gen BDwin=(ProfBDwin)-(ProfDBwin)
gen BEwin=(ProfBEwin)-(ProfEBwin)
gen BFwin=(ProfBFwin)-(ProfFBwin)
gen BGwin=(ProfBGwin)-(ProfGBwin)

gen CAwin=(ProfCAwin)-(ProfACwin)
gen CBwin=(ProfCBwin)-(ProfBCwin)
gen CDwin=(ProfCDwin)-(ProfDCwin)
gen CEwin=(ProfCEwin)-(ProfECwin)
gen CFwin=(ProfCFwin)-(ProfFCwin)
gen CGwin=(ProfCGwin)-(ProfGCwin)

gen DAwin=(ProfDAwin)-(ProfADwin)
gen DBwin=(ProfDBwin)-(ProfBDwin)
gen DCwin=(ProfDCwin)-(ProfCDwin)
gen DEwin=(ProfDEwin)-(ProfEDwin)
gen DFwin=(ProfDFwin)-(ProfFDwin)
gen DGwin=(ProfDGwin)-(ProfGDwin)

gen EAwin=(ProfEAwin)-(ProfAEwin)
gen EBwin=(ProfEBwin)-(ProfBEwin)
gen ECwin=(ProfECwin)-(ProfCEwin)
gen EDwin=(ProfEDwin)-(ProfDEwin)
gen EFwin=(ProfEFwin)-(ProfFEwin)
gen EGwin=(ProfEGwin)-(ProfGEwin)

gen FAwin=(ProfFAwin)-(ProfAFwin)
gen FBwin=(ProfFBwin)-(ProfBFwin)
gen FCwin=(ProfFCwin)-(ProfCFwin)
gen FDwin=(ProfFDwin)-(ProfDFwin)
gen FEwin=(ProfFEwin)-(ProfEFwin)
gen FGwin=(ProfFGwin)-(ProfGFwin)

gen GAwin=(ProfGAwin)-(ProfAGwin)
gen GBwin=(ProfGBwin)-(ProfBGwin)
gen GCwin=(ProfGCwin)-(ProfCGwin)
gen GDwin=(ProfGDwin)-(ProfDGwin)
gen GEwin=(ProfGEwin)-(ProfEGwin)
gen GFwin=(ProfGFwin)-(ProfFGwin)

* generates Table 2 panel a OR panel b OR panel c (depending on variables used) 
tabstat A* B* C* D* E* F* G*, statistics(sum) col(stat)

* Table 3 - if surprise wins are used
* PSV-Ajax
ttest EBwin==0
* PSV-AZ
ttest EAwin==0
* PSV-Utrecht  
ttest EFwin==0
* PSV-Vitesse
ttest EGwin==0
* Feyenoord-Utrecht 
ttest CFwin==0
* Utrecht-Ajax 
ttest FBwin==0
* Utrecht-Heerenveen 
ttest FDwin==0


*****************  
* This were the bogey teams represented in Table 3 (if surprise wins are used as variable)
* Now come the circular triads 

gen Q_ABC=ABwin+BCwin+CAwin
gen Q_ABD=ABwin+BDwin+DAwin
gen Q_ABE=ABwin+BEwin+EAwin
gen Q_ABF=ABwin+BFwin+FAwin
gen Q_ABG=ABwin+BGwin+GAwin

gen Q_ACB=ACwin+CBwin+BAwin
gen Q_ACD=ACwin+CDwin+DAwin
gen Q_ACE=ACwin+CEwin+EAwin
gen Q_ACF=ACwin+CFwin+FAwin
gen Q_ACG=ACwin+CGwin+GAwin

gen Q_ADB=ADwin+DBwin+BAwin
gen Q_ADC=ADwin+DCwin+CAwin
gen Q_ADE=ADwin+DEwin+EAwin
gen Q_ADF=ADwin+DFwin+FAwin
gen Q_ADG=ADwin+DGwin+GAwin

gen Q_AEB=AEwin+EBwin+BAwin
gen Q_AEC=AEwin+ECwin+CAwin
gen Q_AED=AEwin+EDwin+DAwin
gen Q_AEF=AEwin+EFwin+FAwin
gen Q_AEG=AEwin+EGwin+GAwin

gen Q_AFB=AFwin+FBwin+BAwin
gen Q_AFC=AFwin+FCwin+CAwin
gen Q_AFD=AFwin+FDwin+DAwin
gen Q_AFE=AFwin+FEwin+EAwin
gen Q_AFG=AFwin+FGwin+GAwin

gen Q_AGB=AGwin+GBwin+BAwin
gen Q_AGC=AGwin+GCwin+CAwin
gen Q_AGD=AGwin+GDwin+DAwin
gen Q_AGE=AGwin+GEwin+EAwin
gen Q_AGF=AGwin+GFwin+FAwin

gen Q_BCD=BCwin+CDwin+DBwin
gen Q_BCE=BCwin+CEwin+EBwin
gen Q_BCF=BCwin+CFwin+FBwin
gen Q_BCG=BCwin+CGwin+GBwin

gen Q_BDC=BDwin+DCwin+CBwin
gen Q_BDE=BDwin+DEwin+EBwin
gen Q_BDF=BDwin+DFwin+FBwin
gen Q_BDG=BDwin+DGwin+GBwin

gen Q_BEC=BEwin+ECwin+CBwin
gen Q_BED=BEwin+EDwin+DBwin
gen Q_BEF=BEwin+EFwin+FBwin
gen Q_BEG=BEwin+EGwin+GBwin

gen Q_BFC=BFwin+FCwin+CBwin
gen Q_BFD=BFwin+FDwin+DBwin
gen Q_BFE=BFwin+FEwin+EBwin
gen Q_BFG=BFwin+FGwin+GBwin

gen Q_BGC=BGwin+GCwin+CBwin
gen Q_BGD=BGwin+GDwin+DBwin
gen Q_BGE=BGwin+GEwin+EBwin
gen Q_BGF=BGwin+GFwin+FBwin


gen Q_CDE=CDwin+DEwin+ECwin
gen Q_CDF=CDwin+DFwin+FCwin
gen Q_CDG=CDwin+DGwin+GCwin

gen Q_CED=CEwin+EDwin+DCwin
gen Q_CEF=CEwin+EFwin+FCwin
gen Q_CEG=CEwin+EGwin+GCwin

gen Q_CFD=CFwin+FDwin+DCwin
gen Q_CFE=CFwin+FEwin+ECwin
gen Q_CFG=CFwin+FGwin+GCwin

gen Q_CGD=CGwin+GDwin+DCwin
gen Q_CGE=CGwin+GEwin+ECwin
gen Q_CGF=CGwin+GFwin+FCwin

gen Q_DEF=DEwin+EFwin+FDwin
gen Q_DEG=DEwin+EGwin+GDwin

gen Q_DFE=DFwin+FEwin+EDwin
gen Q_DFG=DFwin+FGwin+GDwin

gen Q_DGE=DGwin+GEwin+EDwin
gen Q_DGF=DGwin+GFwin+FDwin

gen Q_EFG=EFwin+FGwin+GEwin

gen Q_EGF=EGwin+GFwin+FEwin

tabstat Q*, statistics(sum mean sd min max n) col(stat)

* ttest 
* This generates Table 4 provided surprise wins are used
* Ajax-Feyenoord-Utrecht
ttest BCwin==0
ttest CFwin==0
ttest FBwin==0
ttest Q_BCF==0
* Heerenveen-PSV-Utrecht 
ttest DEwin==0
ttest EFwin==0
ttest FDwin==0
ttest Q_DEF==0
* Feyenoord-Utrecht-Heerenveen 
ttest CFwin==0
ttest FDwin==0
ttest DCwin==0
ttest Q_CFD==0
* Heerenveen-Vitesse-Utrecht
ttest DGwin==0
ttest GFwin==0
ttest FDwin==0
ttest Q_DGF==0
* Ajax-Feyenoord-PSV
ttest BCwin==0
ttest CEwin==0
ttest EBwin==0
ttest Q_BCE==0
* AZ-Ajax-Feyenoord
ttest ABwin==0
ttest BCwin==0
ttest CAwin==0
ttest Q_ABC==0
* AZ-Heerenveen-PSV
ttest ADwin==0
ttest DEwin==0
ttest EAwin==0
ttest Q_ADE==0
* Ajax-Heerenveen-PSV
ttest BDwin==0
ttest DEwin==0
ttest EBwin==0
ttest Q_BDE==0


* better cumulatief

gen T_BCF=sum(Q_BCF)
gen T_DEF=sum(Q_DEF)
gen T_CFD=sum(Q_CFD)
gen T_DGF=sum(Q_DGF)

gen T_BCE=sum(Q_BCE)
gen T_ABC=sum(Q_ABC)
gen T_ADE=sum(Q_ADE)
gen T_BDE=sum(Q_BDE)

* Generates Figure 4 upper graph
twoway line T_BCF Seizoen,lcolor(red)lpattern(solid)  || line T_DEF Seizoen, lcolor(black) lpattern(solid)  || line T_CFD Seizoen, lcolor(blue) lpattern(dash) || line T_DGF Seizoen, lcolor(red) lpattern(dash)  xlabel(2001(2)2024) ylabel(-5(5)30) graphregion(color(white)) xtitle("Season") ytitle("Cumulative Surprise Wins") legend(label(1 "Feyenoord-Utrecht-Ajax") label(2 "Heerenveen-PSV-Utrecht") label(3 "Feyenoord-Utrecht-Heerenveen") label(4 "Heerenveen-Vitesse-Utrecht") ring(0) bplacement(nwest) col(1)) yline(0, lcolor(black) lpattern(solid)) 

* Generates Figure 4 lower graph
twoway line T_BCE Seizoen,lcolor(red)lpattern(solid)  || line T_ABC Seizoen, lcolor(black) lpattern(solid)  || line T_ADE Seizoen, lcolor(blue) lpattern(dash) || line T_BDE Seizoen, lcolor(red) lpattern(dash)  xlabel(2001(2)2024) ylabel(-5(5)30) graphregion(color(white)) xtitle("Season") ytitle("Cumulative Surprise Wins") legend(label(1 "Feyenoord-PSV-Ajax") label(2 "Feyenoord-AZ-Ajax") label(3 "AZ-Heerenveen-PSV") label(4 "Ajax-Heerenveen-PSV") ring(0) bplacement(nwest) col(1)) yline(0, lcolor(black) lpattern(solid)) 
graph export "NL-CumSurp2.png",replace





