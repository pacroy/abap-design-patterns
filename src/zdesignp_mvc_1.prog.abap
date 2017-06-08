*&---------------------------------------------------------------------*
*& Report ZDESIGNP_MVC_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdesignp_mvc_1.
" Some data definitions
" Some selection-screen parameters

START-OF-SELECTION.
  PERFORM read_orders.
  PERFORM eliminate_blocked.
  PERFORM display_alv.

END-OF-SELECTION.

FORM read_orders.
  " Some code to read VBAK, VBAP, etc
ENDFORM.

FORM eliminate_blocked.
  " Some code to read KN* tables and remove entries from the ITAB
ENDFORM.

FORM display_alv.
  " Some code to call REUSE_ALV_GRID_DISPLAY
ENDFORM.

FORM user_command USING rucomm rs_selfield.
  CHECK rucomm EQ 'SAVE'.
  PERFORM create_dlv.
ENDFORM.

FORM create_dlv.
  " Some code to loop through the ITAB & create deliveries
ENDFORM.

" Some further forms
