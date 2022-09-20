REPORT zz_exerc08_18.
DATA: v_resto TYPE p DECIMALS 2.


PARAMETERS: p_num TYPE i.

START-OF-SELECTION.
PERFORM verifica_num USING p_num.
END-OF-SELECTION.

*&---------------------------------------------------------------------*
*&      Form  VERIFICA_NUM
*&---------------------------------------------------------------------*
*       text form verifica��o paridade do n�mero
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*


FORM verifica_num USING ip_num.

  v_resto = ip_num MOD 2.

  IF v_resto = 0.
    WRITE: / 'O n�mero:', ip_num, '� par'.
  ELSE.
    WRITE: / 'O n�mero:', ip_num, '� impar'.
  ENDIF.



ENDFORM.
