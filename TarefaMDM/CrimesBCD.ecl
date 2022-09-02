IMPORT $;
//
EXPORT CrimesBCD := MODULE
	EXPORT Layout := RECORD
		UNSIGNED4 	BCD_ID;
        STRING      Block;
        UNSIGNED2   District;
        UNSIGNED2   Community_Area;
	END;
	SHARED Filename := '~CLASS::MDM::OUT::LookupBCD';
	EXPORT File 	:= DATASET(Filename,Layout,FLAT);
	EXPORT IDX_BCD 	:= INDEX(File,{BCD_ID},{File},'~CLASS::MDM::KEY::Crimes_BCD');
END;
//