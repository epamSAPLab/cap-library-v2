using LibraryService from '../../srv/services';


annotate LibraryService.Books with {
    bookID @readonly;
    toAuthor @mandatory;
    bookName @mandatory;
    copyQty @mandatory;
    price @mandatory;
    CurrencyCode @mandatory;
    status @readonly;
};



