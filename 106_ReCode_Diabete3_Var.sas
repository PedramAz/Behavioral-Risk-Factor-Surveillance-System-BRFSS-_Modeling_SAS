/*set libname to r*/
libname r "/home/u56707295/PA_My_Content/Data";
run;

/*Recode Diabete3 variable*/
data r.brfss_g;
	set r.brfss_f;
	DIABETE4 = 9;
	if diabete3 in (1, 2) then DIABETE4 =1;
	if diabete3 in (3, 4) then DIABETE4 =2;
run;

/*Check out the value frequencies in the newly made DIABETE4 variable*/
/* used the * to create a crosstab*/
/*list option makes the output more readable and in a list*/
proc freq data=r.brfss_g;
	tables diabete3 * diabete4 / list missing;
run;
