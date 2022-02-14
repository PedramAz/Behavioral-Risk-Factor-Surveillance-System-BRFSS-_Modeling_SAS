/*set libname as r*/

Libname r "/home/u56707295/PA_My_Content/Data";
run;

/*One-way ANOVA tests for table*/

proc glm data = r.analytic PLOTS(MAXPOINTS=NONE);
	class _AGE_G;
	model SLEPTIM1 = _AGE_G;
run;

ods graphics on;
proc anova data=r.analytic plots(maxpoints=none);
	class _AGE_G;
	model SLEPTIM1 = _AGE_G;
run;
ods graphics off;


proc glm data = r.analytic PLOTS(MAXPOINTS=NONE);
	class _HISPANC;
	model SLEPTIM1 = _HISPANC;
run;

proc glm data = r.analytic PLOTS(MAXPOINTS=NONE);
	class RACEGRP;
	model SLEPTIM1 = RACEGRP;
run;

proc glm data = r.analytic PLOTS(MAXPOINTS=NONE);
	class MARGRP;
	model SLEPTIM1 = MARGRP;
run;

proc glm data = r.analytic PLOTS(MAXPOINTS=NONE);
	class EDGROUP;
	model SLEPTIM1 = EDGROUP;
run;

proc glm data = r.analytic PLOTS(MAXPOINTS=NONE);
	class INCOME3;
	model SLEPTIM1 = INCOME3;
run;

proc glm data = r.analytic PLOTS(MAXPOINTS=NONE);
	class BMICAT;
	model SLEPTIM1 = BMICAT;
run;

proc glm data = r.analytic PLOTS(MAXPOINTS=NONE);
	class EXERANY3;
	model SLEPTIM1 = EXERANY3;
run;

proc glm data = r.analytic PLOTS(MAXPOINTS=NONE);
	class HLTHPLN2;
	model SLEPTIM1 = HLTHPLN2;
run;

proc glm data = r.analytic PLOTS(MAXPOINTS=NONE);
	class GENHLTH2;
	model SLEPTIM1 = GENHLTH2;
run;
quit;
