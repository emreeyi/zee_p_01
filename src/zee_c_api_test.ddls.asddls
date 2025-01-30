@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Api Test'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@UI: {
 headerInfo: { typeName: 'User', typeNamePlural: 'Users', title: { type: #STANDARD, value: 'userid' } } }
 
 
define root view entity zee_c_api_test
  as select from zee_i_api_test
{

 @UI.facet: [ { id:              'User',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'User',
                     position:        10 } ]
    
          @UI: {
          lineItem:       [ { position: 10} ],
          identification: [ { position: 10, label: 'User Id' } ] 
          }
      key UserId,
      
            @UI: {
          lineItem:       [ { position: 20} ],
          identification: [ { position: 20, label: 'Id' } ] 
          }    
      key Id,
      
            @UI: {
          lineItem:       [ { position: 30 } ],
          identification: [ { position: 30, label: 'title' } ] }
      Title,
      
            @UI: {
          lineItem:       [ { position: 40} ],
          identification: [ { position: 40, label: 'body' } ] }
      Body
}
