/*set libanme to r*/
libname r "/home/u56707295/PA_My_Content/Data";
run;

/*create a new smoker variable*/
/* only current smokers get 1 and the rest get 0*/
/*We use two variables to create this new variable -> smoke100 and smokeday2*/
data r.brfss_h;
	set r.brfss_g;
	
	neversmk = 0;
	if smoke100 = 2 then neversmk =1;
	
	smkgrp = 9;
	
	if smokday2 in (1, 2) then smkgrp =1;
	if (smokday2 = 3 | neversmk = 1) then smkgrp = 2;
run;

proc freq data=r.brfss_h;
	tables neversmk * smoke100 / list missing;
	tables smkgrp * smokday2 / list missing;
run;


/*create rest of grouping variables*/

data r.BRFSS_i;
	set r.BRFSS_h;

	MARGRP = 9;

	if (MARITAL = 1 | MARITAL = 6)
		then MARGRP = 1;
	if MARITAL in (2, 3, 4)
		then MARGRP = 2;
	if MARITAL = 5
		then MARGRP = 3;

	EDGROUP = 9;

	if EDUCA in (1, 2, 3)
		then EDGROUP = 1;
	if EDUCA = 4
		then EDGROUP = 2;
	if EDUCA = 5
		then EDGROUP = 3;
	if EDUCA = 6
		then EDGROUP = 4;

	GENHLTH2 = GENHLTH;

	if GENHLTH2 not in (1, 2, 3, 4, 5)
		then GENHLTH2 = 9;

	INCOME3 = INCOME2;

	if INCOME3 not in (1, 2, 3, 4, 5, 6, 7, 8)
		then INCOME3 = 9;

	RACEGRP = _MRACE1;

	if _MRACE1 = 7
		then RACEGRP = 6;
	if _MRACE1 not in (1, 2, 3, 4, 5, 6, 7)
		then RACEGRP = 9;

		
	EXERANY3 = EXERANY2;

	if EXERANY2 not in (1, 2)
		Then EXERANY3 = 9;

	HLTHPLN2 = HLTHPLN1;

	if HLTHPLN1 not in (1, 2)
		Then HLTHPLN2 = 9;

	BMICAT = _BMI5CAT;

	if BMICAT not in (1, 2, 3, 4)
		then BMICAT = 9;

run;

proc freq data=r.BRFSS_i;
	table MARGRP * MARITAL / list missing;
	table EDGROUP * EDUCA / list missing;
	table GENHLTH2 * GENHLTH / list missing;
	table INCOME3 * INCOME2 / list missing;
	table RACEGRP * _MRACE1 / list missing;
	table EXERANY3 * EXERANY2 / list missing;
	table HLTHPLN2 * HLTHPLN1 / list missing;
	table BMICAT * _BMI5CAT / list missing;
	table DIABETE3 * DIABETE4 / list missing;
run;








