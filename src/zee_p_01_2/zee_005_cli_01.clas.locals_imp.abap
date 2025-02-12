CLASS LHC_RAP_TDAT_CTS DEFINITION FINAL.
  PUBLIC SECTION.
    CLASS-METHODS:
      GET
        RETURNING
          VALUE(RESULT) TYPE REF TO IF_MBC_CP_RAP_TABLE_CTS.

ENDCLASS.

CLASS LHC_RAP_TDAT_CTS IMPLEMENTATION.
  METHOD GET.
    result = mbc_cp_api=>rap_table_cts( table_entity_relations = VALUE #(
                                         ( entity = 'VeritabanTablosu' table = 'ZEE_A_005' )
                                       ) ) ##NO_TEXT.
  ENDMETHOD.
ENDCLASS.
CLASS LHC_ZEE_005_IS_01 DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_INSTANCE_FEATURES FOR INSTANCE FEATURES
        IMPORTING
          KEYS REQUEST requested_features FOR VeritabanTablosuAll
        RESULT result,
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR VeritabanTablosuAll
        RESULT result.
ENDCLASS.

CLASS LHC_ZEE_005_IS_01 IMPLEMENTATION.
  METHOD GET_INSTANCE_FEATURES.
    DATA: edit_flag            TYPE abp_behv_op_ctrl    VALUE if_abap_behv=>fc-o-enabled.

    IF cl_bcfg_cd_reuse_api_factory=>get_cust_obj_service_instance(
        iv_objectname = 'ZEE_A_005'
        iv_objecttype = cl_bcfg_cd_reuse_api_factory=>simple_table )->is_editable( ) = abap_false.
      edit_flag = if_abap_behv=>fc-o-disabled.
    ENDIF.
    result = VALUE #( FOR key in keys (
               %TKY = key-%TKY
               %ACTION-edit = edit_flag
               %ASSOC-_VeritabanTablosu = edit_flag ) ).
  ENDMETHOD.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
    AUTHORITY-CHECK OBJECT 'S_TABU_NAM' ID 'TABLE' FIELD 'ZEE_005_I_01' ID 'ACTVT' FIELD '02'.
    DATA(is_authorized) = COND #( WHEN sy-subrc = 0 THEN if_abap_behv=>auth-allowed
                                  ELSE if_abap_behv=>auth-unauthorized ).
    result-%UPDATE      = is_authorized.
    result-%ACTION-Edit = is_authorized.
  ENDMETHOD.
ENDCLASS.
CLASS LSC_ZEE_005_IS_01 DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_SAVER.
  PROTECTED SECTION.
    METHODS:
      SAVE_MODIFIED REDEFINITION.
ENDCLASS.

CLASS LSC_ZEE_005_IS_01 IMPLEMENTATION.
  METHOD SAVE_MODIFIED ##NEEDED.
  ENDMETHOD.
ENDCLASS.
CLASS LHC_ZEE_005_I_01 DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_FEATURES FOR GLOBAL FEATURES
        IMPORTING
          REQUEST REQUESTED_FEATURES FOR VeritabanTablosu
        RESULT result,
      COPYVERITABANTABLOSU FOR MODIFY
        IMPORTING
          KEYS FOR ACTION VeritabanTablosu~CopyVeritabanTablosu,
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR VeritabanTablosu
        RESULT result,
      GET_INSTANCE_FEATURES FOR INSTANCE FEATURES
        IMPORTING
          KEYS REQUEST requested_features FOR VeritabanTablosu
        RESULT result.
ENDCLASS.

CLASS LHC_ZEE_005_I_01 IMPLEMENTATION.
  METHOD GET_GLOBAL_FEATURES.
    DATA edit_flag TYPE abp_behv_op_ctrl VALUE if_abap_behv=>fc-o-enabled.
    IF cl_bcfg_cd_reuse_api_factory=>get_cust_obj_service_instance(
         iv_objectname = 'ZEE_A_005'
         iv_objecttype = cl_bcfg_cd_reuse_api_factory=>simple_table )->is_editable( ) = abap_false.
      edit_flag = if_abap_behv=>fc-o-disabled.
    ENDIF.
    result-%UPDATE = edit_flag.
    result-%DELETE = edit_flag.
  ENDMETHOD.
  METHOD COPYVERITABANTABLOSU.
    DATA new_VeritabanTablosu TYPE TABLE FOR CREATE ZEE_005_IS_01\_VeritabanTablosu.

    IF lines( keys ) > 1.
      INSERT mbc_cp_api=>message( )->get_select_only_one_entry( ) INTO TABLE reported-%other.
      failed-VeritabanTablosu = VALUE #( FOR fkey IN keys ( %TKY = fkey-%TKY ) ).
      RETURN.
    ENDIF.

    READ ENTITIES OF ZEE_005_IS_01 IN LOCAL MODE
      ENTITY VeritabanTablosu
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(ref_VeritabanTablosu)
        FAILED DATA(read_failed).

    IF ref_VeritabanTablosu IS NOT INITIAL.
      ASSIGN ref_VeritabanTablosu[ 1 ] TO FIELD-SYMBOL(<ref_VeritabanTablosu>).
      DATA(key) = keys[ KEY draft %TKY = <ref_VeritabanTablosu>-%TKY ].
      DATA(key_cid) = key-%CID.
      APPEND VALUE #(
        %TKY-SingletonID = 1
        %IS_DRAFT = <ref_VeritabanTablosu>-%IS_DRAFT
        %TARGET = VALUE #( (
          %CID = key_cid
          %IS_DRAFT = <ref_VeritabanTablosu>-%IS_DRAFT
          %DATA = CORRESPONDING #( <ref_VeritabanTablosu> EXCEPT
          SingletonID
        ) ) )
      ) TO new_VeritabanTablosu ASSIGNING FIELD-SYMBOL(<new_VeritabanTablosu>).
      <new_VeritabanTablosu>-%TARGET[ 1 ]-Id = key-%PARAM-Id.

      MODIFY ENTITIES OF ZEE_005_IS_01 IN LOCAL MODE
        ENTITY VeritabanTablosuAll CREATE BY \_VeritabanTablosu
        FIELDS (
                 Id
                 Name
                 Surname
               ) WITH new_VeritabanTablosu
        MAPPED DATA(mapped_create)
        FAILED failed
        REPORTED reported.

      mapped-VeritabanTablosu = mapped_create-VeritabanTablosu.
    ENDIF.

    INSERT LINES OF read_failed-VeritabanTablosu INTO TABLE failed-VeritabanTablosu.

    IF failed-VeritabanTablosu IS INITIAL.
      reported-VeritabanTablosu = VALUE #( FOR created IN mapped-VeritabanTablosu (
                                                 %CID = created-%CID
                                                 %ACTION-CopyVeritabanTablosu = if_abap_behv=>mk-on
                                                 %MSG = mbc_cp_api=>message( )->get_item_copied( )
                                                 %PATH-VeritabanTablosuAll-%IS_DRAFT = created-%IS_DRAFT
                                                 %PATH-VeritabanTablosuAll-SingletonID = 1 ) ).
    ENDIF.
  ENDMETHOD.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
    AUTHORITY-CHECK OBJECT 'S_TABU_NAM' ID 'TABLE' FIELD 'ZEE_005_I_01' ID 'ACTVT' FIELD '02'.
    DATA(is_authorized) = COND #( WHEN sy-subrc = 0 THEN if_abap_behv=>auth-allowed
                                  ELSE if_abap_behv=>auth-unauthorized ).
    result-%ACTION-CopyVeritabanTablosu = is_authorized.
  ENDMETHOD.
  METHOD GET_INSTANCE_FEATURES.
    result = VALUE #( FOR row IN keys ( %TKY = row-%TKY
                                        %ACTION-CopyVeritabanTablosu = COND #( WHEN row-%IS_DRAFT = if_abap_behv=>mk-off THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled )
    ) ).
  ENDMETHOD.
ENDCLASS.
