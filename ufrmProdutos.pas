unit ufrmProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls,DB,uclassProdutos;

type
  TfrmProdutos = class(TForm)
    grpProdutos: TGroupBox;
    Label1: TLabel;
    edtCod: TEdit;
    Label2: TLabel;
    edtDescricao: TEdit;
    Label3: TLabel;
    edtUnidMed: TEdit;
    Panel1: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    dbnNav: TPanel;
    btnFirst: TButton;
    btnPrior: TButton;
    btnNext: TButton;
    btnLast: TButton;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnControle();
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtCodEnter(Sender: TObject);
    procedure edtCodExit(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    Procedure CarregaEdit;
    procedure edtCodKeyPress(Sender: TObject; var Key: Char);
  private
    Var Produtos : TProduto;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation
uses uDMCadastro, Math;

{$R *.dfm}

procedure TfrmProdutos.BtnControle;
Var I: Integer;
begin
  btnNovo.Enabled           := not (DMCadastro.cdsProdutos.State  in [dsInsert,dsEdit]);
  btnSalvar.Enabled         := DMCadastro.cdsProdutos.State in [dsInsert,dsEdit];
  btnEditar.Enabled         := ( not (DMCadastro.cdsProdutos.State in [dsInsert,dsEdit]) and not (DMCadastro.cdsProdutos.IsEmpty) );
  btnExcluir.Enabled        := ( not (DMCadastro.cdsProdutos.State in [dsInsert,dsEdit]) and not (DMCadastro.cdsProdutos.IsEmpty) );
  dbnNav.Enabled            := not (DMCadastro.cdsProdutos.State  in [dsInsert,dsEdit]);
  for I:=0 to ComponentCount-1 do
   Begin
    If Components[I].ClassType=TDBEdit Then
      TDBEdit(Components[I]).Enabled := (DMCadastro.cdsProdutos.State  in [dsInsert,dsEdit]);
   End;
end;

procedure TfrmProdutos.btnSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
 DMCadastro.cdsProdutos.Open;

 if DMCadastro.cdsProdutos.IsEmpty then
  btnNovoClick(btnNovo)
   Else
    Begin
      Produtos.CarregaDados;
      CarregaEdit;
    End;
 BtnControle
end;

procedure TfrmProdutos.btnNovoClick(Sender: TObject);
begin
 DMCadastro.cdsProdutos.Insert;
 edtCod.Clear;edtDescricao.Clear;edtUnidMed.Clear;
 BtnControle;
 edtCod.SetFocus;
end;

procedure TfrmProdutos.btnSalvarClick(Sender: TObject);
begin
 Produtos.Codigo      := StrToInt(edtCod.Text);
 Produtos.Descricao   := edtDescricao.Text;
 Produtos.UnidMedida  := edtUnidMed.Text;

 Produtos.ValidaDados;
 Produtos.InsereDados;

 BtnControle;
end;

procedure TfrmProdutos.CarregaEdit;
begin
 edtCod.Text       := IntToStr(Produtos.Codigo);
 edtDescricao.Text := Produtos.Descricao;
 edtUnidMed.Text   := Produtos.UnidMedida;
end;

procedure TfrmProdutos.edtCodEnter(Sender: TObject);
begin
 TDBEdit(Sender).Color := clCream;
end;

procedure TfrmProdutos.edtCodExit(Sender: TObject);
begin
 TDBEdit(Sender).Color := clWhite;
end;

procedure TfrmProdutos.edtCodKeyPress(Sender: TObject; var Key: Char);
begin
if  not ( Key in ['0'..'9', Chr(8),','] ) then   Key := #0
end;

procedure TfrmProdutos.btnEditarClick(Sender: TObject);
begin
 DMCadastro.cdsProdutos.Edit;
 BtnControle;
 edtCod.SetFocus;
end;

procedure TfrmProdutos.btnExcluirClick(Sender: TObject);
begin
 If Application.MessageBox('Confirmar a Exclusão','Confirmação',MB_YESNO+MB_ICONQUESTION)=idyes Then
  Begin
   DMCadastro.cdsProdutos.Delete;
   DMCadastro.cdsProdutos.ApplyUpdates(1);
   Produtos.CarregaDados;
   CarregaEdit;
   BtnControle;
  End; 
end;

procedure TfrmProdutos.btnFirstClick(Sender: TObject);
begin
 if TButton(Sender).Name=btnPrior.Name then
  DMCadastro.cdsProdutos.Prior;
 if TButton(Sender).Name=btnFirst.Name then
  DMCadastro.cdsProdutos.First;
 if TButton(Sender).Name=btnNext.Name then
  DMCadastro.cdsProdutos.Next;
 if TButton(Sender).Name=btnLast.Name then
  DMCadastro.cdsProdutos.Last;
 Produtos.CarregaDados;

 CarregaEdit;
end;

procedure TfrmProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMCadastro.cdsProdutos.Close;
  frmProdutos := Nil;
  Action := caFree;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
 Produtos := TProduto.Create();
end;

end.
