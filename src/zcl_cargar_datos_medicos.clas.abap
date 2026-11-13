CLASS zcl_cargar_datos_medicos DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cargar_datos_medicos IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_medicos   TYPE STANDARD TABLE OF ztb_med_doc.
    DATA lt_pacientes TYPE STANDARD TABLE OF ztb_med_pac.
    DATA lt_citas     TYPE STANDARD TABLE OF ztb_med_cit.

    " =========================================================================
    " 1. CARGAR MÉDICOS
    " =========================================================================
    lt_medicos = VALUE #(
      ( mat_med = 'M001' nombre = 'Alberto' apellido = 'Perez'    especialidad = 'Cardiologia'    hospital = 'Hospital Central' )
      ( mat_med = 'M002' nombre = 'Maria'   apellido = 'Gomez'    especialidad = 'Pediatria'      hospital = 'Sanatorio Ninios' )
      ( mat_med = 'M003' nombre = 'Carlos'  apellido = 'Lopez'    especialidad = 'Traumatologia'  hospital = 'Hospital Central' )
      ( mat_med = 'M004' nombre = 'Ana'     apellido = 'Martinez' especialidad = 'Dermatologia'   hospital = 'Clinica Privada' )
      ( mat_med = 'M005' nombre = 'Jorge'   apellido = 'Benitez'  especialidad = 'Neurologia'     hospital = 'Sanatorio Ninios' )
      ( mat_med = 'M006' nombre = 'Lucia'   apellido = 'Rios'     especialidad = 'Cardiologia'    hospital = 'Clinica Privada' )
    ).

    " =========================================================================
    " 2. CARGAR PACIENTES
    " =========================================================================
    lt_pacientes = VALUE #(
      ( dni = '20111222' nombre = 'Esteban' apellido = 'Quito'     obra_social = 'OSDE'          edad = 34 )
      ( dni = '25333444' nombre = 'Elsa'    apellido = 'Pallo'     obra_social = 'Swiss Medical' edad = 28 )
      ( dni = '30555666' nombre = 'Armando' apellido = 'Paredes'   obra_social = 'OSDE'          edad = 45 )
      ( dni = '35777888' nombre = 'Dolores' apellido = 'Del Debrio' obra_social = 'Medicus'       edad = 52 )
      ( dni = '40999000' nombre = 'Aquiles' apellido = 'Bailo'     obra_social = 'PAMI'          edad = 70 )
      ( dni = '42111333' nombre = 'Zacarías' apellido = 'Flores'    obra_social = 'Swiss Medical' edad = 19 )
      ( dni = '45222444' nombre = 'Susana'  apellido = 'Horia'     obra_social = 'OSDE'          edad = 31 )
      ( dni = '50333555' nombre = 'Alan'    apellido = 'Brito'     obra_social = 'Medicus'       edad = 26 )
    ).

    " =========================================================================
    " 3. CARGAR CITAS / TURNOS MÉDICOS (Vinculan Matrícula y DNI)
    " =========================================================================
    lt_citas = VALUE #(
      ( id_cita = 'C001' mat_med = 'M001' dni_pac = '20111222' fecha = '20261101' estado = 'C' )
      ( id_cita = 'C002' mat_med = 'M001' dni_pac = '25333444' fecha = '20261101' estado = 'C' )
      ( id_cita = 'C003' mat_med = 'M002' dni_pac = '30555666' fecha = '20261102' estado = 'P' )
      ( id_cita = 'C004' mat_med = 'M003' dni_pac = '35777888' fecha = '20261102' estado = 'A' )
      ( id_cita = 'C005' mat_med = 'M004' dni_pac = '40999000' fecha = '20261103' estado = 'C' )
      ( id_cita = 'C006' mat_med = 'M001' dni_pac = '42111333' fecha = '20261104' estado = 'C' )
      ( id_cita = 'C007' mat_med = 'M005' dni_pac = '45222444' fecha = '20261105' estado = 'P' )
      ( id_cita = 'C008' mat_med = 'M006' dni_pac = '50333555' fecha = '20261105' estado = 'C' )
      ( id_cita = 'C009' mat_med = 'M002' dni_pac = '20111222' fecha = '20261106' estado = 'C' )
      ( id_cita = 'C010' mat_med = 'M003' dni_pac = '25333444' fecha = '20261106' estado = 'A' )
      ( id_cita = 'C011' mat_med = 'M004' dni_pac = '30555666' fecha = '20261107' estado = 'C' )
      ( id_cita = 'C012' mat_med = 'M001' dni_pac = '35777888' fecha = '20261108' estado = 'P' )
    ).

    " =========================================================================
    " PERSISTENCIA EN LA BASE DE DATOS
    " =========================================================================
    DELETE FROM ztb_med_doc.
    MODIFY ztb_med_doc FROM TABLE @lt_medicos.

    DELETE FROM ztb_med_pac.
    MODIFY ztb_med_pac FROM TABLE @lt_pacientes.

    DELETE FROM ztb_med_cit.
    MODIFY ztb_med_cit FROM TABLE @lt_citas.

    out->write( '---------------------------------------------------' ).
    out->write( ' MODELO MÉDICO CARGADO EXITOSAMENTE EN LA BD       ' ).
    out->write( '---------------------------------------------------' ).
    out->write( |Médicos cargados:   { lines( lt_medicos ) }| ).
    out->write( |Pacientes cargados: { lines( lt_pacientes ) }| ).
    out->write( |Citas registradas:  { lines( lt_citas ) }| ).

  ENDMETHOD.
ENDCLASS.
