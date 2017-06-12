*&---------------------------------------------------------------------*
*& Report  ZDESIGNP_FACTORY_1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zdesignp_factory_1.

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

DATA:
  go_obj   TYPE REF TO object,
  go_party TYPE REF TO lif_party.
" Some additional data definitions

PARAMETERS: p_clsnam TYPE  seoclsname  OBLIGATORY.
" Some additional select options

START-OF-SELECTION.
  CREATE OBJECT go_obj TYPE (p_clsnam).
  go_party ?= go_obj.
  " Main logic of the program, using go_party

END-OF-SELECTION.

  " Some form definitions
