@EndUserText.label: 'table3'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@Metadata.allowExtensions: true
define view entity ZI_Table3
  as select from zee_t_03
  association to parent ZI_Table3_S as _Table3All on $projection.SingletonID = _Table3All.SingletonID
{
  key matnr   as Matnr,
      name    as Name,
      surname as Surname,
      @Semantics.quantity.unitOfMeasure: 'Meins'
      menge   as Menge,
      meins   as Meins,
      @Consumption.hidden: true
      1       as SingletonID,
      _Table3All

}
