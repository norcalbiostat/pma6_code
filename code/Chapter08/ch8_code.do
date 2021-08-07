import delimited E:\Dropbox\PMA6\PMA6_Shared\data6e\Lung.txt

* set scheme s1 monochrome

* Section 8.3
summarize fage fheight ffev1
regress ffev1 fage fheight

* correlation matrix
corr fage fheight fweight ffev1, cov

* reshape wide to long
import delimited E:\Dropbox\PMA6\PMA6_Shared\data6e\Lung.txt, numericcols(21 22 23 24 25 26 27 28 29 30 31 32) clear 
rename (fsex fage fheight fweight ffvc ffev1) (sex1 age1 height1 weight1 fvc1 fev1)
rename (msex mage mheight mweight mfvc mfev1) (sex2 age2 height2 weight2 fvc2 fev2)
rename (ocsex ocage ocheight ocweight ocfvc ocfev1) (sex3 age3 height3 weight3 fvc3 fev3)
rename (mcsex mcage mcheight mcweight mcfvc mcfev1) (sex4 age4 height4 weight4 fvc4 fev4)
rename (ycsex ycage ycheight ycweight ycfvc ycfev1) (sex5 age5 height5 weight5 fvc5 fev5)
 
reshape long sex age height weight fvc fev, i(id) j(member)

sort member
by member: summarize
