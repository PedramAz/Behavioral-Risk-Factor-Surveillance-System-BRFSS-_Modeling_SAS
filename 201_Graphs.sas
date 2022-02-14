/*Set libname to r*/
libname r "/home/u56707295/PA_My_Content/Data";
run;

/*Plot one categorical variable*/ 


/*Bar plot*/

/*one group*/
proc gchart data=r.analytic;
	vbar diabete4 / discrete type=percent;
	run;
quit;

/*two groups*/
proc gchart data=r.analytic;
	vbar diabete4 / discrete type=percent subgroup=ASTHMA3;
	run;
quit;


/*Pie chart*/
proc gchart data=r.analytic;
	pie diabete4 /discrete
	value=inside
	percent=inside
	slice=outside;
run;

proc gchart data=r.analytic;
	pie _AGE_G / discrete
	value=outside
	percent=outside
	slice=inside;
run;

/*Histogram*/
proc gchart data=r.analytic;
	vbar sleptim1 / levels=8;
	run;
quit;


proc gchart data=r.brfss_a;
	vbar _AGE80 / levels=20;
	run;
quit;


/*Boxplot*/
/*using SGPLOT*/

proc sgplot data= r.analytic;
	vbox sleptim1;
run;


proc sgplot data=r.analytic;
	vbox sleptim1 / category=asthma3;
run;


/*Scatterplot*/
/*using GPLOT*/

/*To use sleptim1 for this scatterplot we need to do some cleaning*/

proc freq data=r.brfss_a;
	tables sleptim1;
run;

/*To remove values of 77 and 99*/
data clean_slep;
	set r.brfss_a;
	
	sleptim2 = sleptim1;
	if sleptim1 GE 77 then sleptim2 = .;
run;
/*Check the new variable*/
proc freq data=clean_slep;
	tables sleptim2 * sleptim1 / list missing;
run;

/*Scatterplot for sleep time and age*/
proc gplot data=clean_slep;
	plot sleptim2 * _Age80;
run;
quit;

/*Group scatterplot by SEX*/
proc gplot data=clean_slep;
	plot sleptim2 * _Age80 = SEX;
run;
quit;
































