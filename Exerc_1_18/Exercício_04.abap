REPORT ZZ_EXERC04_18.

* Não fiz nenhum if, dizendo se foi aprovado ou não, pois já possuímos um exercício assim.
* Também não criei nenhum form, pois não foi necessário pela baixa complexidade do algoritmo.
DATA: v_media type char100.

PARAMETERS: p_nota1 TYPE p DECIMALS 2 OBLIGATORY,
            p_nota2 TYPE p DECIMALS 2 OBLIGATORY,
            p_nota3 TYPE p DECIMALS 2 OBLIGATORY,
            p_nota4 TYPE p DECIMALS 2 OBLIGATORY.

START-OF-SELECTION.

v_media = ( p_nota1 + p_nota2 + p_nota3 + p_nota4 ) / 4.

WRITE: / 'A média aritmética do aluno foi:', v_media.


END-OF-SELECTION.
