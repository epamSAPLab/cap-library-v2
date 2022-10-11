using epam.sap.dev.library as library from '../db/schema';
using masterdata as masterdata from '../db/master-data';
using sap.common as common from '@sap/cds/common';

service LibraryService {
    entity Booking      as projection on library.Booking actions {
        @Core.OperationAvailable : in.returnTheBookEnabled
        action returnTheBook();
    };

    entity Books        as projection on library.Books actions {
        action requestTheBook();
        @Core.OperationAvailable : in.orderBookEnabled
        action orderBook(Quantity: Integer @title : 'Order Quantity');
    };

    entity Readers      as projection on library.Readers;

    entity Authors      as projection on library.Authors;

    entity Statuses     as projection on masterdata.Statuses;

    entity BookStatuses as projection on masterdata.BookStatuses;

    entity Currencies   as projection on common.Currencies;

}

service TechnicalService @(requires : 'system-user') {
    entity Booking      as projection on library.Booking;
    entity Books        as projection on library.Books;
    entity Readers      as projection on library.Readers;
    entity Authors      as projection on library.Authors;
    entity Statuses     as projection on masterdata.Statuses;
    entity BookStatuses as projection on masterdata.BookStatuses;
    entity Currencies   as projection on common.Currencies;
}
