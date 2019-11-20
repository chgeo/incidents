using { IncidentsService, acme.cloud } from './incidents';
using { sap.common } from '@sap/cds/common';


annotate IncidentsService.Incidents with @(
  UI: {
    SelectionFields: [ title, category_code, priority_code, createdBy ],
    LineItem: [
      {$Type: 'UI.DataField', Value: title},
      {$Type: 'UI.DataField', Value: "priority/name"},
      {$Type: 'UI.DataField', Value: "category/name"},
    ],
    Identifiction: [ {Value:title} ],
    HeaderInfo: {
      Title: { Value: title },
      Description: { Value: title },
      TypeName: 'Incident',
      TypeNamePlural: 'Incidents'
    },
    Facets: [
      {$Type: 'UI.ReferenceFacet', Label: '{i18n>Header}', Target: '@UI.FieldGroup#Header'},
      {$Type: 'UI.ReferenceFacet', Label: '{i18n>Details}', Target: '@UI.FieldGroup#Descr'},
    ],
    FieldGroup#Header: {
      Data: [
        {Value: priority_code}, {Value: category_code},
        {Value: createdBy},{Value: createdAt}, {Value: modifiedBy},{Value: modifiedAt}
      ]
    },
    FieldGroup#Descr: {
      Data: [{ Value: title }, {Value: description}]
    }
  }
);

annotate IncidentsService.Incidents with {
  description @UI.MultiLineText;
};

annotate cloud.IncidentsCodeList with { code @UI.HiddenFilter; };

annotate IncidentsService.Category with {
  name @title: 'Category';
};

annotate IncidentsService.Priority with {
  name @title: 'Priority';
};
