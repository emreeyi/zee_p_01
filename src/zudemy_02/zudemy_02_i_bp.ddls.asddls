@AbapCatalog.sqlViewName: 'Z01IBP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View for Master Data of Business Partner'
@Metadata.ignorePropagatedAnnotations: true
define view ZUDEMY_02_I_BP
  as select from zudemy02_bp
{
  key bp_id        as BpId,
      bp_role      as BpRole,
      company_name as CompanyName,
      street       as Street,
      city         as City,
      country      as Country,
      region       as Region
}
