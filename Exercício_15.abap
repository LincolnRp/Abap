REPORT zz_exerc15_18.

DATA: v_soma  TYPE p DECIMALS 2,
      v_med   TYPE p DECIMALS 2,
      v_maior TYPE p DECIMALS 2,
      v_menor TYPE p DECIMALS 2,
      v_med_p TYPE p DECIMALS 2.


SELECTION-SCREEN BEGIN OF BLOCK b0 WITH FRAME TITLE text-001.

PARAMETERS: p_num1 TYPE i,
            p_num2 TYPE i,
            p_num3 TYPE i,
            p_num4 TYPE i,
            p_num5 TYPE i.

SELECTION-SCREEN END OF BLOCK b0.

START-OF-SELECTION.
  PERFORM f_calculos.

END-OF-SELECTION.


*&---------------------------------------------------------------------*
*&      Form  F_CALCULOS
*&---------------------------------------------------------------------*
*       text form de calculos
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*

FORM f_calculos .

  v_soma =  p_num1 + p_num2 + p_num3 + p_num4 + p_num5.
  v_med = ( p_num1 + p_num2 + p_num3 + p_num4 + p_num5 ) / 5.

  v_maior = p_num1.
  v_menor = p_num1.


* MAIOR

  IF v_maior < p_num2.
    v_maior = p_num2.
  ENDIF.

  IF v_maior < p_num3.
    v_maior = p_num3.
  ENDIF.

  IF v_maior < p_num4.
    v_maior = p_num4.
  ENDIF.

  IF v_maior < p_num5.
    v_maior = p_num5.
  ENDIF.


*  MENOR


  IF v_menor > p_num2.
    v_maior = p_num2.
  ENDIF.

  IF v_menor > p_num3.
    v_maior = p_num3.
  ENDIF.

  IF v_menor > p_num4.
    v_maior = p_num4.
  ENDIF.

  IF v_menor > p_num5.
    v_maior = p_num5.
  ENDIF.


* media pared
    v_med_p = 0.

  IF ( p_num1 MOD 2 ) = 0.
    v_med_p = p_num1.
  ENDIF.

  IF ( p_num2 MOD 2 ) = 0.
    v_med_p =  v_med_p + p_num2.
  ENDIF.

  IF ( p_num3 MOD 2 ) = 0.
    v_med_p = v_med_p + p_num3.
  ENDIF.

  IF ( p_num4 MOD 2 ) = 0.
    v_med_p = v_med_p + p_num4.
  ENDIF.

  IF ( p_num5 MOD 2 ) = 0.
    v_med_p = v_med_p + p_num5.
  ENDIF.

   v_med_p = v_med_p / 5.

  WRITE: 'Soma:', v_soma,
         /'Media:', v_med,
         /'Maior:', v_maior,
         /'Menor:', v_menor,
         /'Media pares:', v_med_p.







ENDFORM.
