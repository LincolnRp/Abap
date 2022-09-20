REPORT ZZ_EXERC16_18.

data: v_init type i,
      v_fim type i,
      v_indice type i,
      v_result type i.


 v_init = 1.
 v_fim = 500.
 v_result = 0.
 v_indice = 0.


 START-OF-SELECTION.
 PERFORM: F_LOOP.
  END-OF-SELECTION.


*&---------------------------------------------------------------------*
*&      Form  F_LOOP
*&---------------------------------------------------------------------*
*       text LOOP MULT DE 3.
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*

FORM f_loop .

  WHILE v_init <= v_fim.

      v_indice = v_init mod 3.

      IF v_indice = 0.
         v_result = v_result + v_init.
       ENDIF.

       v_init = v_init + 1.

    ENDWHILE.



WRITE: / 'A soma dos números é:', v_result.

ENDFORM.
