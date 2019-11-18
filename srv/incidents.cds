using acme.cloud from '../db/schema';

service IncidentsService {

  entity Incidents as projection on cloud.Incidents;

  @readonly entity Category as projection on cloud.Category;
  @readonly entity Priority as projection on cloud.Priority;
  @readonly entity Employees as projection on cloud.Employees;

}
