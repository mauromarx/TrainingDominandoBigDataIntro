IMPORT $;
//
ChicagoCrimes := $.ModChicagoCrimes_optimized.FileCC;
//
Layout_CC_RowID := RECORD
    UNSIGNED4 RowID;
    $.ModChicagoCrimes_optimized.LayoutCC;
END;
//
Layout_CC_RowID CCTransf($.ModChicagoCrimes_optimized.LayoutCC L, INTEGER cnt) := TRANSFORM
    SELF.RowID  := cnt;
    SELF.Day    := STD.Date.FromStringToDate(date[..10],'%m/%d/%Y');
    SELF        := L;
END;
//
EXPORT UID_ChicagoCrimes := PROJECT(ChicagoCrimes,CCTransf(LEFT,COUNTER));
//                              : PERSIST('~CLASS::MDM::PERSIST::UID_Persons');
//