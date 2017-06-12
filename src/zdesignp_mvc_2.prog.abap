*&---------------------------------------------------------------------*
*& Report ZDESIGNP_MVC_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdesignp_mvc_2.

*----------------------------------------------------------------------*
* MODEL CLASS
*----------------------------------------------------------------------*

CLASS lcl_designp_mvc DEFINITION
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    TYPES: BEGIN OF zts_vbeln_rng,
             dummy TYPE abap_bool,
           END OF zts_vbeln_rng,
           ztt_vbeln_rng TYPE STANDARD TABLE OF zts_vbeln_rng WITH EMPTY KEY.
    TYPES: BEGIN OF zts_order,
             dummy TYPE abap_bool,
           END OF zts_order,
           ztt_order TYPE STANDARD TABLE OF zts_order WITH EMPTY KEY.
    TYPES:
      BEGIN OF t_param,
        s_bukrs TYPE RANGE OF char4,
        s_belnr TYPE RANGE OF char10,
        s_gjahr TYPE RANGE OF char4,
      END OF t_param.

    METHODS read_orders
      IMPORTING
        !is_param     TYPE t_param
        !it_vbeln_rng TYPE ztt_vbeln_rng OPTIONAL.
    METHODS eliminate_blocked.
    METHODS get_order_list
      RETURNING
        VALUE(rt_list) TYPE ztt_order.
    METHODS create_dlv
      RETURNING
        VALUE(rt_bapiret2) TYPE bapiret2_tab.

  PRIVATE SECTION.
    DATA gt_order TYPE ztt_order.
ENDCLASS.

CLASS lcl_designp_mvc IMPLEMENTATION.
  METHOD create_dlv.
    " Some code to loop through GT_ORDER & create deliveries
  ENDMETHOD.

  METHOD eliminate_blocked.
    " Some code to read KN* tables & remove entries from GT_ORDER
  ENDMETHOD.

  METHOD get_order_list.
    rt_list[] = gt_order[].
  ENDMETHOD.

  METHOD read_orders.
    " Some code to read VBAK, VBAP, etc and fill GT_ORDER
  ENDMETHOD.
ENDCLASS.

*----------------------------------------------------------------------*
* CONTROLLER PROGRAM
*----------------------------------------------------------------------*

DATA:
  go_model  TYPE REF TO lcl_designp_mvc,
  gt_order  TYPE lcl_designp_mvc=>ztt_order,
  gs_param  TYPE lcl_designp_mvc=>t_param,
  gv_char4  TYPE char4,
  gv_char10 TYPE char10.
" Some data definitions
" Some selection-screen parameters

SELECT-OPTIONS: s_bukrs FOR gv_char4,
                s_belnr FOR gv_char10,
                s_gjahr FOR gv_char4.

START-OF-SELECTION.
  go_model = NEW #( ).
  gs_param-s_bukrs = s_bukrs[].
  gs_param-s_belnr = s_belnr[].
  gs_param-s_gjahr = s_gjahr[].
  go_model->read_orders( gs_param ).
  go_model->eliminate_blocked( ).
  gt_order = go_model->get_order_list( ).
  PERFORM display_alv.

END-OF-SELECTION.

FORM display_alv.
  " Some code to call REUSE_ALV_GRID_DISPLAY
ENDFORM.

FORM user_command USING rucomm rs_selfield.
  CHECK rucomm EQ 'SAVE'.
  go_model->create_dlv( ).
ENDFORM.
