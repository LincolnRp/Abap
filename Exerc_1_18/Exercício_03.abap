REPORT ZZ_EXERC03_18.

DATA: v_result type char100.

PARAMETERS: p_altura type p DECIMALS 2 OBLIGATORY,
            p_base type p DECIMALS 2 OBLIGATORY.

START-OF-SELECTION.

PERFORM f_calculo USING p_altura p_base.


END-OF-SELECTION.

*&---------------------------------------------------------------------*
*&      Form  F_CALCULO
*&---------------------------------------------------------------------*
*       CÁLCULO DA ÁREA DO TRIÂNGULO
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_calculo USING ip_altura ip_base .

v_result = ( ( p_altura * p_base ) / 2 ).

WRITE: / 'A área do triângulo é:', v_result.


ENDFORM.
