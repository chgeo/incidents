using { IncidentsService, acme.cloud.IncidentsCodeList } from './incidents';
using { sap.common } from '@sap/cds/common';

// annotation for the Incidents entity itself
annotate IncidentsService.Incidents with @(
  UI: {
    // --- for the list page ---
    SelectionFields: [ title, category_code, priority_code, createdBy ], // selection bar
    LineItem: [ // table columns
      {$Type: 'UI.DataField', Value: title},
      {$Type: 'UI.DataField', Value: "priority/name"},
      {$Type: 'UI.DataField', Value: "category/name"},
      {$Type: 'UI.DataField', Value: "createdBy"},
      {$Type: 'UI.DataField', Value: "modifiedAt"},

    ],
    // --- for the details page ---
    HeaderInfo: {
      Title: { Value: title },
      Description: { Value: title },
      TypeName: 'Incident',
      TypeNamePlural: 'Incidents'
    },
    Facets: [ // facets are for grouping controls
      {$Type: 'UI.ReferenceFacet', Label: '{i18n>Header}',  Target: '@UI.FieldGroup#Header'},
      {$Type: 'UI.ReferenceFacet', Label: '{i18n>Details}', Target: '@UI.FieldGroup#Descr'},
    ],
    FieldGroup#Header: { // header group
      Data: [
        {Value: priority_code}, {Value: category_code},
        {Value: createdBy}, {Value: createdAt}, {Value: modifiedBy}, {Value: modifiedAt}
      ]
    },
    FieldGroup#Descr: { // description group
      Data: [{ Value: title }, {Value: description}]
    }
  }
);

// annotation for the Incidents' elements
annotate IncidentsService.Incidents with {
  description  @UI.MultiLineText;
  // only show the name in texts, not the technical code
  priority     @Common.Text: "priority/name" @Common.TextArrangement: #TextOnly;
  category     @Common.Text: "category/name" @Common.TextArrangement: #TextOnly;
  createdBy    @title: 'Reported by';
  modifiedAt   @title: 'Last changed at';
};

// applies to all our code lists
annotate IncidentsCodeList with { code @UI.HiddenFilter; }; // suppress technical code in filter UIs

// individual code lists
annotate IncidentsService.Category with { name @title: 'Category'; };
annotate IncidentsService.Priority with { name @title: 'Priority'; };
