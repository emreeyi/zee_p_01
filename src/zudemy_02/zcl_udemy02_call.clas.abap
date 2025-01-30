CLASS zcl_udemy02_call DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_udemy02_call IMPLEMENTATION.
 METHOD if_oo_adt_classrun~main.
        data: lv_price type f,
              lv_price_dis type f.

        try.
            zcl_udemy02_sqlscript=>getproddata(
              EXPORTING
* p_id will be different in different systems, get the product ID number from ZUDEMY01_PRODUCT table and paste it in the next line
                p_id         = '3'
              IMPORTING
                ev_price     = lv_price
                ev_price_dis = lv_price_dis
            ).
          catch CX_AMDP_EXECUTION_FAILED into data(lo_ex).
            data(lv_msg) = lo_ex->get_text(  ).
            out->write(
              EXPORTING
                data   = lv_msg
*                name   =
*              RECEIVING
*                output =
            ).
          endtry.

        out->write(
          EXPORTING
            data   = | 'Your discounted and actual price is ' { lv_price_dis } { lv_price } |
*            name   =
*          RECEIVING
*            output =
        ).
    ENDMETHOD.
ENDCLASS.
