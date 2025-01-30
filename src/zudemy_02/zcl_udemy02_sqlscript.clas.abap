CLASS zcl_udemy02_sqlscript DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.
    CLASS-METHODS getproddata
      IMPORTING
        VALUE(p_id)         TYPE zudemy_02_de_id
      EXPORTING
        VALUE(ev_price)     TYPE f
        VALUE(ev_price_dis) TYPE f.
    CLASS-METHODS getorders FOR TABLE FUNCTION Zudemy02_F_CDS.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_udemy02_sqlscript IMPLEMENTATION.
  METHOD getorders BY DATABASE FUNCTION FOR HDB
             LANGUAGE SQLSCRIPT OPTIONS READ-ONLY USING
             zudemy02_so zudemy02_so_i zudemy02_product.
    lt_orders = select hdr.client , hdr.order_no, item.amount,
                       ( item.amount * ( 100 - prod.discount ) / 100 ) as amount_dis
                       from     zudemy02_so as hdr
                       inner join zudemy02_so_i as item
                        on hdr.order_id = item.order_id
                       inner join zudemy02_product as prod
                         on item.product = prod.product_id where hdr.client = :p_clnt;

    RETURN select client, order_no, sum( amount ) as gross_amount,
                         sum( amount_dis ) as gross_dis_amount from  :lt_orders
                         group by  client, order_no;

  ENDMETHOD.

  METHOD getproddata BY DATABASE PROCEDURE FOR HDB
             LANGUAGE SQLSCRIPT OPTIONS READ-ONLY USING zudemy02_product.
    DECLARE lv_price, lv_discount DOUBLE;
    SELECT price, discount into lv_price, lv_discount
         from zudemy02_product where product_id = :p_id;
    ev_price =      lv_price;
    ev_price_dis = ( lv_price * ( 100 - lv_discount ) / 100 );

  ENDMETHOD.

ENDCLASS.
