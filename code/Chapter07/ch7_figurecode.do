import delimited E:\Dropbox\PMA6\PMA6_Shared\data6e\Lung.txt

* set scheme s1 monochrome

* Figure 7.1
scatter ffev1 fheight || lfit ffev1 fheight
graph export "E:\Dropbox\PMA6\PMA6_Shared\latex\Chapters\Chapter07\figures\fig7-1.pdf", as(pdf) replace


* Figure 7.12
 regress ffev1 fheight
 predict r, resid
 pnorm r
 graph export "E:\Dropbox\PMA6\PMA6_Shared\latex\Chapters\Chapter07\figures\fig7-12.pdf", as(pdf) replace


