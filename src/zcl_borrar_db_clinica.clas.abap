CLASS zcl_borrar_db_clinica DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_borrar_db_clinica IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DELETE FROM ztb_med_doc.
    DELETE FROM ztb_med_pac.
    DELETE FROM ztb_med_cit.
  ENDMETHOD.

ENDCLASS.
