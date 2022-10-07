REPORT zz_exerc02_18.

*Fiz um perform para cada exe para treinar o uso, porém poderia ter feito apenas um perform e englobar todos.

DATA: v_a      TYPE i,
      v_b      TYPE i,
      v_c      TYPE i,
      v_result TYPE char100.

v_a = 3.
v_b = 2.
v_c = 5.

START-OF-SELECTION.

  PERFORM exe_2_a USING v_a
                        v_b.

  PERFORM exe_2_b USING v_a
                        v_b.

  PERFORM exe_2_c USING v_a
                      v_b
                      v_c.

  PERFORM exe_2_d USING v_a
                    v_b.

  PERFORM exe_2_e USING v_a
                        v_b.

  PERFORM exe_2_f USING v_a
                      v_b
                      v_c.

END-OF-SELECTION.

*Exercício 2-a (A>B).
FORM exe_2_a USING iv_a
                   iv_b.

  IF iv_a > iv_b.

    WRITE:/'2-a) A variável A é maior que a variável B.'.
  ELSE.
    WRITE:/ '2-a) A variável B é maior que a variável A.'.

  ENDIF.

ENDFORM.


*Exercício 2-b (B = A).
FORM exe_2_b USING iv_a
                   iv_b.
  IF iv_a = iv_b.

    WRITE:/ '2-b) A variável A é igual  a variável B.'.
  ELSE.
    WRITE:/ '2-b) A variável A não é igual a variável B.'.

  ENDIF.
ENDFORM.

*Exercício 2-c (A >= B) AND (C <> 5).
FORM exe_2_c USING iv_a iv_b iv_c.
  IF iv_a >= iv_b AND iv_c <> 5.

    WRITE: /'2-c) A variável A é maior ou igual que a variável B e a variável C é diferente de 5.'.
  ELSE.
    WRITE:/ '2-c) A variável A não é maior nem igual a variável B e a variável C é igual a 5.'.

  ENDIF.
ENDFORM.


*Exercício 2-d (B < A) OR (A = 3).
FORM exe_2_d USING iv_a iv_b.
  IF iv_b < v_a OR iv_a = 3.

    WRITE: /'2-d) A variável B é menor que a variável A ou a variável A é igual a 3'.

  ELSE.

    WRITE:/ '2-d) A variável B não é menor que a variável A e a variável A não é igual a 3'.

  ENDIF.
ENDFORM.


*Exercício 2-e (A > B) OR (A = 3).
FORM exe_2_e USING iv_a iv_b.
  IF iv_a > iv_b OR iv_a = 3.

    WRITE: /'2-e) A variável A é maior que a variável B ou a variável A é igual a 3'.

  ELSE.

    WRITE:/ '2-e) A variável A não é maior que a variável B e a variável A não é igual a 3'.

  ENDIF.
ENDFORM.



*Exercício 2-f (C <= 7) AND (B > 0) AND (C > A).
FORM exe_2_f USING iv_a iv_b iv_c.
  IF iv_c <= 7 AND iv_b > 0 AND iv_c > v_a.

    WRITE: /'2-f) A variável C é menor ou igual a 7, a variável B é maior que 0 e a variável C é maior que a variável A'.

  ELSE.

    WRITE:/ '2-f) A variável C não é menor ou igual a 7, a variável B não é maior que 0 e a variável C não é maior que a variável A'.

  ENDIF.
ENDFORM.
