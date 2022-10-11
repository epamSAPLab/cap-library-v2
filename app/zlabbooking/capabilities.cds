using {LibraryService} from '../../srv/services';

annotate LibraryService.Booking with @odata.draft.enabled;

annotate LibraryService.Booking with
@(
    Capabilities                    : {
        Deletable  : true,
        Insertable : true
    },
    Capabilities.FilterRestrictions : {FilterExpressionRestrictions : [
        {
            Property           : 'beginDate',
            AllowedExpressions : 'SingleValue'
        },
        {
            Property           : 'endDate',
            AllowedExpressions : 'SingleValue'
        },
        {
            Property           : 'beginTime',
            AllowedExpressions : 'SingleValue'
        },
        {
            Property           : 'endTime',
            AllowedExpressions : 'SingleValue'
        }
    ]}
);
