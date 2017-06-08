CLASS zcl_designp_mvc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    TYPES: BEGIN OF zts_vbeln_rng,
             mandt TYPE mandt,
           END OF zts_vbeln_rng,
           ztt_vbeln_rng TYPE STANDARD TABLE OF zts_vbeln_rng WITH EMPTY KEY.
    TYPES: BEGIN OF zts_order,
             mandt TYPE mandt,
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



CLASS ZCL_DESIGNP_MVC IMPLEMENTATION.


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
