CLASS zudemy02_fill_data2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS fill_master_data.
    METHODS flush.
    METHODS fill_transaction_data.
ENDCLASS.



CLASS ZUDEMY02_FILL_DATA2 IMPLEMENTATION.


  METHOD fill_master_data.

    DATA: lt_bp   TYPE TABLE OF zudemy02_bp,
          lt_prod TYPE TABLE OF zudemy02_product.

    APPEND VALUE #(
*                bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                bp_id = '1'
                bp_role = '01'
                company_name = 'TACUM'
                street = 'Victoria Street'
                city = 'Kolkatta'
                country = 'IN'
                region = 'APJ'
                )
                TO lt_bp.
    APPEND VALUE #(
*                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_id = '2'
                    bp_role = '01'
                    company_name = 'SAP'
                    street = 'Rosvelt Street Road'
                    city = 'Walldorf'
                    country = 'DE'
                    region = 'EMEA'
                    )
                    TO lt_bp.
    APPEND VALUE #(
*                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_id = '3'
                    bp_role = '01'
                    company_name = 'Asia High tech'
                    street = '1-7-2 Otemachi'
                    city = 'Tokyo'
                    country = 'JP'
                    region = 'APJ'
                    )
                    TO lt_bp.
    APPEND VALUE #(
*                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_id = '4'
                    bp_role = '01'
                    company_name = 'AVANTEL'
                    street = 'Bosque de Duraznos'
                    city = 'Maxico'
                    country = 'MX'
                    region = 'NA'
                    )
                    TO lt_bp.
    APPEND VALUE #(
*                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_id = '5'
                    bp_role = '01'
                    company_name = 'Pear Computing Services'
                    street = 'Dunwoody Xing'
                    city = 'Atlanta, Georgia'
                    country = 'US'
                    region = 'NA'
                    )
                    TO lt_bp.
    APPEND VALUE #(
*                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_id = '6'
                    bp_role = '01'
                    company_name = 'PicoBit'
                    street = 'Fith Avenue'
                    city = 'New York City'
                    country = 'US'
                    region = 'NA'
                    )
                    TO lt_bp.
    APPEND VALUE #(
*                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_id = '7'
                    bp_role = '01'
                    company_name = 'TACUM'
                    street = 'Victoria Street'
                    city = 'Kolkatta'
                    country = 'IN'
                    region = 'APJ'
                    )
                    TO lt_bp.
    APPEND VALUE #(
*                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_id = '8'
                    bp_role = '01'
                    company_name = 'Indian IT Trading Company'
                    street = 'Nariman Point'
                    city = 'Mumbai'
                    country = 'IN'
                    region = 'APJ'
                    )
                    TO lt_bp.

    APPEND VALUE #(
*                     product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                     product_id = '1'
                     name = 'Blaster Extreme'
                     category = 'Speakers'
                     price = 175
                     currency = 'INR'
                     discount = 3
                     )
                     TO lt_prod.
    APPEND VALUE #(
*                    product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    product_id = '2'
                    name = 'Sound Booster'
                    category = 'Speakers'
                    price = 250
                    currency = 'INR'
                    discount = 2
                    )
                    TO lt_prod.
    APPEND VALUE #(
*                    product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    product_id = '3'
                    name = 'Smart Office'
                    category = 'Software'
                    price = 154
                    currency = 'INR'
                    discount = 32
                    )
                    TO lt_prod.
    APPEND VALUE #(
*                    product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    product_id = '4'
                    name = 'Smart Design'
                    category = 'Software'
                    price = 240
                    currency = 'INR'
                    discount = 12
                    )
                    TO lt_prod.
    APPEND VALUE #(
*                    product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    product_id = '5'
                    name = 'Transcend Carry pocket'
                    category = 'PCs'
                    price = 140
                    currency = 'INR'
                    discount = 7
                    )
                    TO lt_prod.
    APPEND VALUE #(
*                    product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    product_id = '6'
                    name = 'Gaming Monster Pro'
                    category = 'PCs'
                    price = 155
                    currency = 'INR'
                    discount = 8
                    )
                    TO lt_prod.

    INSERT zudemy02_bp FROM TABLE @lt_bp.
    INSERT zudemy02_product FROM TABLE @lt_prod.
    commit work.
  ENDMETHOD.


  METHOD fill_transaction_data.

    DATA : o_rand    TYPE REF TO cl_abap_random_int,
           n         TYPE i,
           seed      TYPE i,
           lv_date   TYPE timestamp,
           lv_ord_id TYPE zudemy_02_de_id,
           lt_so     TYPE TABLE OF zudemy02_so,
           lt_so_i   TYPE TABLE OF zudemy02_so_i.


seed = cl_abap_random=>seed( ).
    cl_abap_random_int=>create(
      EXPORTING
        seed = seed
        min  = 1
        max  = 7
      RECEIVING
        prng = o_rand
    ).
    GET TIME STAMP FIELD lv_date.

    SELECT * FROM zudemy02_bp INTO TABLE @DATA(lt_bp).
    SELECT * FROM zudemy02_product INTO TABLE @DATA(lt_prod).

    data: lv_index type char2.

    DO 10 TIMES.
*      lv_ord_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32(  ).
      lv_index = sy-index.
      lv_ord_id = lv_index.
      n = o_rand->get_next( ).
      READ TABLE lt_bp INTO DATA(ls_bp) INDEX n.
      APPEND VALUE #( order_id = lv_ord_id
                      order_no = sy-index
                      buyer = ls_bp-bp_id
                      gross_amount = n * 100
                      currency = 'INR'
                      created_by = sy-uname
                      created_on = lv_date
                      changed_by = sy-uname
                      changed_on = lv_date
                   )  TO lt_so.
      DO 2 TIMES.
        READ TABLE lt_prod INTO DATA(ls_product) INDEX n.
        n = o_rand->get_next( ).
*        clear lv_index.
*        lv_index = sy-index.
        APPEND VALUE #( order_id = lv_ord_id
                    item_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32(  )
*                    item_id = lv_index
                    product = ls_product-product_id
                    qty = n
                    uom = 'PC'
                    amount = n * ls_product-price
                    currency = 'INR'
                    created_by = sy-uname
                    created_on = lv_date
                    changed_by = sy-uname
                    changed_on = lv_date
                 )  TO lt_so_i.
      ENDDO.
    ENDDO.

    INSERT zudemy02_so FROM TABLE @lt_so.
    INSERT zudemy02_so_i FROM TABLE @lt_so_i.
commit work.
  ENDMETHOD.


  METHOD flush.
    DELETE FROM: zudemy02_bp, zudemy02_product, zudemy02_so, zudemy02_so_i.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    me->flush( ).
    me->fill_master_data( ).
    me->fill_transaction_data(  ).
    out->write( 'Execution completed, check the data in tables' ).
  ENDMETHOD.
ENDCLASS.
