object frmProdutos: TfrmProdutos
  Left = 431
  Top = 204
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produtos'
  ClientHeight = 227
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grpProdutos: TGroupBox
    Left = 0
    Top = 0
    Width = 686
    Height = 145
    Align = alTop
    Caption = 'Cadastro de Produtos'
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = -8
    ExplicitWidth = 672
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 41
      Height = 13
      Caption = 'Cod'#237'go :'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 54
      Height = 13
      Caption = 'Descri'#231#227'o :'
    end
    object Label3: TLabel
      Left = 16
      Top = 80
      Width = 81
      Height = 13
      Caption = 'Unid. de Medida:'
    end
    object edtCod: TEdit
      Left = 102
      Top = 29
      Width = 131
      Height = 21
      MaxLength = 8
      TabOrder = 0
      OnEnter = edtCodEnter
      OnExit = edtCodExit
      OnKeyPress = edtCodKeyPress
    end
    object edtDescricao: TEdit
      Left = 102
      Top = 53
      Width = 292
      Height = 21
      MaxLength = 150
      TabOrder = 1
      OnEnter = edtCodEnter
      OnExit = edtCodExit
    end
    object edtUnidMed: TEdit
      Left = 102
      Top = 77
      Width = 43
      Height = 21
      MaxLength = 2
      TabOrder = 2
      OnEnter = edtCodEnter
      OnExit = edtCodExit
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 145
    Width = 686
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 160
    ExplicitWidth = 665
    object btnNovo: TButton
      Left = 63
      Top = 8
      Width = 90
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnSalvar: TButton
      Left = 163
      Top = 8
      Width = 90
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarClick
    end
    object btnEditar: TButton
      Left = 264
      Top = 8
      Width = 90
      Height = 25
      Caption = 'Editar'
      TabOrder = 2
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 365
      Top = 8
      Width = 90
      Height = 25
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
    object btnSair: TButton
      Left = 463
      Top = 8
      Width = 90
      Height = 25
      Caption = 'Sair'
      TabOrder = 4
      OnClick = btnSairClick
    end
  end
  object dbnNav: TPanel
    Left = 0
    Top = 186
    Width = 686
    Height = 34
    Align = alTop
    TabOrder = 2
    ExplicitLeft = 203
    ExplicitTop = 212
    ExplicitWidth = 252
    object btnFirst: TButton
      Left = 221
      Top = 6
      Width = 49
      Height = 25
      Caption = '<<'
      TabOrder = 0
      OnClick = btnFirstClick
    end
    object btnPrior: TButton
      Left = 269
      Top = 6
      Width = 49
      Height = 25
      Caption = '<'
      TabOrder = 1
      OnClick = btnFirstClick
    end
    object btnNext: TButton
      Left = 317
      Top = 6
      Width = 49
      Height = 25
      Caption = '>'
      TabOrder = 2
      OnClick = btnFirstClick
    end
    object btnLast: TButton
      Left = 365
      Top = 6
      Width = 49
      Height = 25
      Caption = '>>'
      TabOrder = 3
      OnClick = btnFirstClick
    end
  end
end
