EXPORT ModChicagoCrimes := Module
//
    EXPORT LayoutCC := RECORD
        UNSIGNED      ID;
        STRING        Case_Number;
        STRING        Date;
        STRING        Block;
        UNSIGNED      IUCR;
        STRING        Primary_Type;
        STRING        Description;
        STRING        Location_Description;
        BOOLEAN       Bool_Arrested;
        BOOLEAN       Domestic;
        UNSIGNED      Beat;
        UNSIGNED      District;
        UNSIGNED      Ward;
        UNSIGNED      Community_Area;
        STRING        FBI_Code;
        UNSIGNED      X_Coordinate;
        UNSIGNED      Y_Coordinate;
        UNSIGNED      Year;
        STRING        Updated_On;
        DECIMAL15_12  Latitude;
        DECIMAL15_12  Longitude;
        STRING        Location;
    END;
//
   EXPORT FileCC := DATASET('~class::mdm::orig::chicagocrimes',LayoutCC,CSV(HEADING(1)));
END;
//