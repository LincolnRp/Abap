REPORT zpm_cont_emp_18.


DATA: wa_001    TYPE ztpm001_18,
      lv_number TYPE num10.

SELECTION-SCREEN BEGIN OF BLOCK b0 WITH FRAME TITLE text-tb0.

PARAMETERS: p_num    TYPE ztpm001_18-zznum,
            p_mat    TYPE ztpm001_18-matnr,
            p_qtd    TYPE ztpm001_18-menge,
            p_resp   TYPE ztpm001_18-parnr MATCHCODE OBJECT prem,
            p_centro TYPE ztpm001_18-werks,
            p_data   TYPE ztpm001_18-data_emp DEFAULT sy-datum,
            p_hr     TYPE ztpm001_18-hora_emp DEFAULT sy-uzeit,
            p_stt    TYPE ztpm001_18-zzstatus.

SELECTION-SCREEN END OF BLOCK b0.


INITIALIZATION.
PERFORM f_num_get.



AT SELECTION-SCREEN.

IF p_num IS NOT INITIAL AND p_num NE wa_001-zznum.

SELECT SINGLE zznum
   matnr
   menge
   parnr
   werks
   data_emp
   hora_emp
   zzstatus

   INTO ( p_num, p_mat, p_qtd, p_resp, p_centro, p_data, p_hr, p_stt )
   FROM ztpm001_18
   WHERE zznum EQ p_num.

IF sy-subrc IS NOT INITIAL.
      CLEAR:  p_mat,
              p_qtd,
              p_resp,
              p_centro,
              p_data,
              p_hr,
              p_stt.

      p_data = sy-datum.
      p_hr   = sy-uzeit.

ENDIF.

     wa_001-zznum = p_num.
  ENDIF.


AT SELECTION-SCREEN OUTPUT.

AT SELECTION-SCREEN ON EXIT-COMMAND.


START-OF-SELECTION.

  CLEAR: wa_001.

  wa_001-zznum     = p_num.
  wa_001-matnr     = p_mat.
  wa_001-menge     = p_qtd.
  wa_001-parnr     = p_resp.
  wa_001-werks     = p_centro.
  wa_001-data_emp  = p_data.
  wa_001-hora_emp  = p_hr.
  wa_001-zzstatus  = p_stt.

  SELECT COUNT(*)
  FROM ztpm001_18 UP TO 1 ROWS
  WHERE zznum  EQ p_num.

  IF sy-dbcnt GT 0.
    PERFORM f_update.
    PERFORM f_commit.
  ELSE.
    PERFORM f_insert.
    PERFORM f_commit.
  ENDIF.


END-OF-SELECTION.


*&---------------------------------------------------------------------*
*&      Form  F_NUM_GET
*&---------------------------------------------------------------------*
*       text PERFORM DA CALLFUNCTION DE GERACAO NUM
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_num_get .

CALL FUNCTION 'NUMBER_GET_NEXT'
    EXPORTING
      nr_range_nr             = '18' " => TROCAR PELO SEU COD. ALUNO
      object                  = 'ZNUMPM0001' "=> USAR ESSE OBJETO!
    IMPORTING
      number                  = lv_number "NUMERO GERADO PARA O CONTROLE
    EXCEPTIONS
      interval_not_found      = 1
      number_range_not_intern = 2
      object_not_found        = 3
      quantity_is_0           = 4
      quantity_is_not_1       = 5
      interval_overflow       = 6
      buffer_overflow         = 7.

      p_num = lv_number.
      p_mat      =  p_mat   .
      p_qtd      =  p_qtd   .
      p_resp     =  p_resp  .
      p_centro   =  p_centro.
      p_stt      =  p_stt   .

ENDFORM.




*&---------------------------------------------------------------------*
*&      Form  F_INSERT
*&---------------------------------------------------------------------*
*       text FORM PARA INSERÇÃO DE DADOS DE EMPRESTIMO
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_insert .

  INSERT ztpm001_18 FROM wa_001.

ENDFORM.



*&---------------------------------------------------------------------*
*&      Form  F_UPDATE
*&---------------------------------------------------------------------*
*       text FORM PARA MODIFICAR/ALTERAR DADOS DE EMPRESTIMO
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_update .

  MODIFY  ztpm001_18 FROM wa_001.

ENDFORM.



*&---------------------------------------------------------------------*
*&      Form  F_COMMIT
*&---------------------------------------------------------------------*
*       text FORM PARA COMMITAR NOSSOS DADOS DE EMPRESTIMO
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*

FORM f_commit.
  IF sy-subrc EQ 0.
    COMMIT WORK AND WAIT.
    MESSAGE s208(00) WITH 'SALVO COM SUCESSO!'.

  ELSE.
    ROLLBACK WORK.
    MESSAGE s001(z00) WITH 'ERRO AO GRAVAR!' DISPLAY LIKE 'E'.

  ENDIF.
ENDFORM.