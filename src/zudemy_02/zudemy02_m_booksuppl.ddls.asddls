@AbapCatalog.sqlViewName: 'ZUDEMY01BOOKSUPP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entity for Booking Suppliment for Managed Scenario'
define view ZUDEMY02_M_BOOKSUPPL
  as select from /dmo/booksuppl_m as Booksuppl
  association        to parent ZUDEMY02_M_BOOKING as _Booking        on  $projection.BookingId = _Booking.BookingId
                                                                     and $projection.TravelId  = _Booking.TravelId
  association [1..1] to ZUDEMY02_M_TRAVEL         as _Travel         on  $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Supplement         as _Product        on  $projection.SupplementId = _Product.SupplementID
  association [1..1] to /DMO/I_SupplementText     as _SupplementText on  $projection.SupplementId = _SupplementText.SupplementID
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      @Semantics.currencyCode: true
      currency_code         as CurrencyCode,
      last_changed_at       as LastChangedAt,
      _Travel.LastChangedAt as last_changed_at, -- for etag purpose
      _Booking,
      _Product,
      _SupplementText
}
