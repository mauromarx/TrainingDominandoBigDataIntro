IMPORT $;
//
Crimes := $.STD_ChicagoCrimes.File;
//
Layout_Tab_recs := RECORD
	UNSIGNED4 BCD_ID := Crimes.RowID;
	Crimes.Block;
	Crimes.District;
	Crimes.Community_Area;
END;
//
Tab_recs := TABLE(Crimes,Layout_Tab_recs);
Tab_recs;
Sort_recs := SORT(Tab_recs,Community_Area,District,Block);
//
Layout_Tab_recs RollBCD(Layout_Tab_recs L, Layout_Tab_recs R) := TRANSFORM
	SELF.BCD_ID := IF(L.BCD_ID < R.BCD_ID,L.BCD_ID,R.BCD_ID);
	SELF        := L;
END;
//
Rollup_BCD := ROLLUP(Sort_Recs, LEFT.Community_Area = RIGHT.Community_Area AND
								LEFT.District   	= RIGHT.District AND
								LEFT.Block    		= RIGHT.Block,
						RollBCD(LEFT,RIGHT));
//
Rollup_BCD2 := SORT (Rollup_BCD,BCD_ID);
//
OUTPUT(Rollup_BCD2,,'~CLASS::MDM::OUT::LookupBCD',OVERWRITE);
//