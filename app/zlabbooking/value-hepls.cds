using { epam.sap.dev.library as library } from '../../db/schema';


annotate library.Booking {
readerID @Common.ValueList: {
CollectionPath : 'Readers',
Label : '',
Parameters : [
    { $Type: 'Common.ValueListParameterInOut', LocalDataProperty: readerID_readerUUID, ValueListProperty: 'readerUUID'},
     { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'readerID'},
    { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'firstName'},
    { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'lastName'},
    { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'readerBithday'},
   { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'phonenumber'}   
],
SearchSupported : true
};
bookID @Common.ValueList: {
CollectionPath : 'Books',
Label : '',
Parameters : [
    { $Type: 'Common.ValueListParameterInOut', LocalDataProperty: bookID_bookUUID, ValueListProperty: 'bookUUID'},
     { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'bookID'},
    { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'bookName'},
    { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'pageNumber'},
    { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'copyQty'}
    ],
SearchSupported : true
};
bookingStatus @Common.ValueList: {
CollectionPath : 'Statuses',
Label : '',
Parameters : [
    { $Type: 'Common.ValueListParameterInOut', LocalDataProperty: bookingStatus_ID, ValueListProperty: 'ID'},
    { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'name'}
],
SearchSupported : true
};
}