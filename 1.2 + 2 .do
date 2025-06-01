* 1.2
use "GrowthClimateDataset.dta", clear
*a) 
gen temp = UDel_temp_popweight
gen precip = UDel_precip_popweight / 1000
gen temp2 = temp^2
gen precip2 = precip^2

reg growthWDI i.year temp temp2 precip precip2,r

* b)
reg growthWDI i.year i.isocode temp temp2 precip precip2,r

*c)
reg growthWDI i.year temp temp2 precip precip2,r
predict yhat_timefe

reg growthWDI i.isocode temp temp2 precip precip2,r
predict yhat_groupfe

reg growthWDI i.year i.isocode temp temp2 precip precip2,r
predict yhat_bothfe

twoway ///
  (line yhat_timefe year) ///
  (line yhat_groupfe year) ///
  (line yhat_bothfe year)

twoway ///
	(line yhat_timefe year), ///
	name(g1, replace)
twoway ///
	(line yhat_groupfe year), ///
	name(g2, replace)
twoway ///
	(line yhat_bothfe year), ///
	name(g3, replace)
graph combine g1 g2 g3, cols(3)

* 2
use "HW_4.dta", clear


* b)
rdplot posttest pretest, nbins(2500 2500) c(215)

* c)
reg posttest pretest treat, r

* d)
reg posttest pretest pretest*2 pretest*3 treat, r

* e) 
reg posttest pretest treat if pretest > 205 & pretest < 225, r