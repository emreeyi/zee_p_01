@EndUserText.label: 'Veritabanı Tablosu Singleton'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.semanticKey: [ 'SingletonID' ]
@UI: {
  headerInfo: {
    typeName: 'VeritabanTablosuAll'
  }
}
define root view entity ZEE_005_IS_01
  as select from I_Language
    left outer join I_CstmBizConfignLastChgd on I_CstmBizConfignLastChgd.ViewEntityName = 'ZEE_005_I_01'
  composition [0..*] of ZEE_005_I_01 as _VeritabanTablosu
{
  @UI.facet: [ {
    id: 'ZEE_005_I_01', 
    purpose: #STANDARD, 
    type: #LINEITEM_REFERENCE, 
    label: 'Veritabanı Tablosu', 
    position: 1 , 
    targetElement: '_VeritabanTablosu'
  } ]
  @UI.lineItem: [ {
    position: 1 
  } ]
  key 1 as SingletonID,
  _VeritabanTablosu,
  @UI.hidden: true
  I_CstmBizConfignLastChgd.LastChangedDateTime as LastChangedAtMax
  
}
where I_Language.Language = $session.system_language
