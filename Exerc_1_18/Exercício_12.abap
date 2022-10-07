REPORT zz_exerc12_18.

DATA: mult1  TYPE i,
      mult2  TYPE i,
      mult3  TYPE i,
      mult4  TYPE i,
      mult5  TYPE i,
      mult6  TYPE i,
      mult7  TYPE i,
      mult8  TYPE i,
      mult9  TYPE i,
      mult10 TYPE i.

SELECTION-SCREEN BEGIN OF BLOCK b0 WITH FRAME TITLE text-001.
PARAMETERS: p_num TYPE i.
SELECTION-SCREEN END OF BLOCK b0.

START-OF-SELECTION.
  PERFORM f_tabuada.

END-OF-SELECTION.

*&---------------------------------------------------------------------*
*&      Form  F_TABUADA
*&---------------------------------------------------------------------*
*       text formulário de tabuada
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_tabuada .

  mult1  = p_num * 1   .
  mult2  = p_num * 2   .
  mult3  = p_num * 3   .
  mult4  = p_num * 4   .
  mult5  = p_num * 5   .
  mult6  = p_num * 6   .
  mult7  = p_num * 7   .
  mult8  = p_num * 8   .
  mult9  = p_num * 9   .
  mult10 = p_num * 10  .

  WRITE: /'1:', mult1,
        /'2:', mult2,
        /'3:', mult3,
        /'4:', mult4,
        /'5:', mult5,
        /'6:', mult6,
        /'7:', mult7,
        /'8:', mult8,
        /'9:', mult9,
        /'10:', mult10 .


ENDFORM.
