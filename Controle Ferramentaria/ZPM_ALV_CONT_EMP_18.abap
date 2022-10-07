REPORT zpm_alv_cont_emp_18.

*ZZNUM
*MATNR
*MENGE
*PARNR
*WERKS
*DATA_EMP
*HORA_EMP
*ZZSTATUS


*declaração de variaveis
DATA: v_matnr TYPE ztpm001_18-matnr,
      v_parnr TYPE ztpm001_18-parnr,
      v_werks TYPE ztpm001_18-werks,
      v_data  TYPE ztpm001_18-data_emp,
      v_stt   TYPE ztpm001_18-zzstatus,
      t_out   TYPE TABLE OF ztpm001_18, "TABELA INTERNA
      wa_out  LIKE LINE OF t_out.  "ESTRUTURA / WORK AREA



INCLUDE  zalv_18_crl_ferr.

SELECTION-SCREEN BEGIN OF BLOCK b0 WITH FRAME TITLE text-s01.
*selecao de opcoes
SELECT-OPTIONS: s_matnr  FOR v_matnr, "material
                s_parnr  FOR v_parnr, "responsvel
                s_werks  FOR v_werks, "centro
                s_data   FOR v_data, "data emp
                s_stt    FOR v_stt. "status

SELECTION-SCREEN END OF BLOCK b0.

START-OF-SELECTION.

  PERFORM f_select_data.
  PERFORM f_show_alv USING 'ztpm001_18'.

END-OF-SELECTION.


*&---------------------------------------------------------------------*
*&      Form  F_SELECT_DATA
*&---------------------------------------------------------------------*
*       text BUSCANDO OS DADOS
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_select_data .

  SELECT mandt
         zznum
         matnr
         menge
         parnr
         werks
         data_emp
         hora_emp
         zzstatus
  INTO TABLE t_out
  FROM ztpm001_18
  WHERE
          matnr      IN  s_matnr
      AND parnr      IN  s_parnr
      AND werks      IN  s_werks
      AND data_emp   IN  s_data
      AND zzstatus   IN  s_stt.


  IF t_out[] IS INITIAL.
    MESSAGE e208(00) WITH 'NENHUM REGISTRO ENCONTRADO!'.
  ENDIF.

  DELETE t_out WHERE zznum IS INITIAL.
  DELETE t_out WHERE matnr IS INITIAL.


ENDFORM.