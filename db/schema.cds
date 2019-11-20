namespace acme.cloud;

using {
  managed,
  sap.common
} from '@sap/cds/common';

entity Incidents : managed {
  key ID               : UUID                    @title : 'Incident number';
      title            : String(50)              @title : 'Title';
      category         : Association to Category @title : 'Category';
      priority         : Association to Priority @title : 'Priority';
      description      : String(1000)            @title : 'Description';
      assignedEmployee : Association to Employees;
}

entity Employees {
  key ID        : UUID;
      firstName : String(100);
      lastName  : String(100);
      email     : String(100);
      incident  : Association to many Incidents on incident.assignedEmployee = $self;
}

entity IncidentsCodeList : common.CodeList {
  key code : String(20);
}

entity Category : IncidentsCodeList {}
entity Priority : IncidentsCodeList {}