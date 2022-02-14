/*set libname as r*/
libname r "/home/u56707295/PA_My_Content/Data";
run;

/*To include only VETERANS in the data
  apply veteran exclusion*/
data r.brfss_c;
	set r.brfss_b;
	if veteran3 = 1;
run;

/*Apply exclusion to DIABETES variable*/
data r.brfss_d;
	set r.brfss_c;
	if diabete3 in (1, 2, 3, 4);
run;

/*apply exclusions to ASTHMA variable*/
data r.brfss_e;
	set r.brfss_d;
	if asthma3 in (1, 2);
run;