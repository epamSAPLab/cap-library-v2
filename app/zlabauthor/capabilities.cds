using {LibraryService} from '../../srv/services';

annotate LibraryService.Authors with @odata.draft.enabled;

annotate LibraryService.Authors with @(
    Capabilities                    : {
        Deletable  : true,
        Insertable : true
    },
    Capabilities.FilterRestrictions : {FilterExpressionRestrictions : [{
        Property           : 'birthday',
        AllowedExpressions : 'SingleValue'
    }]}
);
