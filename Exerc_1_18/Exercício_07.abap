REPORT ZZ_EXERC07_18.

PARAMETERS: p_num1 type I OBLIGATORY,
           p_num2 type I OBLIGATORY.

START-OF-SELECTION.

PERFORM f_verificaMaior USING p_num1 p_num2.


END-OF-SELECTION.
*&---------------------------------------------------------------------*
*&      Form  F_VERIFICAMAIOR
*&---------------------------------------------------------------------*
*       INDICA O MAIOR N�MERO ENTRE DOIS PASSADOS.
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*


FORM f_verificamaior USING ip_num1 ip_num2 .

IF ip_num1 = ip_num2.

*WRITE: / 'N�o s�o aceitos valores id�nticos.'.

MESSAGE: E208(00) WITH 'N�o s�o aceitos valores id�nticos.'.



ENDIF.

IF ip_num1 > ip_num2.

   MESSAGE: S208(00) WITH 'OK'.
   WRITE: / 'N�mero 1', ip_num1, '� maior que o n�mero 2', ip_num2.

        ELSE.
             MESSAGE: S208(00) WITH 'OK'.
             WRITE: / 'N�mero 2', ip_num2, '� maior que o n�mero 1', ip_num1.

  ENDIF.

ENDFORM.
