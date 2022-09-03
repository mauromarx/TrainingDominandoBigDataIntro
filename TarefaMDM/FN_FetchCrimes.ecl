EXPORT FN_FetchCrimes (STRING33 ptype, STRING59 ldesc) := FUNCTION
//
	basekey1 := $.Crimes_Slim.IDX_PType_LDesc;
	basekey2 := $.CrimesBCD.IDX_BCD;
//	
	FilteredKey := IF(ptype='',
					  basekey1(Primary_Type=ptype), 
					  basekey1(Primary_Type=ptype AND Location_Description=ldesc)
					 );
//	
	Outrec := RECORD
		RECORDOF(basekey1) AND NOT [bcd_id];
		RECORDOF(basekey2) AND NOT [bcd_id];
	END;
//	
	Outrec MyJoin(basekey2 Le, FilteredKey Ri):= TRANSFORM
		SELF:=Le;
		SELF:=Ri;
	END;
//	
	JoinRecs:= JOIN(basekey2,FilteredKey,LEFT.bcd_id=RIGHT.bcd_id, 
									     MyJoin(LEFT, RIGHT),
									     ALL);
//
	RETURN OUTPUT(JoinRecs);
END;
//