CLASS zee_cl_unit_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    METHODS:
      add.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZEE_CL_UNIT_TEST IMPLEMENTATION.


    METHOD add.
    data(num1) = 5.
    data(num2) = 5.
    data(num3) = 0.

    num3 = num1 + num2.

*    out->write( 'emre2' ).

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
out->write( 'emre1' ).

*DATA(calc2) = NEW add( ).

  ENDMETHOD.
ENDCLASS.
