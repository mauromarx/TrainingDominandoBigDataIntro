IMPORT $,STD;
//
ChicagoCrimes := $.ModChicagoCrimes_optimized;
//
Layout_CC_RowID := RECORD
    UNSIGNED    RowID;
    UNSIGNED4   Day;
    UNSIGNED4   Time;
    ChicagoCrimes.LayoutCC AND NOT Date;
END;
//
Layout_CC_RowID CCTransform(ChicagoCrimes.LayoutCC L, UNSIGNED cnt) := TRANSFORM
    SELF.RowID  := cnt;
    SELF.Day    := STD.Date.FromStringToDate(L.date[..10],'%m/%d/%Y');
    SELF.Time   := STD.Date.TimeFromParts(IF(L.Date[21..22]='PM',
										  IF(L.Date[12..13]='12',12,(UNSIGNED1)L.Date[12..13]+12),
										  IF(L.Date[12..13]='12',0, (UNSIGNED1)L.Date[12..13])),
										                            (UNSIGNED1)L.Date[15..16],
									                                (UNSIGNED1)L.Date[18..19]);
    SELF        := L;
END;
//
EXPORT UID_ChicagoCrimes := PROJECT(ChicagoCrimes.FileCC,CCTransform(LEFT,COUNTER))
                                : PERSIST('~CLASS::MDM::PERSIST::UID_ChicagoCrimes');
//