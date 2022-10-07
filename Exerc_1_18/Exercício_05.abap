REPORT ZZ_EXERC05_18.

DATA: v_idade type i,
      v_idade15 type i.

PARAMETERS: p_dat_na type i OBLIGATORY,
            p_y_atu type i OBLIGATORY.



START-OF-SELECTION.

perform f_calculoIdade using v_idade p_dat_na p_y_atu.
perform f_calculo2015 using v_idade v_idade15 p_y_atu.
perform f_msg using v_idade v_idade15.

END-OF-SELECTION.

*&---------------------------------------------------------------------*
*&      Form  F_CALCULOIDADE / F_CALCULO2015
*&---------------------------------------------------------------------*
*       CALCULO DA IDADE DA PESSOA / IDADE ME 2015
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*

FORM f_calculoIdade USING iv_idade ip_date ip_atual.

  iv_idade = ( ip_atual - ip_date ).



ENDFORM.


FORM f_calculo2015 USING iv_idade iv_idade15 ip_atual.

  iv_idade15 = iv_idade - ( ip_atual - 2015 ).

ENDFORM.


FORM f_msg USING iv_idade iv_idade15.

    WRITE: / 'A sua idade é:', iv_idade.
    WRITE: / 'A sua idade em 2015 foi:', iv_idade15.

ENDFORM.
