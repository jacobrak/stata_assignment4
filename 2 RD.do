use "HW_4.dta", clear


* b)
rdplot posttest pretest, nbins(2500 2500) c(215)

* c)
reg posttest pretest treat, r

* d)
reg posttest pretest pretest*2 pretest*3 treat, r

* e) 
reg posttest pretest treat if pretest > 205 & pretest < 225, r