REPORT zz_exerc11_18.

DATA: v_numero TYPE i.
v_numero = 1.

START-OF-SELECTION.
  PERFORM f_loop.

END-OF-SELECTION.


*&---------------------------------------------------------------------*
*&      Form  F_LOOP
*&---------------------------------------------------------------------*
*       text form para looping while.
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_loop .
*looping acontece enquanto a variavel for menor ou igual a 100.
  WHILE v_numero <= 100.

    WRITE: v_numero.

    v_numero = v_numero + 1.

  ENDWHILE.
ENDFORM.
