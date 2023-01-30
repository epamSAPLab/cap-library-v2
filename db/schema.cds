namespace epam.sap.dev.library;

using {managed} from '@sap/cds/common';
using {masterdata} from './master-data';
using {
    sap.common.CodeList,
    Currency
} from './common';
using {API_BUSINESS_PARTNER as external1} from '../srv/external/API_BUSINESS_PARTNER.csn';


entity Booking : managed {
    key bookingUUID                  : UUID;
        bookingID                    : Integer;
        readerID                     : Association to Readers;
        bookID                       : Association to Books;
        bookingStatus                : Association to one masterdata.Statuses;
        beginDate                    : Date;
        beginTime                    : Time;
        endDate                      : Date;
        endTime                      : Time;
        image                        : LargeBinary @Core.MediaType : 'image/png';
        virtual returnTheBookEnabled : Boolean;
}

entity Authors : managed {
    key authorUUID : UUID;
        authorID   : Integer;
        firstName  : localized String(15);
        lastName   : localized String(15);
        birthday   : Date;
        country    : String(30);
        image      : LargeBinary @Core.MediaType : 'image/png';
        book       : Association to many Books
                         on book.toAuthor = $self;
};

entity Books : managed {
    key bookUUID                 : UUID;
        toAuthor                 : Association to Authors;
        bookID                   : Integer;
        bookName                 : localized String(60);
        pageNumber               : Integer;
        copyQty                  : Integer;
        shippedQty               : Integer;
        price                    : Decimal(15, 2);
        CurrencyCode             : Currency;
        status                   : Association to one masterdata.BookStatuses;
        image                    : LargeBinary @Core.MediaType : 'image/png';
        supplier                 : Association to Suppliers;
        virtual orderBookEnabled : Boolean;
}

entity Readers : managed {
    key readerUUID    : UUID;
        readerID      : Integer;
        firstName     : localized String(15);
        lastName      : localized String(15);
        readerBithday : Date;
        phonenumber   : String(15);
        image         : LargeBinary @Core.MediaType : 'image/png';
}

entity Suppliers  as projection on external1.A_BusinessPartner {
    key BusinessPartner          as ID,
        BusinessPartnerFullName  as fullName,
        BusinessPartnerIsBlocked as isBlocked
};
