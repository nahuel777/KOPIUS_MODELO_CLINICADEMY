CLASS zcl_reporte_clinica DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_reporte_clinica IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM ztb_med_pac AS paciente
      LEFT OUTER JOIN ztb_med_cit AS cita
        ON cita~dni_pac = paciente~dni
      FIELDS paciente~obra_social AS obra_social,
             COUNT( cita~id_cita ) AS cantidad_citas
      GROUP BY paciente~obra_social
      INTO TABLE @DATA(lt_citas_por_obra).

    SORT lt_citas_por_obra BY cantidad_citas DESCENDING
                              obra_social ASCENDING.

    out->write( '1. Cantidad de citas por obra social' ).
    out->write( lt_citas_por_obra ).

    SELECT FROM ztb_med_pac AS paciente
      LEFT OUTER JOIN ztb_med_cit AS cita
        ON cita~dni_pac = paciente~dni
      FIELDS paciente~dni AS dni,
             paciente~nombre AS nombre,
             paciente~apellido AS apellido,
             COUNT( cita~id_cita ) AS cantidad_citas
      GROUP BY paciente~dni,
               paciente~nombre,
               paciente~apellido
      INTO TABLE @DATA(lt_citas_por_paciente).

    SORT lt_citas_por_paciente BY apellido ASCENDING
                                  nombre ASCENDING
                                  dni ASCENDING.

    out->write( '2. Cantidad de citas por paciente' ).
    out->write( lt_citas_por_paciente ).

    SELECT FROM ztb_med_pac AS paciente
      FIELDS paciente~obra_social AS obra_social,
             AVG( paciente~edad ) AS edad_promedio
      GROUP BY paciente~obra_social
      INTO TABLE @DATA(lt_edad_promedio_por_obra).

    SORT lt_edad_promedio_por_obra BY edad_promedio DESCENDING
                                     obra_social ASCENDING.

    out->write( '3. Edad promedio por obra social' ).
    out->write( lt_edad_promedio_por_obra ).

  ENDMETHOD.
ENDCLASS.

