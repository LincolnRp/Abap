REPORT zz_exerc08_18.
DATA: v_resto TYPE p DECIMALS 2.


PARAMETERS: p_num TYPE i.

START-OF-SELECTION.
PERFORM verifica_num USING p_num.
END-OF-SELECTION.

*&---------------------------------------------------------------------*
*&      Form  VERIFICA_NUM
*&---------------------------------------------------------------------*
*       text form verificação paridade do número
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*


FORM verifica_num USING ip_num.

  v_resto = ip_num MOD 2.

  IF v_resto = 0.
    WRITE: / 'O número:', ip_num, 'é par'.
  ELSE.
    WRITE: / 'O número:', ip_num, 'é impar'.
  ENDIF.



ENDFORM.
