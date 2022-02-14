/*set libname as r*/

Libname r "/home/u56707295/PA_My_Content/Data";
run;

/*SLEPTIM1 moments for entire sample*/

proc univariate data = r.analytic;
	var SLEPTIM1;
run;
/*sort, then stratify by diabetes status*/

proc sort data = r.analytic;
	by DIABETE4;
proc univariate data = r.analytic;
	var SLEPTIM1;
	by DIABETE4;
run;

/*analyze other stratifications*/

proc sort data = r.analytic;
	by _AGE_G;
proc univariate data = r.analytic;
	var SLEPTIM1;
	by _AGE_G;
run;

proc sort data = r.analytic;
	by SEX;
proc univariate data = r.analytic;
	var SLEPTIM1;
	by SEX;
run;

proc sort data = r.analytic;
	by _HISPANC;
proc univariate data = r.analytic;
	var SLEPTIM1;
	by _HISPANC;
run;

proc sort data = r.analytic;
	by RACEGRP;
proc univariate data = r.analytic;
	var SLEPTIM1;
	by RACEGRP;
run;

proc sort data = r.analytic;
	by MARGRP;
proc univariate data = r.analytic;
	var SLEPTIM1;
	by MARGRP;
run;

proc sort data = r.analytic;
	by EDGROUP;
proc univariate data = r.analytic;
	var SLEPTIM1;
	by EDGROUP;
run;

proc sort data = r.analytic;
	by INCOME3;
proc univariate data = r.analytic;
	var SLEPTIM1;
	by INCOME3;
run;

proc sort data = r.analytic;
	by ASTHMA3;
proc univariate data = r.analytic;
	var SLEPTIM1;
	by ASTHMA3;
run;

proc sort data = r.analytic;
	by BMICAT;
proc univariate data = r.analytic;
	var SLEPTIM1;
	by BMICAT;
run;

proc sort data = r.analytic;
	by EXERANY3;
proc univariate data = r.analytic;
	var SLEPTIM1;
	by EXERANY3;
run;

proc sort data = r.analytic;
	by HLTHPLN2;
proc univariate data = r.analytic;
	var SLEPTIM1;
	by HLTHPLN2;
run;

proc sort data = r.analytic;
	by GENHLTH2;
proc univariate data = r.analytic;
	var SLEPTIM1;
	by GENHLTH2;
run;
