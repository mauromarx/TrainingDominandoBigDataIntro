EXPORT ModChicagoCrimes_optimized := Module
//
    EXPORT LayoutCC := RECORD
        UNSIGNED ID;
        STRING      Case_Number;
        STRING      Date;
        STRING      Block;
        STRING      IUCR;
        STRING      Primary_Type;
        STRING      Description;
        STRING      Location_Description;
        BOOLEAN     Arrest;
        BOOLEAN     Domestic;
        UNSIGNED2   Beat;
        UNSIGNED2   District;
        UNSIGNED2   Ward;
        UNSIGNED2   Community_Area;
        STRING      FBI_Code;
        UNSIGNED6   X_Coordinate;
        UNSIGNED6   Y_Coordinate;
        UNSIGNED2   Year;
        STRING      Updated_On;
        DECIMAL11_9 Latitude;
        DECIMAL11_9 Longitude;
        STRING      Location;
    END;
//
   EXPORT FileCC := DATASET('~class::mdm::raw::chicagocrimes',LayoutCC,CSV(HEADING(1)));
END;
//