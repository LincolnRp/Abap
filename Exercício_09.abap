REPORT ZZ_EXERC09_18.

DATA: v_pe_masc type p DECIMALS 1,
      v_pe_fem type p DECIMALS 1,
      v_ideal_m type i,
      v_ideal_f type p DECIMALS 1,
      v_result type p DECIMALS 2,
      v_true type char1 value 'X'.


*PARAMETERS: p_sexua type ZE_SEXUALIDADE.
*com o elemento de dados criado.

SELECTION-SCREEN BEGIN OF BLOCK b0 WITH FRAME TITLE text-001.
PARAMETERS: p_altura type p DECIMALS 2 OBLIGATORY,
            rad_mas RADIOBUTTON GROUP grp1,
            rad_fem RADIOBUTTON GROUP grp1.
SELECTION-SCREEN END OF BLOCK b0.
*com buttons radio para melhor entendimento do usuário

v_pe_masc = '72.7'.
v_pe_fem = '62.1'.
v_ideal_m = '58'.
v_ideal_f = '44.7'.

START-OF-SELECTION.
PERFORM f_calculo.
END-OF-SELECTION.

*&---------------------------------------------------------------------*
*&      Form  F_CALCULO
*&---------------------------------------------------------------------*
*       text perform para calculo do peso
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_calculo .

    IF rad_mas = v_true.
      v_result = ( v_pe_masc * p_altura ) - v_ideal_m.

    WRITE: / 'Seu peso ideial é:', v_result.
    ELSE.
    v_result = ( v_pe_fem * p_altura ) - v_ideal_f.

    WRITE: / 'Seu peso ideial é:', v_result.

    ENDIF.




ENDFORM.
