REPORT zz_exerc17_18.

DATA: v_aux  TYPE i,
      v_imp  TYPE i,
      v_init TYPE i,
      v_fim  TYPE i.


  v_init = 100.
  v_fim = 200.


  WHILE v_init < v_fim.

    v_aux =  v_init MOD 2.

    IF v_aux = 1.

      WRITE: v_init.

    ENDIF.


    v_init = v_init + 1.

  ENDWHILE.
