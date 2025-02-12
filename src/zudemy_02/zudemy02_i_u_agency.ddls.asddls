@AbapCatalog.sqlViewName: 'ZUDEMY01IUAGEN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unmanaged Scenario Base CDS - Agency Data'
define view ZUDEMY02_I_U_AGENCY
  as select from /dmo/agency
  association [1] to I_Country as _country on $projection.CountryCode = _country.Country
{
  key /dmo/agency.agency_id     as AgencyId,
      @Semantics.text: true
      /dmo/agency.name          as Name,
      /dmo/agency.street        as Street,
      /dmo/agency.postal_code   as PostalCode,
      /dmo/agency.city          as City,
      /dmo/agency.country_code  as CountryCode,
      /dmo/agency.phone_number  as PhoneNumber,
      /dmo/agency.email_address as EmailAddress,
      /dmo/agency.web_address   as WebAddress,
      _country // Make association public
}
