REPORT zhr_controle_col18.

*ZZ_RE
*ZZ_NOME_EMP
*ZZ_CARGO
*ZZ_STATUS_EMP
*ZZ_DATA_CAD

DATA: wa_001 TYPE zhr001_18."ok
*MATCHCODE OBJECT ZHP_RE_00 se11 => ajuda => criar mathcode
SELECTION-SCREEN BEGIN OF BLOCK b0 WITH FRAME TITLE text-tb0.
PARAMETERS: p_re    TYPE zhr001_18-zz_re OBLIGATORY, "ok
            p_nome  TYPE zhr001_18-zz_nome_emp,
            p_cargo TYPE zhr001_18-zz_cargo,
            p_stt   TYPE zhr001_18-zz_status_emp ,
            p_dtc   TYPE zhr001_18-zz_data_cad.
SELECTION-SCREEN END OF BLOCK b0.


INITIALIZATION.


AT SELECTION-SCREEN.

  IF p_re IS NOT INITIAL
    AND p_re NE wa_001-zz_re.
    SELECT SINGLE zz_re
                  zz_nome_emp
                  zz_status_emp
                  zz_data_cad
                  zz_cargo
*      adicionando os dados do select diretamente nos campos
          INTO (p_re, p_nome, p_stt, p_dtc, p_cargo )
          FROM zhr001_18
          WHERE zz_re  EQ p_re.

    IF sy-subrc IS NOT INITIAL.
      CLEAR:  p_nome,
              p_stt,
              p_dtc,
              p_cargo.
    ELSE.
*      wa_001-zz_re = p_re.
    ENDIF.

    wa_001-zz_re = p_re.
  ENDIF.



AT SELECTION-SCREEN OUTPUT.


AT SELECTION-SCREEN ON EXIT-COMMAND.


START-OF-SELECTION. "ok

  CLEAR: wa_001.

  wa_001-zz_re         = p_re.
  wa_001-zz_nome_emp   = p_nome.
  wa_001-zz_cargo      = p_cargo.
  wa_001-zz_status_emp = p_stt.
  wa_001-zz_data_cad   = p_dtc.


  SELECT COUNT(*)
    FROM zhr001_18 UP TO 1 ROWS
  WHERE zz_re  EQ p_re.
*variavél de sistema verificando se esse select trouxe algo.
  IF sy-dbcnt GT 0.
    PERFORM f_update.
    PERFORM f_commit.
  ELSE.
    PERFORM f_insert.
    PERFORM f_commit.
  ENDIF.



*&---------------------------------------------------------------------*
*&      Form  F_INSERT
*&---------------------------------------------------------------------*
*       Inserir colaborador na tabela zhr001_18
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_insert.

*  MODIFY zhr001_00 FROM wa_001. "
  INSERT zhr001_18 FROM wa_001. "ok


ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  F_UPDATE
*&---------------------------------------------------------------------*
*       text formulário para modificação da workarea wa_001 para a table.
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_update .
  MODIFY zhr001_18 FROM wa_001.
ENDFORM.

*commit modulizado para uso no create/update
FORM f_commit.
  IF sy-subrc EQ 0.
    COMMIT WORK AND WAIT.
    MESSAGE s208(00) WITH 'SALVO COM SUCESSO!'.
  ELSE.
    ROLLBACK WORK.
    MESSAGE s001(z00) WITH 'ERRO AO GRAVAR!' DISPLAY LIKE 'E'.
  ENDIF.
ENDFORM.
