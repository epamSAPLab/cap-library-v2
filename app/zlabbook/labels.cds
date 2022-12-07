using {epam.sap.dev.library as library} from '../../db/schema';

annotate library.Books with @title : '{i18n>bookTitle}' {
    bookUUID      @UI.Hidden                              @Common.Text          : bookName             @Common.TextArrangement : #TextOnly;
    bookID        @title           : '{i18n>bookID}';
    bookName      @title           : '{i18n>bookName}';
    toAuthor      @title           : '{i18n>AuthorName}'  @Common.Text          : toAuthor.lastName    @Common.TextArrangement : #TextOnly;
    pageNumber    @title           : '{i18n>pages}';
    copyQty       @title           : '{i18n>copies}';
    requestedQty  @title           : '{i18n>requestedQuantity}';
    price         @title           : '{i18n>price}'       @Measures.ISOCurrency : CurrencyCode_code;
    status        @title           : '{i18n>bookstatus}'  @Common.Text          : status.name          @Common.TextArrangement : #TextFirst;
    CurrencyCode  @title           : '{i18n>currency}'    @Common.Text          : CurrencyCode.symbol  @Common.TextArrangement : #TextLast;
    supplier      @(
        title                           : '{i18n>supplier}',
        Common.Text                     : supplier.fullName,
        Common.TextArrangement          : #TextOnly,
        Common.ValueListWithFixedValues : true,
    );
}

annotate library.Suppliers with {
    isBlocked @title : 'Supplier Blocked';
    ID        @(
        title       : 'ID',
        Common.Text : fullName
    );
    fullName  @title : 'Name';
};
