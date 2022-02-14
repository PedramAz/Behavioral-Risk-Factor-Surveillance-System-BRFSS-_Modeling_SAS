/*set libname as r*/
libname r "/home/u56707295/PA_My_Content/Data";
run;

/*proc freq without options*/
proc freq data=r.brfss_b;
/*one-way frequency table*/
	tables VETERAN3;
run;

/*check for missing data or values for no answer which we want to exclude*/
proc freq data=r.brfss_b;
	tables VETERAN3 / missing;
	tables DIABETE3 / missing;
	tables SLEPTIM1 / missing;
	tables ASTHMA3 / missing;
run;