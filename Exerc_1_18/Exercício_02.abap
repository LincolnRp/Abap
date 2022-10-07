REPORT zz_exerc02_18.

*Fiz um perform para cada exe para treinar o uso, por�m poderia ter feito apenas um perform e englobar todos.

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

*Exerc�cio 2-a (A>B).
FORM exe_2_a USING iv_a
                   iv_b.

  IF iv_a > iv_b.

    WRITE:/'2-a) A vari�vel A � maior que a vari�vel B.'.
  ELSE.
    WRITE:/ '2-a) A vari�vel B � maior que a vari�vel A.'.

  ENDIF.

ENDFORM.


*Exerc�cio 2-b (B = A).
FORM exe_2_b USING iv_a
                   iv_b.
  IF iv_a = iv_b.

    WRITE:/ '2-b) A vari�vel A � igual  a vari�vel B.'.
  ELSE.
    WRITE:/ '2-b) A vari�vel A n�o � igual a vari�vel B.'.

  ENDIF.
ENDFORM.

*Exerc�cio 2-c (A >= B) AND (C <> 5).
FORM exe_2_c USING iv_a iv_b iv_c.
  IF iv_a >= iv_b AND iv_c <> 5.

    WRITE: /'2-c) A vari�vel A � maior ou igual que a vari�vel B e a vari�vel C � diferente de 5.'.
  ELSE.
    WRITE:/ '2-c) A vari�vel A n�o � maior nem igual a vari�vel B e a vari�vel C � igual a 5.'.

  ENDIF.
ENDFORM.


*Exerc�cio 2-d (B < A) OR (A = 3).
FORM exe_2_d USING iv_a iv_b.
  IF iv_b < v_a OR iv_a = 3.

    WRITE: /'2-d) A vari�vel B � menor que a vari�vel A ou a vari�vel A � igual a 3'.

  ELSE.

    WRITE:/ '2-d) A vari�vel B n�o � menor que a vari�vel A e a vari�vel A n�o � igual a 3'.

  ENDIF.
ENDFORM.


*Exerc�cio 2-e (A > B) OR (A = 3).
FORM exe_2_e USING iv_a iv_b.
  IF iv_a > iv_b OR iv_a = 3.

    WRITE: /'2-e) A vari�vel A � maior que a vari�vel B ou a vari�vel A � igual a 3'.

  ELSE.

    WRITE:/ '2-e) A vari�vel A n�o � maior que a vari�vel B e a vari�vel A n�o � igual a 3'.

  ENDIF.
ENDFORM.



*Exerc�cio 2-f (C <= 7) AND (B > 0) AND (C > A).
FORM exe_2_f USING iv_a iv_b iv_c.
  IF iv_c <= 7 AND iv_b > 0 AND iv_c > v_a.

    WRITE: /'2-f) A vari�vel C � menor ou igual a 7, a vari�vel B � maior que 0 e a vari�vel C � maior que a vari�vel A'.

  ELSE.

    WRITE:/ '2-f) A vari�vel C n�o � menor ou igual a 7, a vari�vel B n�o � maior que 0 e a vari�vel C n�o � maior que a vari�vel A'.

  ENDIF.
ENDFORM.
