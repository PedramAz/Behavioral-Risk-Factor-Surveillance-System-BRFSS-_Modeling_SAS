/*Ch-Square*/
proc freq data=r.analytic;
	tables diabete4 * asthma3 /nocol norow nopercent chisq;
	tables sex * asthma3 /nocol norow nopercent chisq;
	tables _age_g * asthma3 /nocol norow nopercent chisq;
	tables _hispanc * asthma3 /nocol norow nopercent chisq;
	tables RACEGRP * asthma3 /nocol norow nopercent chisq;
	tables marital * asthma3 /nocol norow nopercent chisq;
	tables educa * asthma3 /nocol norow nopercent chisq;
	tables income2 * asthma3 /nocol norow nopercent chisq;
	tables _bmi5cat * asthma3 /nocol norow nopercent chisq;
	tables exerany2 * asthma3 /nocol norow nopercent chisq;
	tables hlthpln1 * asthma3 /nocol norow nopercent chisq; 
	tables genhlth * asthma3 /nocol norow nopercent chisq;
run;
