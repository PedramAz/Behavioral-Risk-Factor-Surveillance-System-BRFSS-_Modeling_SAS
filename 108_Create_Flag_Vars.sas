/*set libname to r*/
libname r "/home/u56707295/PA_My_Content/Data";
run;

/*Create a set of flag variables for AGE_G (Age group)*/
/*We keep value 1 as reference*/

/*First we check the current state of values*/
proc freq data=r.brfss_i;
	tables _AGE_G / list missing;
run;

/*Create flag (dummy) variables for Age group*/

data r.brfss_j;
	set r.brfss_i;
	AGE2 = 0;
	if _AGE_G = 2 then AGE2 = 1;
	
	AGE3 = 0;
	if _AGE_G = 3 then AGE3 = 1;
	
	AGE4 = 0;
	if _AGE_G = 4 then AGE4 = 1;
	
	AGE5 = 0;
	if _AGE_G = 5 then AGE5 = 1;
	
	AGE6 = 0;
	if _AGE_G = 6 then AGE6 = 1;
run;	

/*Check the frequencies for the new flag variables*/
proc freq data=r.brfss_j;
	tables AGE2 * _AGE_G / list missing;
	tables AGE3 * _AGE_G / list missing;
	tables AGE4 * _AGE_G / list missing;
	tables AGE5 * _AGE_G / list missing;
	tables AGE6 * _AGE_G / list missing;
run;

/*Create new flag variables for income variable (INCOME3)*/
/*Note that the top group (8) kept as reference*/

/*First check the current state of values for variable INCOME3*/
proc freq data=r.brfss_j;
	tables INCOME3;
run;

/*Define new flag variables*/
data r.brfss_k;
	set r.brfss_j;
	
	INC1 = 0;
	if INCOME3 = 1 then INC1 = 1;
	
	INC2 = 0;
	if INCOME3 = 2 then INC2 = 1;
	
	INC3 = 0;
	if INCOME3 = 3 then INC3 = 1;
	
	INC4 = 0;
	if INCOME3 = 4 then INC4 = 1;
	
	INC5 = 0;
	if INCOME3 = 5 then INC5 = 1;
	
	INC6 = 0;
	if INCOME3 = 6 then INC6 = 1;
	
	INC7 = 0;
	if INCOME3 = 7 then INC7 = 1;
	
run;

proc freq data=r.brfss_k;
	tables inc1 * income3 / list missing;
	tables inc2 * income3 / list missing;
	tables inc3 * income3 / list missing;	
	tables inc4 * income3 / list missing;	
	tables inc5 * income3 / list missing;	
	tables inc6 * income3 / list missing;	
	tables inc7 * income3 / list missing;		
run;
	
/*Create flag variables for more variables*/
/*RACE*/

proc freq data=r.brfss_k;
	tables RACEGRP / list missing;
run;

data r.brfss_l;
	set r.brfss_k;
	
	BLACK = 0;
	if RACEGRP = 2 then BLACK = 1;
	
	ASIAN = 0;
	if RACEGRP = 4 then ASIAN = 1;
	
	OTHRRACE = 0;
	if RACEGRP in (3, 5, 6, 7) then OTHRRACE = 1;
run; 

proc freq data=r.brfss_l;
	tables BLACK * RACEGRP / list missing;
	tables ASIAN * RACEGRP / list missing;
	tables OTHRRACE * RACEGRP / list missing;
run; 

	
/*Marital status*/

proc freq data=r.brfss_l;
	tables MARGRP;
run;

data r.brfss_m;
	set r.brfss_l;
	
	NEVERMAR = 0;
	if MARGRP = 3 then NEVERMAR = 1;
	
	FORMERMAR = 0;
	if MARGRP = 2 then FORMERMAR = 1;
run;

proc freq data=r.brfss_m;
	tables nevermar * margrp / list missing;
	tables formermar * margrp / list missing;
run;


/*Education*/

proc freq data=r.brfss_m;
	tables edgroup;
run;


data r.brfss_n;
	set r.brfss_m;
	
	LOWED = 0;
	if edgroup in (1, 2) then LOWED = 1;
	
	SOMECOLL = 0;
	if edgroup = 3 then somecoll = 1;
run; 

proc freq data=r.brfss_n;
	tables lowed * edgroup / list missing;
	tables somecoll * edgroup / list missing;
run;


/*BMI*/

proc freq data=r.brfss_n;
	tables bmicat;
run;
	
data r.brfss_o;
	set r.brfss_n;
	
	UNDWT = 0;
	if bmicat = 1 then undwt = 1;
	
	OVWT = 0;
	if bmicat = 3 then ovwt = 1;
	
	obese = 0;
	if bmicat = 4 then obese = 1;
run;

proc freq data=r.brfss_o;
	tables undwt * bmicat / list missing;
	tables ovwt * bmicat / list missing;
	tables obese * bmicat / list missing;
run; 

/*General Health*/
proc freq data=r.brfss_o;
	tables genhlth2;
run;

data r.brfss_p;
	set r.brfss_o;
	
	FAIRHLTH = 0;
	if genhlth2 = 4 then fairhlth = 1;
	
	POORHLTH = 0;
	if genhlth2 = 5 then poorhlth = 1;
run; 

proc freq data=r.brfss_p;
	tables fairhlth * genhlth2 / list missing;
	tables poorhlth * genhlth2 / list missing;
run;


/*following are flag variables for multiple 3-level variables*/

PROC FREQ DATA=r.brfss_p;
	tables smkgrp;
run;



data r.brfss_q;
	set r.brfss_p;
	
	ASTHMAFLAG = 0;
	if asthma3 = 1 then asthmaflag = 1;
	
	DIABFLAG = 0;
	if diabete4 = 1 then diabflag = 1;
	
	MALE = 0;
	if SEX = 1 then male = 1;
	
	HISPANIC = 0;
	if _HISPANIC = 1 then HISPANIC = 1;
	
	SMOKER = 0;
	if SMKGRP = 1 then SMOKER = 1; 
	
	NOEXER = 0;
	if EXERANY3 = 1 then NOEXER = 1;
	
	NOPLAN = 0;
	if HLTHPLN2 = 2 then NOPLAN = 1;
run;

proc freq data=r.brfss_q;
	TABLES ASTHMAFLAG * ASTHMA3 / LIST MISSING;
	TABLES DIABFLAG * DIABETE4 / LIST MISSING;
	TABLES MALE * SEX / LIST MISSING;
	TABLES SMOKER * SMKGRP / LIST MISSING;
	TABLES NOEXER * EXERANY3 / LIST MISSING;
	TABLES NOPLAN * HLTHPLN2 / LIST MISSING;
RUN; 
	
	
	
	

	
	
	
	
	
	














	
	
	
	
	
















