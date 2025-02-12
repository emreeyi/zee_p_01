CLASS lhc_ZUDEMY02_C_U_TRAVEL DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zudemy02_c_u_travel RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zudemy02_c_u_travel.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zudemy02_c_u_travel.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zudemy02_c_u_travel.

    METHODS read FOR READ
      IMPORTING keys FOR READ zudemy02_c_u_travel RESULT result.

    METHODS set_booked FOR MODIFY IMPORTING keys FOR ACTION
    zudemy02_c_u_travel~set_booked RESULT results.


    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zudemy02_c_u_travel.

    METHODS map_data IMPORTING im_data            TYPE zudemy02_c_u_travel
                     RETURNING VALUE(r_bapi_data) TYPE /dmo/s_travel_in.

ENDCLASS.

CLASS lhc_ZUDEMY02_C_U_TRAVEL IMPLEMENTATION.

  METHOD map_data.

    r_bapi_data-agency_id = im_data-AgencyId .
    r_bapi_data-begin_date = im_data-BeginDate .
    r_bapi_data-booking_fee = im_data-BookingFee .
    r_bapi_data-currency_code = im_data-CurrencyCode .
    r_bapi_data-customer_id = im_data-CustomerId .
    r_bapi_data-description = im_data-Description .
    r_bapi_data-end_date = im_data-EndDate .
    r_bapi_data-status = im_data-Status .
    r_bapi_data-total_price = im_data-TotalPrice .

  ENDMETHOD.

  METHOD set_booked.
    DATA: ls_travel_in TYPE /dmo/s_travel_in,
          ls_travel_x  TYPE /dmo/s_travel_inx,
          lt_messages  TYPE /dmo/t_message.
    LOOP AT keys ASSIGNING FIELD-SYMBOL(<status_b>).
      ls_travel_in = map_data( im_data = CORRESPONDING #( <status_b> ) ).
* Update status to B (Booked)
      ls_travel_in-status = 'B'.
* ls_travel_x  structure should be filled with respective %control field values
      CLEAR: ls_travel_x-agency_id,
             ls_travel_x-begin_date ,
             ls_travel_x-booking_fee ,
             ls_travel_x-currency_code,
             ls_travel_x-customer_id,
             ls_travel_x-description ,
             ls_travel_x-end_date ,
             ls_travel_x-total_price.
      ls_travel_x-status = 'X'.

      ls_travel_in-travel_id = <status_b>-TravelId.
      ls_travel_x-travel_id = <status_b>-TravelId.
      CALL FUNCTION '/DMO/FLIGHT_TRAVEL_UPDATE'
        EXPORTING
          is_travel   = ls_travel_in
          is_travelx  = ls_travel_x
*         it_booking  =
*         it_bookingx =
*         it_booking_supplement  =
*         it_booking_supplementx =
        IMPORTING
*         es_travel   =
*         et_booking  =
*         et_booking_supplement  =
          et_messages = lt_messages.
      LOOP AT lt_messages TRANSPORTING NO FIELDS WHERE msgty = 'E' OR msgty = 'A'.
        INSERT VALUE #( %cid = <status_b>-%cid_ref travelid = <status_b>-TravelId ) INTO TABLE failed-zudemy02_c_u_travel.
        RETURN.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
    DATA: ls_travel_in  TYPE /dmo/s_travel_in,
          ls_travel_out TYPE /dmo/travel,
          lt_messages   TYPE /dmo/t_message.
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_travel_create>).
      ls_travel_in = map_data( im_data = CORRESPONDING #( <fs_travel_create> ) ).
      CALL FUNCTION '/DMO/FLIGHT_TRAVEL_CREATE'
        EXPORTING
          is_travel   = ls_travel_in
        IMPORTING
          es_travel   = ls_travel_out
          et_messages = lt_messages.
      IF lt_messages IS INITIAL.
        INSERT VALUE #( %cid = <fs_travel_create>-%cid
                        travelid = ls_travel_out-travel_id )
                      INTO TABLE mapped-zudemy02_c_u_travel.
      ELSE.
        LOOP AT lt_messages TRANSPORTING NO FIELDS WHERE msgty = 'E' OR msgty = 'A'.
          INSERT VALUE #( %cid = <fs_travel_create>-%cid ) INTO TABLE failed-zudemy02_c_u_travel.
          RETURN.
        ENDLOOP.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD update.
    DATA: ls_travel_in TYPE /dmo/s_travel_in,
          ls_travel_x  TYPE /dmo/s_travel_inx,
          lt_messages  TYPE /dmo/t_message.
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<to_be_updated>).
      ls_travel_in = map_data( im_data = CORRESPONDING #( <to_be_updated> ) ).

* ls_travel_x  structure should be filled with respective %control field values
      ls_travel_x-agency_id = xsdbool( <to_be_updated>-%control-AgencyId = cl_abap_behv=>flag_changed ).
      ls_travel_x-begin_date = xsdbool( <to_be_updated>-%control-BeginDate = cl_abap_behv=>flag_changed ).
      ls_travel_x-booking_fee = xsdbool( <to_be_updated>-%control-BookingFee = cl_abap_behv=>flag_changed ).
      ls_travel_x-currency_code = xsdbool( <to_be_updated>-%control-CurrencyCode = cl_abap_behv=>flag_changed ).
      ls_travel_x-customer_id = xsdbool( <to_be_updated>-%control-CustomerId = cl_abap_behv=>flag_changed ).
      ls_travel_x-description = xsdbool( <to_be_updated>-%control-Description = cl_abap_behv=>flag_changed ).
      ls_travel_x-end_date = xsdbool( <to_be_updated>-%control-EndDate = cl_abap_behv=>flag_changed ).
      ls_travel_x-status = xsdbool( <to_be_updated>-%control-Status = cl_abap_behv=>flag_changed ).
      ls_travel_x-total_price = xsdbool( <to_be_updated>-%control-TotalPrice = cl_abap_behv=>flag_changed ).

      ls_travel_in-travel_id = <to_be_updated>-TravelId.
      ls_travel_x-travel_id = <to_be_updated>-TravelId.
      CALL FUNCTION '/DMO/FLIGHT_TRAVEL_UPDATE'
        EXPORTING
          is_travel   = ls_travel_in
          is_travelx  = ls_travel_x
*         it_booking  =
*         it_bookingx =
*         it_booking_supplement  =
*         it_booking_supplementx =
        IMPORTING
*         es_travel   =
*         et_booking  =
*         et_booking_supplement  =
          et_messages = lt_messages.
      LOOP AT lt_messages TRANSPORTING NO FIELDS WHERE msgty = 'E' OR msgty = 'A'.
        INSERT VALUE #( %cid = <to_be_updated>-%cid_ref travelid = <to_be_updated>-TravelId ) INTO TABLE failed-zudemy02_c_u_travel.
        RETURN.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

  METHOD delete.
    DATA: lt_messages  TYPE /dmo/t_message,
          lv_travel_id TYPE /dmo/travel_id.
    LOOP AT keys ASSIGNING FIELD-SYMBOL(<to_be_deleted>).
      lv_travel_id = <to_be_deleted>-TravelId.
      CALL FUNCTION '/DMO/FLIGHT_TRAVEL_DELETE'
        EXPORTING
          iv_travel_id = lv_travel_id
        IMPORTING
          et_messages  = lt_messages.
      LOOP AT lt_messages TRANSPORTING NO FIELDS WHERE msgty = 'E' OR msgty = 'A'.
        INSERT VALUE #( %cid = <to_be_deleted>-%cid_ref travelid = <to_be_deleted>-TravelId ) INTO TABLE failed-zudemy02_c_u_travel.
        RETURN.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZUDEMY02_C_U_TRAVEL DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZUDEMY02_C_U_TRAVEL IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
    CALL FUNCTION '/DMO/FLIGHT_TRAVEL_SAVE'.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
