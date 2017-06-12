*&---------------------------------------------------------------------*
*& Report  ZDESIGNP_FACTORY_3
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zdesignp_factory_3.

*----------------------------------------------------------------------*
* LOCAL OBJECTS
*----------------------------------------------------------------------*

INTERFACE lif_party.
  METHODS:  get_details.
  METHODS:  post_fi_doc.
ENDINTERFACE.

CLASS lcl_factory DEFINITION
  FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES:  BEGIN OF ts_label,
              clsname TYPE seoclsname,
              label   TYPE char30,
            END OF ts_label,
            tt_label TYPE STANDARD TABLE OF ts_label WITH KEY clsname.

    CLASS-METHODS class_constructor.
    CLASS-METHODS get_party_instance
      IMPORTING iv_label        TYPE  ts_label-label
      RETURNING VALUE(ro_party) TYPE REF TO lif_party.

  PRIVATE SECTION.
    CLASS-DATA: at_label  TYPE tt_label.
ENDCLASS.

CLASS lcl_factory IMPLEMENTATION.
  METHOD class_constructor.
    at_label = VALUE #(
      ( clsname = 'CL_VENDOR' label = 'VENDOR' )
      ( clsname = 'CL_CUSTOMER' label = 'CUSTOMER' )
      ( clsname = 'CL_EMPLOYEE' label = 'EMPLOYEE' )
    ).
  ENDMETHOD.

  METHOD get_party_instance.
    DATA lo_obj TYPE REF TO object.

    DATA(lv_clsname) = at_label[ label = iv_label ].

    CREATE OBJECT lo_obj TYPE (lv_clsname).
    ro_party ?= lo_obj.
  ENDMETHOD.
ENDCLASS.

*----------------------------------------------------------------------*
* MAIN PROGRAM
*----------------------------------------------------------------------*

" Some data definitions
PARAMETERS: p_label TYPE lcl_factory=>ts_label-label OBLIGATORY.
"“ Some additional select options

START-OF-SELECTION.
  DATA(go_party) = lcl_factory=>get_party_instance( p_label ).

  " Main logic of the program, using go_party

END-OF-SELECTION.

  " Some form definitions
