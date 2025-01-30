CLASS lcl_buffer DEFINITION.
* 1) define the data buffer
  PUBLIC SECTION.

    TYPES: BEGIN OF ty_buffer.
             INCLUDE TYPE   zee_t_03 AS data.
    TYPES:   flag TYPE c LENGTH 1,
           END OF ty_buffer.

    TYPES tt_user TYPE SORTED TABLE OF ty_buffer WITH UNIQUE KEY matnr.

    CLASS-DATA mt_buffer TYPE tt_user.
ENDCLASS.

CLASS lhc_User DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

*    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
*      IMPORTING keys REQUEST requested_authorizations FOR material RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE Material.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Material.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Material.

    METHODS read FOR READ
      IMPORTING keys FOR READ Material RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK Material.
*    METHODS get_instance_features FOR INSTANCE FEATURES
*      IMPORTING keys REQUEST requested_features FOR User RESULT result.


ENDCLASS.

CLASS lhc_User IMPLEMENTATION.


  METHOD create.
    SELECT MAX( matnr ) FROM zee_t_03
    INTO @DATA(lv_max_matnr).


    INSERT  VALUE #(
    matnr = lv_max_matnr + 1

           name    = entities[ 1 ]-name
           surname = entities[ 1 ]-surname
           menge   = entities[ 1 ]-menge
           meins   = entities[ 1 ]-meins

           flag            = 'I'
         )
        INTO TABLE lcl_buffer=>mt_buffer.

  ENDMETHOD.

  METHOD update.

    DATA: ls_zcy_merge_t_1 TYPE zee_t_03.
    IF entities[ 1 ]-name IS NOT INITIAL.
      ls_zcy_merge_t_1-name = entities[ 1 ]-name.
    ENDIF.
    IF entities[ 1 ]-surname IS NOT INITIAL.
      ls_zcy_merge_t_1-surname = entities[ 1 ]-surname.
    ENDIF.
    IF entities[ 1 ]-menge IS NOT INITIAL.
      ls_zcy_merge_t_1-menge = entities[ 1 ]-menge.
    ENDIF.
    IF entities[ 1 ]-meins IS NOT INITIAL.
      ls_zcy_merge_t_1-meins = entities[ 1 ]-meins.
    ENDIF.
.

    INSERT  VALUE #(
           name        = entities[ 1 ]-name
           surname     = entities[ 1 ]-surname
           menge       = entities[ 1 ]-menge
           meins       = entities[ 1 ]-meins
           flag        = 'U'
                )
               INTO TABLE lcl_buffer=>mt_buffer.
  ENDMETHOD.
*
  METHOD delete.

  LOOP AT keys INTO DATA(key).
          INSERT  VALUE #(
           matnr        = key-matnr
           flag            = 'D'
                )
               INTO TABLE lcl_buffer=>mt_buffer.
  ENDLOOP.


  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.



*  METHOD get_instance_features.
*  ENDMETHOD.



ENDCLASS.

CLASS lsc_ZI_ZCY_MERGE_M_01 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_ZCY_MERGE_M_01 IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.

    DATA: lt_data TYPE STANDARD TABLE OF zee_t_03,
          ls_data TYPE zee_t_03,
*          lt_buf  TYPE REF TO lcl_buffer,
          lv_flag TYPE c LENGTH 1.

    TYPES: BEGIN OF ty_buffer.
             INCLUDE TYPE   zee_t_03 AS data.
    TYPES:   flag TYPE c LENGTH 1,
           END OF ty_buffer.
    DATA:  lt_buf  TYPE TABLE OF ty_buffer,
           ls_buf  TYPE ty_buffer.

    lt_data = VALUE #(  FOR row IN lcl_buffer=>mt_buffer (  row-data ) ).
    lt_buf = lcl_buffer=>mt_buffer.

    IF lt_data IS NOT INITIAL.
      READ TABLE lt_buf INTO ls_buf INDEX 1.
      if ls_buf-flag EQ 'U'.
        UPDATE zee_t_03 FROM TABLE @lt_data.
      elseif ls_buf-flag EQ 'I'.
        INSERT zee_t_03 FROM TABLE @lt_data.
      elseif ls_buf-flag EQ 'D'.
        LOOP AT lt_data INTO ls_data.
            DELETE FROM zee_t_03 WHERE matnr eq @ls_data-matnr.
        ENDLOOP.
      endif.

    ENDIF.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
