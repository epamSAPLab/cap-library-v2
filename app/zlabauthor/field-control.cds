using LibraryService from '../../srv/services';

annotate LibraryService.Authors with {
    authorID @readonly;
    firstName @mandatory;
    lastName @mandatory;
};



