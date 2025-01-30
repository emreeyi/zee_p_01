CLASS zcl_rap_eml_1234 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RAP_EML_1234 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  " step 1 - READ
    READ ENTITIES OF ZI_RAP_Travel_1234
      ENTITY travel
        FROM VALUE #( ( TravelUUID = '<your uuid>' ) )
      RESULT DATA(travels).

    out->write( travels ).
  ENDMETHOD.
ENDCLASS.
