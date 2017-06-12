*&---------------------------------------------------------------------*
*& Report  ZDESIGNP_FACTORY_4
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zdesignp_factory_4.

*----------------------------------------------------------------------*
* LOCAL OBJECTS
*----------------------------------------------------------------------*

CLASS lcl_sample DEFINITION
  FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS get_instance
      IMPORTING iv_dummy         TYPE  string
      RETURNING VALUE(ro_sample) TYPE REF TO lcl_sample.
ENDCLASS.

CLASS lcl_sample IMPLEMENTATION.
  METHOD get_instance.
    ro_sample = NEW #( ).
    " Initialization code
  ENDMETHOD.
ENDCLASS.

*----------------------------------------------------------------------*
* MAIN PROGRAM
*----------------------------------------------------------------------*

START-OF-SELECTION.
  DATA(go_sample) = lcl_sample=>get_instance( `DUMMY` ).

  " Main logic of the program, using go_sample

END-OF-SELECTION.

  " Some form definitions
