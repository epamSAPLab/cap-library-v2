using LibraryService from '../../srv/services';


annotate LibraryService.Readers with {
    readerID @readonly;
    firstName @mandatory;
    lastName @mandatory;
};



