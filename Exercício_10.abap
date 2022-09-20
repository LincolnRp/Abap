REPORT ZZ_EXERC10_18.


DATA: v_result type p DECIMALS 2,
      v_true type char1 value 'X'.

SELECTION-SCREEN BEGIN OF BLOCK b0 WITH FRAME TITLE text-001.
PARAMETERS: p_num1 type p DECIMALS 2,
            p_num2 type p DECIMALS 2,
            rad_sum RADIOBUTTON GROUP grp1,
            rad_sub RADIOBUTTON GROUP grp1,
            rad_mul RADIOBUTTON GROUP grp1,
            rad_div RADIOBUTTON GROUP grp1,
            rad_res RADIOBUTTON GROUP grp1.
SELECTION-SCREEN END OF BLOCK b0.

START-OF-SELECTION.

PERFORM f_calculo.

END-OF-SELECTION.



*&---------------------------------------------------------------------*
*&      Form  F_CALCULO
*&---------------------------------------------------------------------*
*       text calculo dos numeros
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_calculo .

     if rad_sum =  v_true.
       v_result = p_num1 + p_num2.
       WRITE: / 'A soma dos números é:', v_result.

     elseif  rad_sub = v_true.
        v_result = p_num1 - p_num2.
       WRITE: / 'A subtração dos números é:', v_result.

     elseif  rad_mul = v_true.
        v_result = p_num1 * p_num2.
       WRITE: / 'A multiplicação dos números é:', v_result.

     elseif  rad_div = v_true.
       v_result = p_num1 / p_num2.
       WRITE: / 'A divisão dos números é:', v_result.


     else.
       v_result = p_num1 mod p_num2.
       WRITE: / 'O resto da divisão dos números é:', v_result.

       endif.


ENDFORM.
