CLASS zcl_calculator_test DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.
  PRIVATE SECTION.
    METHODS test_addition FOR TESTING.
ENDCLASS.

CLASS zcl_calculator_test IMPLEMENTATION.
  METHOD test_addition.
    DATA(calc) = NEW zee_cl_unit_test( ).
*    DATA(result) = calc->if_oo_adt_classrun(  ).
*    cl_abap_unit_assert=>assert_equals( act = result exp = 5 msg = '3 + 2 should be 5' ).
  ENDMETHOD.
ENDCLASS.
