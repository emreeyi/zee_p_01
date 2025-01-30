CLASS zee_cl_003 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZEE_CL_003 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_itab TYPE TABLE OF zee_t_03.

    DELETE FROM zee_t_03.
**    SELECT SINGLE @abap_true
**     FROM zee_t_03
**     INTO @DATA(lv_tbl_1_check).
*
    IF sy-subrc EQ 0.
      lt_itab = VALUE #(
                            ( matnr = '1' name = 'Emre'    surname = 'Eyi'    menge = 40  meins = 'KG' )
                            ( matnr = '2' name = 'Betül'   surname = 'Aksu'   menge = 50  meins = 'KG' )
                            ( matnr = '3' name = 'Doğukan' surname = 'Padel'  menge = 60  meins = 'KG' )
                            ( matnr = '4' name = 'Emre'    surname = 'Toplar' menge = 60  meins = 'KG' )
      ).
*
      INSERT zee_t_03 FROM TABLE @lt_itab.
*    IF sy-subrc EQ 0.
      out->write( 'zee_t_03 tablosuna veri eklendi' ).
    ENDIF.
*    ENDIF.

  ENDMETHOD.
ENDCLASS.
