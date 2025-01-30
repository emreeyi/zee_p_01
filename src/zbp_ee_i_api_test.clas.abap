CLASS zbp_ee_i_api_test DEFINITION

 PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.

      TYPES:
      BEGIN OF post_s,
        user_id TYPE i,
        id      TYPE i,
        title   TYPE string,
        body    TYPE string,
      END OF post_s,

      post_tt TYPE TABLE OF post_s WITH EMPTY KEY.
*      CLASS-METHODS create_user.

    METHODS:
       create_client
        IMPORTING url           TYPE string
        RETURNING VALUE(result) TYPE REF TO if_web_http_client
        RAISING   cx_static_check,

      read_single_post
        IMPORTING id            TYPE i
        RETURNING VALUE(result) TYPE post_s
        RAISING   cx_static_check,

        create_users
         RAISING   cx_static_check.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS:
      base_url     TYPE string VALUE 'https://jsonplaceholder.typicode.com/posts',
      content_type TYPE string VALUE 'Content-type',
      json_content TYPE string VALUE 'application/json; charset=UTF-8'.
ENDCLASS.



CLASS ZBP_EE_I_API_TEST IMPLEMENTATION.


  METHOD create_client.
    DATA(dest) = cl_http_destination_provider=>create_by_url( url ).
    result = cl_web_http_client_manager=>create_by_http_destination( dest ).
  ENDMETHOD.


  METHOD create_users.
   DATA: lt_zee_t_02 TYPE TABLE OF zee_t_02,
          ls_zee_t_02 TYPE zee_t_02.
MOVE-CORRESPONDING read_single_post( 1 ) TO ls_zee_t_02.
        INSERT zee_t_02 FROM  @ls_zee_t_02.
  ENDMETHOD.


METHOD if_oo_adt_classrun~main.
    TRY.
    DATA: lt_zee_t_02 TYPE TABLE OF zee_t_02,
          ls_zee_t_02 TYPE zee_t_02,
          lv_count TYPE i.
          lv_count = 0.
        " Read
     "   DATA(all_posts) = read_posts(  ).
*        DATA(first_post) = read_single_post( 1 ).
*        DATA(first_post) = read_single_post( 2 ).
*        DATA(first_post) = read_single_post( 3 ).
*        MOVE-CORRESPONDING read_single_post( 3 ) TO ls_zcy_api_001_t_01.
        DELETE FROM zee_t_02.
        out->write( 'tüm kayitlar silindi' ).
        DO 10 TIMES.

        lv_count = lv_count + 1.
        MOVE-CORRESPONDING read_single_post( lv_count ) TO ls_zee_t_02.
        INSERT zee_t_02 FROM  @ls_zee_t_02.
        ENDDO.
        out->write( 'kayit atildi' ).

        " Create
     "   DATA(create_response) = create_post( VALUE #( user_id = 7
     "    title = 'Hello, World!' body = ':)' ) ).

        " Update
      "  first_post-user_id = 777.
      "  DATA(update_response) = update_post( first_post ).

        " Delete
     "   delete_post( 9 ).

        " Print results
     "   out->write( all_posts ).
     "   out->write( first_post ).
     "   out->write( create_response ).
     "   out->write( update_response ).

      CATCH cx_root INTO DATA(exc).
        out->write( exc->get_text(  ) ).
    ENDTRY.
  ENDMETHOD.


  METHOD read_single_post.
    " Get JSON for input post ID
    DATA(url) = |{ base_url }/{ id }|.
    DATA(client) = create_client( url ).
    DATA(response) = client->execute( if_web_http_client=>get )->get_text(  ).
    client->close(  ).

    " Convert JSON to post structure
    xco_cp_json=>data->from_string( response )->apply(
      VALUE #( ( xco_cp_json=>transformation->camel_case_to_underscore ) )
      )->write_to( REF #( result ) ).
  ENDMETHOD.
ENDCLASS.
