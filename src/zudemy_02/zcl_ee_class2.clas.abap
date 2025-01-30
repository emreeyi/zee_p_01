CLASS zcl_ee_class2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EE_CLASS2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  out->write(
      EXPORTING
        data   = 'Welcome to ABAP on cloud!'
*    name   =
*  RECEIVING
*    output =
    ).

  ENDMETHOD.
ENDCLASS.
