REPORT ZZ_EXERC04_18.

* N�o fiz nenhum if, dizendo se foi aprovado ou n�o, pois j� possu�mos um exerc�cio assim.
* Tamb�m n�o criei nenhum form, pois n�o foi necess�rio pela baixa complexidade do algoritmo.
DATA: v_media type char100.

PARAMETERS: p_nota1 TYPE p DECIMALS 2 OBLIGATORY,
            p_nota2 TYPE p DECIMALS 2 OBLIGATORY,
            p_nota3 TYPE p DECIMALS 2 OBLIGATORY,
            p_nota4 TYPE p DECIMALS 2 OBLIGATORY.

START-OF-SELECTION.

v_media = ( p_nota1 + p_nota2 + p_nota3 + p_nota4 ) / 4.

WRITE: / 'A m�dia aritm�tica do aluno foi:', v_media.


END-OF-SELECTION.
