REPORT zz_exerc14_18.

DATA: v_input TYPE i,
      v_asc   TYPE i.


SELECTION-SCREEN BEGIN OF BLOCK b0 WITH FRAME TITLE text-001.

PARAMETERS: p_num1 TYPE i,
            p_num2 TYPE i.
SELECTION-SCREEN END OF BLOCK b0.

START-OF-SELECTION.

  PERFORM: f_loops.

END-OF-SELECTION.



*&---------------------------------------------------------------------*
*&      Form  F_LOOPS
*&---------------------------------------------------------------------*
*       text form de loops asc/dec.
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*


FORM f_loops .

  IF p_num2 > p_num1.
    MESSAGE s001(z00) WITH 'NÚMERO 2 NÃO PODE SER MAIOR' DISPLAY LIKE 'E'.
    EXIT.
  ENDIF.


  v_input = p_num1.


  WHILE p_num1 => p_num2.

    WRITE:/ 'Decrescente:', p_num1.

    p_num1 = p_num1 - 1.
  ENDWHILE.




  v_asc = p_num1.

  WHILE v_asc <=  v_input.

    WRITE:/ 'Ascendente:', v_asc.

    v_asc = v_asc + 1.


  ENDWHILE.


ENDFORM.
