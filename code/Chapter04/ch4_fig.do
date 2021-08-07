import delimited E:\Dropbox\PMA6\PMA6_Shared\data6e\ParHIV.txt
* Need to install community contributed tabplot command first

gen jobmom = real(jobmo)
gen edumom = real(edumo)

label define jobcat 1 "Employed" 2 "Unemployed" 3 "Retired/Disabled"
label values jobmom jobcat 

label define educat 1 "Did not complete HS" 2 "HS diploma/GED" 3 "More than HS diploma"
label values edumom educat 

tabplot jobmom edumom, percent(edumom) showval subtitle(% of Education category) /// 
		ytitle("Job Status") xtitle("Education Status") bfcolor(none)

graph display, xsize(7)
graph export tabplot.pdf, replace
