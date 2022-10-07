REPORT zmm_alv_mat_refug_18.

* mara~matnr
* mara~mtart
* mara~meins
* marc~werks
* mbew~vprsv
* mbew~verpr
* mbew~peinh
* mbew~stprs

*makt~matnr
*makt~maktx

*mseg~matnr
*mseg~werks
*mseg~bwart
*mseg~budat_mkpf
*mseg~menge


TYPES:   BEGIN OF type_matnr, "tipagem dos principais dados do material
         matnr TYPE mara-matnr,
         mtart TYPE mara-mtart,
         meins TYPE mara-meins,
         werks TYPE marc-werks,
         vprsv TYPE mbew-vprsv,
         verpr TYPE mbew-verpr,
         peinh TYPE mbew-peinh,
         stprs TYPE mbew-stprs,
         END OF type_matnr,

         BEGIN OF type_makt, "tipagem da tab de descricao material
         matnr TYPE mara-matnr,
         maktx TYPE makt-maktx,
         END OF type_makt,

         BEGIN OF type_mseg,  "tipagem da tab de documentos do material
         matnr      TYPE  mseg-matnr,
         werks      TYPE  mseg-werks,
         bwart      TYPE  mseg-bwart,
         budat      TYPE  mseg-budat_mkpf,
         menge      TYPE  mseg-menge,
         END OF type_mseg.

DATA: v_werks  TYPE marc-werks, "centro
      v_matnr  TYPE mara-matnr, "material
      v_budat  TYPE mseg-budat_mkpf, "data
      v_smbln  TYPE mseg-smbln,

      t_fieldcat  TYPE  slis_t_fieldcat_alv, "campos de exibição do alv
      wa_fieldcat LIKE LINE OF t_fieldcat,
      wa_layout   TYPE  slis_layout_alv,

      t_out   TYPE TABLE OF ZSMM_VAL_SUC_18, "tabela de saida e a estrutura criada

      t_matnr  TYPE TABLE OF type_matnr, "centro
      wa_matnr LIKE LINE OF t_matnr,

      t_makt  TYPE TABLE OF type_makt, "desc
      wa_makt LIKE LINE OF t_makt,

      t_mseg  TYPE TABLE OF type_mseg,
      wa_mseg LIKE LINE OF t_mseg.


FIELD-SYMBOLS: <lfs_line>  TYPE ZSMM_VAL_SUC_18. "field symbol

SELECTION-SCREEN BEGIN OF BLOCK b0 WITH FRAME TITLE text-s01.
SELECT-OPTIONS: s_werks  FOR  v_werks,
                s_matnr  FOR  v_matnr,
                s_date   FOR  v_budat.

SELECTION-SCREEN END OF BLOCK b0.

START-OF-SELECTION.

PERFORM F_SELECT_DATA.
PERFORM F_SHOW_ALV.

END-OF-SELECTION.



*&---------------------------------------------------------------------*
*&      Form  F_SELECT_DATA
*&---------------------------------------------------------------------*
*       text FORM DE JOIN PARA A SELECAO DOS CAMPOS
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_select_data .

  SELECT  mara~matnr, "seleção dados gerais
          mara~mtart, "dados por centro
          mara~meins, "jogando tabela t_planta
          marc~werks, "buscando na marc, onde campo mara-matnr = marc-matnr
          mbew~vprsv, "buscando mbew, onde campo marc-matnr = mbwe-matnr e
          mbew~verpr, "marc-werks = mbew-bwkey, onde
          mbew~peinh, "mara-matnr = s_mtnr e marc-werks = s_planta
          mbew~stprs
    INTO TABLE @t_matnr
    FROM mara INNER JOIN marc
      ON mara~matnr EQ marc~matnr
    INNER JOIN mbew
    ON marc~matnr EQ mbew~matnr
   AND marc~werks EQ mbew~bwkey
    WHERE mara~matnr IN @s_matnr
      AND marc~werks IN @s_werks.


   IF t_matnr[] IS INITIAL. "verificacao de registro
    MESSAGE e208(00) WITH 'NENHUM REGISTRO ENCONTRADO!'.
  ENDIF.

  SELECT  matnr "selecao descricao pra cada registro
          maktx "por idioma
   INTO TABLE t_makt  FROM makt
   FOR ALL ENTRIES IN t_matnr
   WHERE matnr EQ t_matnr-matnr
    AND  spras EQ sy-langu.


  SELECT matnr "Segmento de documento - material
         werks
         bwart
         budat_mkpf
         menge
      INTO TABLE t_mseg
      FROM mseg
    FOR ALL ENTRIES IN t_matnr
      WHERE matnr EQ t_matnr-matnr
      AND budat_mkpf IN s_date
      AND matnr NE 'MSEG-SMBLN'
      AND bwart NE '552'.

  SORT t_matnr BY matnr. "order
  SORT t_makt  BY matnr.
  SORT t_mseg  BY matnr.


    LOOP AT t_matnr INTO wa_matnr.

     CLEAR: wa_makt, wa_mseg.

    APPEND INITIAL LINE TO t_out ASSIGNING <lfs_line>. "tabela saida assinando field

    MOVE-CORRESPONDING wa_matnr TO <lfs_line>.

      IF wa_matnr-vprsv EQ 'V'.
        <lfs_line>-preco = wa_matnr-verpr / wa_matnr-peinh.
      ELSE.
        <lfs_line>-preco = wa_matnr-stprs / wa_matnr-peinh.
      ENDIF.


    READ TABLE t_makt INTO wa_makt WITH KEY matnr = <lfs_line>-matnr
                                                      BINARY SEARCH.

     IF sy-subrc IS INITIAL.
       <lfs_line>-maktx = wa_makt-maktx.
     ENDIF.

     READ TABLE t_mseg INTO wa_mseg WITH KEY matnr = <lfs_line>-matnr
                                                       BINARY SEARCH.
    IF sy-subrc IS INITIAL.
      <lfs_line>-menge = wa_mseg-menge.
    ENDIF.

    <lfs_line>-total = <lfs_line>-menge * <lfs_line>-preco. "total = quant * prec

  ENDLOOP.

ENDFORM.




*&---------------------------------------------------------------------*
*&      Form  F_SELECT_DATA
*&---------------------------------------------------------------------*
*       text FORM DE EXIBIÇÃO DO NOSSO ALV
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*

FORM f_show_alv.

  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = 'ZSMM_VAL_SUC_18'
      i_client_never_display = abap_true
    CHANGING
      ct_fieldcat            = t_fieldcat
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2.


  wa_layout-colwidth_optimize = abap_true.
  wa_layout-zebra             = abap_true.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      is_layout     = wa_layout
      it_fieldcat   = t_fieldcat
    TABLES
      t_outtab      = t_out
    EXCEPTIONS
      program_error = 1.

  IF sy-subrc IS NOT INITIAL.
*    TRATAMENTO DO ERRO
    MESSAGE e208(00) WITH 'ERRO GERAR O ALV!'.
  ENDIF.


ENDFORM.