using LibraryService as service from '../../srv/services';

annotate service.Books with @(
     UI: {
 SelectionFields: [toAuthor_authorUUID],
 Identification  : [ {Value: bookUUID},
   { $Type  : 'UI.DataFieldForAction', Action : 'LibraryService.orderBook',   Label  : '{i18n>orderBook}'},
 ],
 LineItem: [
     //{ $Type  : 'UI.DataFieldForAction', Action : 'LibraryService.orderBook',   Label  : '{i18n>orderBook}'},
     { $Type : 'UI.DataField', Value : bookID, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value : status_ID,Criticality: status.criticality, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: bookName, ![@UI.Importance]: #High },  
     { $Type : 'UI.DataField', Value: toAuthor.firstName, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: toAuthor.lastName, ![@UI.Importance]: #High },
     {$Type : 'UI.DataField', Value: pageNumber, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: copyQty, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: price, ![@UI.Importance]: #High }
     ],
 PresentationVariant : {SortOrder : [   
        {   $Type      : 'Common.SortOrderType', Property   : bookID, Descending : false }
        ]},
    },
     UI        : {
        HeaderInfo : {
            TypeName       : 'Book',
            TypeNamePlural : 'Books',
            Title          : {Value : bookName},
            Description : {Value:toAuthor.lastName}
        },
        HeaderFacets : [
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #High
        }],
        FieldGroup #Description        : {Data : [
        {   $Type : 'UI.DataField', Value: image},
        {   $Type : 'UI.DataField', Value : copyQty },
        {   $Type : 'UI.DataField', Value : pageNumber },
         ]},
        FieldGroup #Details        : {Data : [
        {   $Type : 'UI.DataField', Value : bookID },  
         {   $Type : 'UI.DataField', Value : status_ID, Criticality: status.criticality },  
        {   $Type : 'UI.DataField', Value : bookName },
        {   $Type : 'UI.DataField', Value : toAuthor_authorUUID },
        {   $Type : 'UI.DataField', Value : pageNumber },
        {   $Type : 'UI.DataField', Value : copyQty },
        {   $Type : 'UI.DataField', Value : price }
        // ,
        // {   $Type : 'UI.DataField', Value : requestedQty },
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
        Label  : '{i18n>readerInfo}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>readerinfo}',
            Target : '@UI.FieldGroup#Details'
        }
        ]
    },
      {
        $Type  : 'UI.CollectionFacet',
        ID     : 'POAdmininfo',
        Label  : '{i18n>adminInfo}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>admininfo}',
            Target : '@UI.FieldGroup#AdministrativeData'
        }
        ]
    }
    ]
  
);

annotate service.Books actions {
    @(
        Common.SideEffects : {
            TargetEntities : [
                _it,
            ]
        },
        cds.odata.bindingparameter.name: '_it',
        Core.OperationAvailable : _it.orderBookEnabled,
        UI.FieldGroup
    )
    orderBook(
        orderBook @title : 'Order Book'
    );
}