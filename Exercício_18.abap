REPORT ZZ_EXERC18_18.

DATA: v_result type p DECIMALS 2,
      v_hr_ex type i,
      v_acres type p DECIMALS 1.


SELECTION-SCREEN BEGIN OF BLOCK b0 WITH FRAME TITLE text-001.


PARAMETERS: p_sa_hr type p DECIMALS 2,
            p_hr type i.


 SELECTION-SCREEN END OF BLOCK b0.

 START-OF-SELECTION.

 PERFORM: F_calculo.

 END-OF-SELECTION.
*&---------------------------------------------------------------------*
*&      Form  F_CALCULO
*&---------------------------------------------------------------------*
*       text calculo salario p/ horas trabalhadas.
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*

FORM f_calculo .

    IF p_hr <= 40.

    v_result =  p_sa_hr * p_hr.

    WRITE: 'O salário do colaborador é:', v_result.

    ELSE.

      v_acres = '1.5'.

      v_result = p_sa_hr * p_hr.
*      sem as horas extras

      v_hr_ex = p_hr - 40.
*     guardando quantas horas extras


       v_result = v_result + ( v_hr_ex * v_acres ).

       WRITE: 'O salário do colaborador é:', v_result.


    ENDIF.


ENDFORM.
