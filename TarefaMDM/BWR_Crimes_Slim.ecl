IMPORT $;
//
$.Crimes_Slim.Layout Slimdown($.STD_ChicagoCrimes.Layout L, $.CrimesBCD.Layout R) := TRANSFORM
	SELF.BCD_ID := R.BCD_ID;
	SELF 		:= L;
END;
//
SlimRecs := JOIN($.STD_ChicagoCrimes.File, $.CrimesBCD.File,
									 LEFT.Community_Area = RIGHT.Community_Area AND
									 LEFT.District	     = RIGHT.District AND
									 LEFT.Block	         = RIGHT.Block,
									 Slimdown(LEFT,RIGHT),LEFT OUTER, LOOKUP);
//
OUTPUT(SlimRecs,,'~CLASS::MDM::OUT::Crimes_Slim',overwrite);
//