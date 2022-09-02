IMPORT $;
//
Crimes := $.STD_ChicagoCrimes.File;
//
EXPORT Crimes_Slim := MODULE
	EXPORT Layout := RECORD
		RECORDOF(Crimes) AND NOT [Block,District,Community_Area]; // All recs excluding Block,District,Community_Area.
		UNSIGNED4 BCD_ID;
	END;
	EXPORT File := DATASET('~CLASS::MDM::OUT::Crimes_Slim',Layout,FLAT);
//	EXPORT IDX_PType_LDesc := INDEX(File,{Primary_Type,Location_Description},{File},
//                                          '~CLASS::MDM::KEY::PType_LDesc');
END;
//