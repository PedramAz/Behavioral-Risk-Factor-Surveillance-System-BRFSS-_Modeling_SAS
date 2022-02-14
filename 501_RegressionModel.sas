libname r "/home/u56707295/PA_My_Content/Data";
run;

proc contents data=r.analytic out=meta (keep=name);
run;
proc print data=meta; 
run;

proc univariate data=r.analytic plots;
	var sleptim1;
run; 

proc reg data=r.analytic;
	model sleptim1 = diabflag;
run;
quit;

/*Simple linrar regression*/
/*Linear regression with only 1 independent variable*/
proc glm data=r.analytic;
	model sleptim1 = diabflag;
run;

/*Model 2*/
/*Adjusted for age and sex*/
proc glm data=r.analytic;
	model sleptim1 = diabflag male age2 age3 age4 age5 age6;
run;

/*Stepwise model development*/ 
/*Manulally adding/dropping  variables from next model based on significance*/
/*Model 3*/
proc glm data=r.analytic;
	model sleptim1 = diabflag age4 age5 age6 black asian _hispanc othrrace formermar somecoll asthmaflag
	ovwt obese smoker fairhlth poorhlth age3 inc5 inc7;
run;

/*Logistic Regression*/

/*Response variable -> Binary -> Asthma*/

/*Outcome Distribution*/
proc freq data=r.analytic;
	tables asthmaflag / missing;
	tables asthmaflag * diabflag / list missing;
run; 

/*Model-1 -> Univariate*/
proc logistic data=r.analytic descending;
	model asthmaflag = diabflag;
run;

/*Model-2*/

proc logistic data=r.analytic descending;
	model asthmaflag = diabflag male age3 age4 age5 age6; 
run;

/*Model-Final*/
proc logistic data=r.analytic descending;
	model asthmaflag = diabflag male othrrace 
	inc1 inc2 inc3 inc4 obese
	fairhlth poorhlth 
	age6 lowed smoker noexer ovwt inc5;
run;



/*Model-Final
interactions added*/
proc logistic data=r.analytic descending;
	model asthmaflag = diabflag male othrrace 
	inc1 inc2 inc3 inc4 obese
	fairhlth poorhlth 
	age6 lowed smoker noexer ovwt inc5
	diabflag*smoker;
run;










