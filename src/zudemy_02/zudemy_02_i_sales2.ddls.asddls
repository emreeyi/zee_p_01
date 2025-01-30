@AbapCatalog.sqlViewName: 'Z02SAL2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales composite view'
@Metadata.ignorePropagatedAnnotations: true
define view ZUDEMY_02_I_SALES2
  with parameters
    p_reg :abap.char(3)
  as select from zudemy02_so_i
  association [1] to ZUDEMY_02_P_PROD2    as _products    on $projection.Product = _products.ProductId
  association [1] to zudemy_02_i_saleshdr as _salesHeader on $projection.OrderId = _salesHeader.OrderId
{
  key item_id                 as ItemId,
      order_id                as OrderId,
      product                 as Product,
      qty                     as Qty,
      uom                     as Uom,
      amount                  as Amount,
      currency                as Currency,
      _salesHeader._bp.region as region,
      _products.Name          as ProductName,
      _products.Category      as ProductCategory,
      _salesHeader
}
where
  _salesHeader._bp.region = $parameters.p_reg
