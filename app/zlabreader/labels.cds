using {epam.sap.dev.library as library  } from '../../db/schema';


annotate library.Readers with @title: '{i18n>readerTitle}' {
  readerUUID   @UI.Hidden;
  readerID     @title: '{i18n>readerID}';
  firstName @title : '{i18n>firstName}';
  lastName @title : '{i18n>lastName}';
  readerBithday @title : '{i18n>birthday}';
  phonenumber @title : '{i18n>phone}';
}