*&---------------------------------------------------------------------*
*& Report ZDESIGNP_MVC_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdesignp_mvc_2.

DATA:
  go_model  TYPE REF TO zcl_designp_mvc,
  gt_order  TYPE zcl_designp_mvc=>ztt_order,
  gs_param  TYPE zcl_designp_mvc=>t_param,
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
