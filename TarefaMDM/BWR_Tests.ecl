IMPORT $,Std;
//
// D2 := STD.Date.FromStringToDate('4/29/1974', '%m/%d/%Y'); //D2 contains 19740429
// D2;
//
// T2 := STD.Date.FromStringToTime('02:30:15 PM', '%I:%M:%S %p'); // T2 contains 
// T2;
//
// $.STD_ChicagoCrimes.File; // PERSIST...
//
$.FN_FetchCrimes('THEFT','');
$.FN_FetchCrimes('ASSAULT','APARTMENT');
$.FN_FetchCrimes('BATTERY','RESIDENCE');
$.FN_FetchCrimes('NARCOTICS','ALLEY');
$.FN_FetchCrimes('NARCOTICS','SIDEWALK');
//