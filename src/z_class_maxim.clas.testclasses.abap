*"* use this source file for your ABAP unit test classes
class ltcl_maxim definition final for testing
  duration short
  risk level harmless.

  private section.
    methods: get_entity_set FOR TESTING.
endclass.

********************************* Implementierung *********************************
class ltcl_maxim implementation.
METHOD get_entity_set.
    DATA: lv_http_status TYPE i.
    DATA: lv_status_text TYPE string.
    DATA(lv_url) = |https://obd.in4md-service.de:443/sap/opu/odata/SAP/ZMAXIM_OB_SRV/ZTEACH_CONTACTSet|.

    DATA: o_client TYPE REF TO if_http_client.
    TRY.
********************************* Client-Objekt erzeugen *********************************
        cl_http_client=>create_by_url( EXPORTING
                                       url     = lv_url
                                     IMPORTING
                                       client  = o_client ).

        o_client->authenticate( username = 'TEACH-000' password = 'tlestart!').
        o_client->send( timeout = if_http_client=>co_timeout_default ).
********************************* Response lesen *********************************
        o_client->receive( ).
********************************* HTTP Return Code holen *********************************
        o_client->response->get_status( IMPORTING
                                          code   = lv_http_status
                                          reason = lv_status_text ).

        IF lv_http_status = 200.
********************************* HTTP Body als Character-Daten *********************************
          DATA(lv_result) = o_client->response->get_cdata( ).
          DATA(lv_begin) = substring( val = lv_result off = 0 len = 10 ).
          cl_abap_unit_assert=>assert_equals( act = lv_begin exp = '<feed xmln').
        ELSE.
          cl_abap_unit_assert=>fail(  ).
        ENDIF.

********************************* HTTP Connection schließen *********************************
        o_client->close( ).

      CATCH cx_root INTO DATA(e_txt).
        WRITE: / e_txt->get_text( ).
        cl_abap_unit_assert=>fail(  ).
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
