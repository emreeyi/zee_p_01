@AbapCatalog.sqlViewName: 'ZPPROD2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Private view for product'
@Metadata.ignorePropagatedAnnotations: true
define view ZUDEMY_02_P_PROD2
  as select from zudemy02_product
{
  key product_id as ProductId,
      name       as Name,
      category   as Category,
      price      as Price,
      currency   as Currency,
      discount   as Discount
}
