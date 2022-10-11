using {LibraryService} from '../../srv/services';

annotate LibraryService.Readers with @odata.draft.enabled;

annotate LibraryService.Readers with @(
    Capabilities                    : {
        Deletable  : true,
        Insertable : true
    },
    Capabilities.FilterRestrictions : {FilterExpressionRestrictions : [{
        Property           : 'readerBithday',
        AllowedExpressions : 'SingleValue'
    }]}
);
