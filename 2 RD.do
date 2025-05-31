use "HW_4.dta", clear


* b)
rdplot posttest pretest, nbins(2500 2500) c(215)

* c)
reg posttest pretest treat, r

reg posttest pretest pretest*2 pretest*3 treat, r