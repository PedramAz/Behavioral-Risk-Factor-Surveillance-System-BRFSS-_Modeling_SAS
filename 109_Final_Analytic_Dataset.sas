/*Final analytic dataset*/
/*Use varnum to see the variables in the order in which they were created*/
proc contents varnum data=r.brfss_q;
run;

/*Copy to a new dataset names "analytic"*/
/*In case we needed to change the variables in the analytic dataset
that code should come before this transformation*/
data r.analytic;
	set r.brfss_q;
run;

proc contents varnum data=r.analytic;
run;