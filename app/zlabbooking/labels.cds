using {epam.sap.dev.library as library} from '../../db/schema';

annotate library.Booking with @title : '{i18n>bookingTitle}' {
  bookingUUID    @UI.Hidden;
  bookingID      @title              : '{i18n>bookingID}';
  bookingStatus  @title              : '{i18n>status}'  @Common.Text : bookingStatus.name  @Common.TextArrangement : #TextFirst;
  beginDate      @title              : '{i18n>beginDate}';
  endDate        @title              : '{i18n>endDate}';
  beginTime      @title              : '{i18n>beginTime}';
  endTime        @title              : '{i18n>endTime}';
  readerID       @title              : '{i18n>reader}'  @Common.Text : readerID.lastName   @Common.TextArrangement : #TextOnly;
  bookID         @title              : '{i18n>book}'    @Common.Text : bookID.bookName     @Common.TextArrangement : #TextOnly;
}
