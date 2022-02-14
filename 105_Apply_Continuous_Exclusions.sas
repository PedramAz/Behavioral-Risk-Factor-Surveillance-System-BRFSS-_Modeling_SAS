/*set libname*/
libname r "/home/u56707295/PA_My_Content/Data";
run;

/*Keep only values below 77
because 1 through 24 are valid*/

data r.brfss_f;
	set r.brfss_e;
	if SLEPTIM1 < 77;
run;

/*run one-way frequencies again after exclusions*/
proc freq data=r.brfss_f;
	tables veteran3 / missing;
	tables asthma3 / missing;
	tables diabete3 / missing;
	tables sleptim1 / missing;
run;

