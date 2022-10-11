using LibraryService from '../../srv/services';

annotate LibraryService.Booking with {
    bookingID @readonly;
    readerID @mandatory;
    bookID @mandatory;
    bookingStatus @readonly;
    beginDate @readonly;
    beginTime @readonly;
    endDate @readonly;
    endTime @readonly;
};



