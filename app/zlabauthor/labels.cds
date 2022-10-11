using {epam.sap.dev.library as library  } from '../../db/schema';


annotate library.Authors with @title: '{i18n>authorTitle}' {
  authorUUID   @UI.Hidden;
  authorID     @title: '{i18n>authorID}';
  firstName @title : '{i18n>authorFirstName}';
  lastName @title : '{i18n>authorLastName}';
  birthday @title : '{i18n>birthday}';
  country @title : '{i18n>country}';
}