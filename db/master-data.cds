namespace masterdata;

using {epam.sap.dev.library} from './schema';


entity Statuses {
    key ID          : String;
        name        : String(20);
        criticality : Integer;
}


entity BookStatuses {
    key ID          : String;
        name        : String(20);
        criticality : Integer;
}