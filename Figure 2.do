
clear
use "Figure2-Data.dta"

scatter Actual Expected,mlabel(pair) xlabel(-5(5)30) ylabel(-10(5)35) xtitle("Balance expected wins") ytitle("Balance actual wins")

* Needs manual adjustment