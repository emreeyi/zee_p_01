@AbapCatalog.sqlViewName: 'Z02SALHD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'sales header with BP'
@Metadata.ignorePropagatedAnnotations: true
define view zudemy_02_i_saleshdr
  as select from zudemy02_so
  association [1] to zudemy02_bp as _bp on 
  $projection.Buyer = _bp.bp_id
{
  key zudemy02_so.order_id     as OrderId,
      zudemy02_so.order_no     as OrderNo,
      zudemy02_so.buyer        as Buyer,
      zudemy02_so.gross_amount as GrossAmount,
      zudemy02_so.currency     as Currency,
      _bp
}
