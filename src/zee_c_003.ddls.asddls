@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}


@UI:{
     headerInfo:{
                 typeName: 'Material',
                 typeNamePlural: 'Materials',
                 title:{ type: #STANDARD, value: 'matnr' }
                }
    }


define root view entity zee_c_003
  as projection on zee_i_003
{
      @UI.facet: [{ id: 'Id', purpose: #STANDARD, type: #IDENTIFICATION_REFERENCE, label: 'CREATE', position: 10  }]

      @UI: {
      //      Ana Ekrandaki Görünüm
          lineItem: [{ position: 10, label: 'MATNR', importance: #HIGH }],
      //      Detay Ekranındaki Görünüm
          identification: [{ position: 10, label: 'matnr'  }],
      //      Filtre Görünümü
          selectionField: [{ position: 10 }]
      }

  key Matnr,
      @UI:{
            lineItem: [{ position: 20, label: 'İsim (lineItem)', importance: #HIGH }],
            identification: [{ position: 20, label: 'İsim (identification)'  }],
            selectionField: [{ position: 20 }]
        }
      Name,

      @UI:{
      lineItem: [{ position: 30, label: 'Soyisim (lineItem)', importance: #HIGH }],
      identification: [{ position: 30, label: 'Soyisim (identification)'  }],
      selectionField: [{ position: 30 }]
      }
      Surname,

      @UI:{
      lineItem: [{ position: 40, label: 'MENGE', importance: #HIGH }],
      identification: [{ position: 40, label: 'menge'  }],
      selectionField: [{ position: 40 }]
      }
      @Semantics.quantity.unitOfMeasure: 'Meins'
      Menge,

      @UI:{
      lineItem: [{ position: 50, label: 'MEINS', importance: #HIGH }],
      identification: [{ position: 50, label: 'MEINS'  }],
      selectionField: [{ position: 50 }]
      }
      Meins

}
