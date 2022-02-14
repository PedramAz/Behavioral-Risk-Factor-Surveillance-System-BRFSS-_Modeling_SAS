
/*set libname as r*/
Libname r "/home/u56707295/PA_My_Content/Data";
run;

/*set libname of actual XPT file*/
Libname XPTfile xport "/home/u56707295/PA_My_Content/Data/LLCP2014.XPT";
run;

/*data step
read the data in and unpack it into libname mapped to r
*/
data r.BRFSS_a;
	set XPTfile.LLCP2014;
run;

/*verify data import success*/
proc contents data=r.BRFSS_a;
run;

