unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros: TMenuItem;
    Produtos: TMenuItem;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    procedure ProdutosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
 uses ufrmProdutos,uDMCadastro;
{$R *.dfm}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  DMCadastro.cdsProdutos.Open;
end;

procedure TfrmPrincipal.ProdutosClick(Sender: TObject);
begin
 If Not Assigned(frmProdutos) Then
   frmProdutos := TfrmProdutos.Create(Self);
 frmProdutos.Show;
end;

end.
