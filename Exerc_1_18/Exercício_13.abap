REPORT zz_exerc13_18.

DATA: v_multiplo TYPE i,
      v_resto     TYPE i,
      v_resultado     TYPE i.

SELECTION-SCREEN BEGIN OF BLOCK b0 WITH FRAME TITLE text-001.

PARAMETERS: p_num TYPE i.

SELECTION-SCREEN END OF BLOCK b0.

START-OF-SELECTION.
    v_multiplo = 1.
  PERFORM f_multiplos.

END-OF-SELECTION.


*&---------------------------------------------------------------------*
*&      Form  F_MULTIPLOS
*&---------------------------------------------------------------------*
*       text formulário impressão números multiplos de 2
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*

FORM f_multiplos .

  WHILE v_multiplo <= p_num.

    v_resto = v_multiplo MOD 2.

    IF ( v_resto = 0 ).
      WRITE: v_multiplo.
    ENDIF.

 v_multiplo = v_multiplo + 1.

  ENDWHILE.



ENDFORM.
