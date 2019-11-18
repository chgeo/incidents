using acme.cloud from '../db/schema';

service IncidentsService {

  entity Incidents as projection on cloud.Incidents;

  @readonly entity Employees as projection on cloud.Employees;

}
