@EndUserText.label: 'Veritabanı Tablosu'
@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
define view entity ZEE_005_I_01
  as select from ZEE_A_005
  association to parent ZEE_005_IS_01 as _VeritabanTablosuAll on $projection.SingletonID = _VeritabanTablosuAll.SingletonID
{
  key ID as Id,
  NAME as Name,
  SURNAME as Surname,
  @Consumption.hidden: true
  1 as SingletonID,
  _VeritabanTablosuAll
  
}
