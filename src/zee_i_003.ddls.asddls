//@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity zee_i_003
  as select from zee_t_03
{
  key matnr   as Matnr,
      name    as Name,
      surname as Surname,
      @Semantics.quantity.unitOfMeasure : 'meins'
      menge   as Menge,
      meins   as Meins
}
