REPORT ZZ_EXERC07_18.

PARAMETERS: p_num1 type I OBLIGATORY,
           p_num2 type I OBLIGATORY.

START-OF-SELECTION.

PERFORM f_verificaMaior USING p_num1 p_num2.


END-OF-SELECTION.
*&---------------------------------------------------------------------*
*&      Form  F_VERIFICAMAIOR
*&---------------------------------------------------------------------*
*       INDICA O MAIOR NÚMERO ENTRE DOIS PASSADOS.
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*


FORM f_verificamaior USING ip_num1 ip_num2 .

IF ip_num1 = ip_num2.

*WRITE: / 'Não são aceitos valores idênticos.'.

MESSAGE: E208(00) WITH 'Não são aceitos valores idênticos.'.



ENDIF.

IF ip_num1 > ip_num2.

   MESSAGE: S208(00) WITH 'OK'.
   WRITE: / 'Número 1', ip_num1, 'é maior que o número 2', ip_num2.

        ELSE.
             MESSAGE: S208(00) WITH 'OK'.
             WRITE: / 'Número 2', ip_num2, 'é maior que o número 1', ip_num1.

  ENDIF.

ENDFORM.
