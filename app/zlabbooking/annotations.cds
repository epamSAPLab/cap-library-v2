using LibraryService as service from '../../srv/services';

annotate LibraryService.Booking with @(
    UI: {
    Identification: [{Value: bookingStatus_ID },
  {$Type  : 'UI.DataFieldForAction', Action : 'LibraryService.returnTheBook',   Label  : '{i18n>returnTheBook}'}
 ],
 SelectionFields: [bookingStatus_ID, readerID_readerUUID, bookID_bookUUID, beginDate, beginTime, endDate, endTime],
 LineItem: [
     { $Type : 'UI.DataField', Value : bookingID, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: bookingStatus_ID, Criticality: bookingStatus.criticality,![@UI.Importance]: #High },  
     { $Type : 'UI.DataField', Value: readerID.lastName, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: readerID.firstName, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: bookID.bookName, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: beginDate, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: beginTime, ![@UI.Importance]: #High },
     { $Type: 'UI.DataField', Value: endDate, ![@UI.Importance]: #High},
     { $Type : 'UI.DataField', Value: endTime, ![@UI.Importance]: #High }
 ],
 PresentationVariant : {SortOrder : [   
        {   $Type      : 'Common.SortOrderType', Property   : bookingID, Descending : false }
        ]},
    },
  UI        : {
        HeaderInfo : {
            TypeName       : 'Booking',
            TypeNamePlural : 'Bookings',
            Title          : {Value : bookingStatus.ID },
            Description : {Value : bookingStatus.name}
        },
        HeaderFacets : [
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #Medium
        }],
        FieldGroup #Description        : {Data : [
        {   $Type : 'UI.DataField', Value : image },   
        {   $Type : 'UI.DataField', Value : beginDate, Label : 'StartDate' },
        {   $Type : 'UI.DataField', Value : endDate, Label : 'End Date' },
         ]},
        FieldGroup #Details2 : {Data : [
        {
            $Type : 'UI.DataFieldWithIntentBasedNavigation',
            Value : readerID_readerUUID,
            SemanticObject : 'Readersv2',
            Action : 'manage'
        }
        //{   $Type : 'UI.DataField', Value : readerID_readerUUID}
         ]},
        FieldGroup #Details3 : {Data : [
        {
            $Type : 'UI.DataFieldWithIntentBasedNavigation',
            Value : bookID_bookUUID,
            SemanticObject : 'Booksv2',
            Action : 'manage'
        }
        //{   $Type : 'UI.DataField', Value : bookID_bookUUID }
        ]},
        FieldGroup #Details1 : {Data : [
        {   $Type : 'UI.DataField', Value : bookingID },
        {   $Type : 'UI.DataField', Value : bookingStatus_ID, Criticality: bookingStatus.criticality },
        ]},
        FieldGroup #Details4 : {Data : [
        {   $Type : 'UI.DataField', Value : beginDate },
        {   $Type : 'UI.DataField', Value : beginTime },
        {   $Type : 'UI.DataField', Value : endDate },
        {   $Type : 'UI.DataField', Value : endTime },
        ]},
        FieldGroup #AdministrativeData : {Data : [
        {  $Type : 'UI.DataField',  Value : createdBy },
        {  $Type : 'UI.DataField',  Value : createdAt },
        {  $Type : 'UI.DataField',  Value : modifiedBy },
        {  $Type : 'UI.DataField',  Value : modifiedAt }
        ]}
        },
     UI.Facets : [
    {
        $Type  : 'UI.CollectionFacet',
        ID     : 'PODetails',
        Label  : '{i18n>bookinginfo}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>bookingInfo}',
            Target : '@UI.FieldGroup#Details1'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>reader}',
            Target : '@UI.FieldGroup#Details2'
        },
         {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>book}',
            Target : '@UI.FieldGroup#Details3'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>shedule}',
            Target : '@UI.FieldGroup#Details4'
        }
        ]
    },
      {
        $Type  : 'UI.CollectionFacet',
        ID     : 'POAdmininfo',
        Label  : '{i18n>adminInfo}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>adminInfo}',
            Target : '@UI.FieldGroup#AdministrativeData'
        }
        ]
    }
    ]
  
);

annotate service.Booking actions {
    @(
        Common.SideEffects : {
            TargetEntities : [
                _it,
            ]
        },
        cds.odata.bindingparameter.name: '_it',
        Core.OperationAvailable : _it.returnTheBookEnabled,
        UI.FieldGroup
    )
    returnTheBook(
        returnTheBook @title : 'Return The Book'
    );
}
