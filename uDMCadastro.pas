unit uDMCadastro;

interface

uses
  SysUtils, Classes,  DB, SqlExpr, FMTBcd, DBClient, Provider,
   Data.DBXInterBase, Data.DBXMSSQL, Data.Win.ADODB;

type
  TDMCadastro = class(TDataModule)
    ADOConnection1: TADOConnection;
    sqlProdutos: TADOQuery;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    dsProdutos: TDataSource;
    sqlProdutosCodigo: TIntegerField;
    sqlProdutosDescricao: TStringField;
    sqlProdutosUnidMedida: TStringField;
    cdsProdutosCodigo: TIntegerField;
    cdsProdutosDescricao: TStringField;
    cdsProdutosUnidMedida: TStringField;
    sqlAux: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCadastro: TDMCadastro;

implementation

{$R *.dfm}

procedure TDMCadastro.DataModuleCreate(Sender: TObject);
begin
  ADOConnection1.ConnectionString := 'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=usuario;Password=senha;Initial Catalog=Avaliacao;Data Source=localhost;Initial File Name="";Server SPN="";';
  //cdsProdutos.Open;
end;

end.
