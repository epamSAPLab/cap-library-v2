using epam.sap.dev.library as library from '../db/schema';
using masterdata as masterdata from '../db/master-data';
using sap.common as common from '@sap/cds/common';

@requires : 'authenticated-user'
service LibraryService {

    @restrict : [
        {
            grant : [
                'READ',
                'CREATE',
                'UPDATE',
                'DELETE'
            ],
            to    : [
                'BookingManager',
                'LibraryAdministrator'
            ]
        }
    ]
    entity Booking      as projection on library.Booking actions {
        @Core.OperationAvailable : in.returnTheBookEnabled
        action returnTheBook();
    };

    @restrict : [
        {
            grant : 'READ',
            to    : 'LibraryViewer'
        },
        {
            grant : [
                'READ',
                'CREATE',
                'UPDATE',
                'DELETE'
            ],
            to    : [
                'BooksManager',
                'LibraryAdministrator'
            ]
        }
    ]
    entity Books        as projection on library.Books actions {
        action requestTheBook();
        @Core.OperationAvailable :                   in.orderBookEnabled
        action orderBook(Quantity : Integer @title : 'Order Quantity');
    };

    @restrict : [{
        grant : [
            'READ',
            'CREATE',
            'UPDATE',
            'DELETE'
        ],
        to    : [
            'ReadersManager',
            'LibraryAdministrator'
        ]
    }]
    entity Readers      as projection on library.Readers;

    @restrict : [
        {
            grant : 'READ',
            to    : 'LibraryViewer'
        },
        {
            grant : [
                'READ',
                'CREATE',
                'UPDATE',
                'DELETE'
            ],
            to    : [
                'AuthorsManager',
                'LibraryAdministrator'
            ]
        }
    ]
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
