using LibraryService as service from '../../srv/services';

annotate service.Readers with @(
     UI: {
 SelectionFields: [readerBithday],
 LineItem: [
     { $Type : 'UI.DataField', Value : readerID, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: firstName, ![@UI.Importance]: #High },  
     { $Type : 'UI.DataField', Value: lastName, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: readerBithday, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: phonenumber, ![@UI.Importance]: #High }
 ],
 PresentationVariant : {SortOrder : [   
        {   $Type      : 'Common.SortOrderType', Property   : readerID, Descending : false }
        ]},
    },
     UI        : {
        HeaderInfo : {
            TypeName       : 'Reader',
            TypeNamePlural : 'Readers',
            Title          : {Value : firstName},
            Description : {Value:lastName}
        },
        HeaderFacets : [
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #High
        }],
        FieldGroup #Description        : {Data : [
        {   $Type : 'UI.DataField', Value: image},
        {   $Type : 'UI.DataField', Value : readerBithday },
        {   $Type : 'UI.DataField', Value : phonenumber },
         ]},
        FieldGroup #Details        : {Data : [
        {   $Type : 'UI.DataField', Value : readerID },   
        {   $Type : 'UI.DataField', Value : firstName },
        {   $Type : 'UI.DataField', Value : lastName },
        {   $Type : 'UI.DataField', Value : readerBithday },
        {   $Type : 'UI.DataField', Value : phonenumber }
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