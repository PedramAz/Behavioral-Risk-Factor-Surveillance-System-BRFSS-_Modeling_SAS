/*Using Analytic dataset*/
/*One-way frequency of ASTHMA*/

proc freq data=r.analytic;
	tables asthma3 / missing;
run;

/*Diabetes*/

proc freq data=r.analytic;
	tables diabete4 / missing;
	tables diabete4 * asthma3 / list missing;
/*SEX*/
	tables sex / missing;
	tables sex * asthma3 / list missing;
/*AGE*/
	tables _age_g / missing;
	tables _age_g * asthma3 / list missing;
/*Ethnicity*/
	tables _hispanc / missing;
	tables _hispanc * asthma3 / list missing; 
/*Race*/
	tables RACEGRP / missing;
	tables RACEGRP * asthma3 /list missing;
/*Marital status*/
	tables MARGRP / missing;
	tables MARGRP * asthma3 / list missing;
/*Education*/
	tables educa / missing;
	tables educa * asthma3 / list missing;
/*Annual household income*/
	tables income2 / missing;
	tables income2 * asthma3 / list missing;
/*Obesity*/
	tables _bmi5cat / missing;
	tables _bmi5cat * asthma3 / list missing;
/*Exercise status*/
	tables exerany2 / missing;
	tables exerany2 * asthma3 / list missing; 
/*Health plan*/
	tables hlthpln1 / missing;
	tables hlthpln1 * asthma3 / list missing;
/*General health*/
	tables genhlth / missing;
	tables genhlth * asthma3 / list missing;
run;

