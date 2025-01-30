@AbapCatalog.sqlViewName: 'Z02CSALE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Category Sales Per region'
@Metadata.ignorePropagatedAnnotations: true
define view zudemy_02_c_catsales
  as select from ZUDEMY_02_I_SALES2( p_reg: 'NA' )
{
  key ProductCategory,
  key Currency,
      sum(Amount) as TotalSales

}
group by
  ProductCategory,
  Currency
