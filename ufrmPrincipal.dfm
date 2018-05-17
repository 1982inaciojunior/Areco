object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 394
  ClientWidth = 960
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 744
    Top = 0
    Width = 216
    Height = 394
    Align = alRight
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 68
      Height = 13
      Caption = 'Lista Produtos'
    end
    object DBGrid1: TDBGrid
      Left = 10
      Top = 24
      Width = 191
      Height = 169
      DataSource = DMCadastro.dsProdutos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object MainMenu1: TMainMenu
    Left = 128
    Top = 24
    object Cadastros: TMenuItem
      Caption = 'Cadastros'
      object Produtos: TMenuItem
        Caption = 'Produtos'
        OnClick = ProdutosClick
      end
    end
  end
end
