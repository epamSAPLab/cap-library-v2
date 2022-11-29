using LibraryService as service from '../../srv/services';

annotate service.Authors with @(
     UI: {
 SelectionFields: [birthday],
 LineItem: [
     { $Type : 'UI.DataField', Value : authorID, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: firstName, ![@UI.Importance]: #High },  
     { $Type : 'UI.DataField', Value: lastName, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: birthday, ![@UI.Importance]: #High },
     { $Type : 'UI.DataField', Value: country, ![@UI.Importance]: #High }
 ],
 PresentationVariant : {SortOrder : [   
        {   $Type      : 'Common.SortOrderType', Property   : authorID, Descending : false }
        ]},
    },
     UI        : {
        HeaderInfo : {
            TypeName       : 'Author',
            TypeNamePlural : 'Authors',
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
        {   $Type : 'UI.DataField', Value : birthday },
        {   $Type : 'UI.DataField', Value : country },
         ]},
        FieldGroup #Details        : {Data : [
        {   $Type : 'UI.DataField', Value : authorID },   
        {   $Type : 'UI.DataField', Value : firstName },
        {   $Type : 'UI.DataField', Value : lastName },
        {   $Type : 'UI.DataField', Value : birthday },
        {   $Type : 'UI.DataField', Value : country }
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
        }]
      }
      ,
      {
          $Type : 'UI.ReferenceFacet',
          Label : '{i18n>bookInfo}',
          Target : 'book/@UI.LineItem'
      }
    //   ,
    //     {
    //     $Type  : 'UI.ReferenceFacet',
    //     Label  : '{i18n>bookInfo}',
    //     Target : 'book/toAuthor/@UI.LineItem'
    // }
    ]
  
);