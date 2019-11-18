using { IncidentsService } from './incidents';
using { sap.common } from '@sap/cds/common';


annotate IncidentsService.Incidents with @(
  UI: {
    SelectionFields: [ title, category_code, priority_code, createdBy ],
    LineItem: [
      {$Type: 'UI.DataField', Value: title},
      {$Type: 'UI.DataField', Value: "priority/name"},
      {$Type: 'UI.DataField', Value: "category/name"},
    ],
    HeaderInfo: {
      Title: { Value: title },
      Description: { Value: title },
      TypeName: 'Incident',
      TypeNamePlural: 'Incidents'
    },
    Facets: [
      {$Type: 'UI.ReferenceFacet', Label: '{i18n>Misc}', Target: '@UI.FieldGroup#Misc'},
      {$Type: 'UI.ReferenceFacet', Label: '{i18n>Details}', Target: '@UI.FieldGroup#Descr'},
    ],
    FieldGroup#Misc: {
      Data: [
        {Value: priority.name}, {Value: category.name},
        {Value: createdBy},{Value: createdAt}, {Value: modifiedBy},{Value: modifiedAt}
      ]
    },
    FieldGroup#Descr: {
      Data: [{Value: description}]
    }
  }
);

annotate common.CodeList with { code @UI.HiddenFilter; };

annotate IncidentsService.Category with {
  name @title: 'Category';
};

annotate IncidentsService.Priority with {
  name @title: 'Priority';
};
