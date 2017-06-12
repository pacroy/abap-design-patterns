*&---------------------------------------------------------------------*
*& Report  ZDESIGNP_FACTORY_2
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zdesignp_factory_2.

*----------------------------------------------------------------------*
* LOCAL OBJECTS
*----------------------------------------------------------------------*

INTERFACE lif_party.
  METHODS:  get_details.
  METHODS:  post_fi_doc.
ENDINTERFACE.

*----------------------------------------------------------------------*
* MAIN PROGRAM
*----------------------------------------------------------------------*

TYPES:  BEGIN OF ts_label,
          clsname TYPE seoclsname,
          label   TYPE char30,
        END OF ts_label,
        tt_label TYPE STANDARD TABLE OF ts_label WITH KEY clsname.

DATA:
  go_obj   TYPE REF TO object,
  go_party TYPE REF TO lif_party,
  gt_label TYPE tt_label.
" Some additional data definitions

PARAMETERS: p_label TYPE  ts_label-label  OBLIGATORY.
" Some additional select options

INITIALIZATION.
  gt_label = VALUE #(
    ( clsname = 'CL_VENDOR' label = 'VENDOR' )
    ( clsname = 'CL_CUSTOMER' label = 'CUSTOMER' )
    ( clsname = 'CL_EMPLOYEE' label = 'EMPLOYEE' )
  ).

START-OF-SELECTION.
  DATA(gv_clsname) = gt_label[ label = p_label ].

  CREATE OBJECT go_obj TYPE (gv_clsname).
  go_party ?= go_obj.
  " Main logic of the program, using go_party

END-OF-SELECTION.

  " Some form definitions
