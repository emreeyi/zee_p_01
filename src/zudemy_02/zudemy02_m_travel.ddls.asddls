@AbapCatalog.sqlViewName: 'ZUDEMY01MTRAVEL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel view for composition root'
define root view ZUDEMY02_M_TRAVEL
  as select from /dmo/travel_m Travel
  composition [1..*] of ZUDEMY02_M_BOOKING  as _Booking
  association [1] to ZUDEMY02_I_U_AGENCY    as _Agency   on $projection.AgencyId = _Agency.AgencyId
  association [1] to ZUDEMY02_I_U_CUSTOMER as _Customer on $projection.CustomerId = _Customer.CustomerId
  association [1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
{
  key Travel.travel_id       as TravelId,
      Travel.agency_id       as AgencyId,
      Travel.customer_id     as CustomerId,
      Travel.begin_date      as BeginDate,
      Travel.end_date        as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Travel.booking_fee     as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Travel.total_price     as TotalPrice,
      @Semantics.currencyCode: true
      Travel.currency_code   as CurrencyCode,
      Travel.description     as Description,
      Travel.overall_status  as OverallStatus,
      @Semantics.user.createdBy: true
      Travel.created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      Travel.created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      Travel.last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      Travel.last_changed_at as LastChangedAt, -- used for etag
      _Booking,
      _Agency,
      _Customer,
      _Currency
}
