/*T-test for Diabetes and Sleep time*/
proc ttest data=r.analytic;
	class diabete4;
	var sleptim1;
run;

/*T-test for sex and Sleep time*/
proc ttest data=r.analytic;
	class sex;
	var sleptim1;
run;

/*T-test for asthma and Sleep time*/
proc ttest data=r.analytic;
	class asthma3;
	var sleptim1;
run;

