REPORT ZZ_EXERC06_18.

PARAMETERS: p_valor type p DECIMALS 2 OBLIGATORY.

*> GT
*< LT
*>= GE
*<= LE

START-OF-SELECTION.

PERFORM f_verificaCondicional USING p_valor.


END-OF-SELECTION.


*&---------------------------------------------------------------------*
*&      Form  F_VERIFICACONDICIONAL
*&---------------------------------------------------------------------*
*       VERIFICA CONDICIONAL 3
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*

FORM f_verificacondicional USING ip_valor .

IF ip_valor <= 3.

      WRITE: / 'Seu valor � menor ou igual 3, parab�ns !', ip_valor.

  ELSE.

     WRITE: / 'N�o foi poss�vel imprimir o seu valor !'.

    ENDIF.

ENDFORM.
