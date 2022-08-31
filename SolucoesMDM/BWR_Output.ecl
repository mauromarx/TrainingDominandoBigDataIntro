IMPORT $, DataPatterns;
//
//  OUTPUT($.File_Persons.File);
CHOOSEN($.File_Persons.File,4);
//
//  OUTPUT($.File_Accounts.File);
CHOOSEN($.File_Accounts.File,4);
//
//  OUTPUT($.ModChicagoCrimes_raw.FileCC);
CHOOSEN($.ModChicagoCrimes_raw.FileCC,4);
//
//  OUTPUT($.ModChicagoCrimes_optimized.FileCC);
CHOOSEN($.ModChicagoCrimes_optimized.FileCC,4);
//
//
Persons := $.File_Persons.File;
profileResults := DataPatterns.Profile(Persons);
OUTPUT(profileResults, ALL, NAMED('profileResults'));
//