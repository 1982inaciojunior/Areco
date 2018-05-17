unit uClassProdutos;

interface
type TProduto = Class

private
FCodigo:Integer;
FDescricao: String;
FUnidMedida:String;

procedure SetCodigo(const Value:Integer);
procedure SetDescricao(const Value: String);
procedure SetUnidMedida(const Value: String);

public
property Codigo:integer read FCodigo write SetCodigo;
property Descricao:String read FDescricao write SetDescricao;
property UnidMedida:String read FUnidMedida write SetUnidMedida;
Procedure CarregaDados();
Procedure InsereDados();
Procedure ValidaDados();


end;

implementation
uses udmcadastro,Forms,SysUtils,Windows,DB;
{ TProduto }

procedure TProduto.CarregaDados;
begin
 //DMCadastro.cdsProdutos.Open;
 Codigo     := DMCadastro.cdsProdutosCodigo.AsInteger;
 Descricao  := DMCadastro.cdsProdutosDescricao.AsString;
 UnidMedida := DMCadastro.cdsProdutosUnidMedida.AsString;

end;

procedure TProduto.InsereDados;
begin
 DMCadastro.cdsProdutosCodigo.AsInteger    := Codigo;
 DMCadastro.cdsProdutosDescricao.AsString  := Descricao;
 DMCadastro.cdsProdutosUnidMedida.AsString := UnidMedida;
 DMCadastro.cdsProdutos.Post;
 DMCadastro.cdsProdutos.ApplyUpdates(1);
end;

procedure TProduto.SetCodigo(const Value: Integer);
begin
 if DMCadastro.cdsProdutos.State  in [dsInsert] then
  Begin
   DMCadastro.sqlAux.Close;
   DMCadastro.sqlAux.SQL.Clear;
   DMCadastro.sqlAux.SQL.Add('select * from Produtos where codigo='+IntToStr(Value));
   DMCadastro.sqlAux.Open;
   if Not DMCadastro.sqlAux.isEmpty then
    Begin
      Application.MessageBox('Codígo já Cadastrado','Erro',mb_IconError);
      Abort;
    End
     else
       FCodigo := value;
  End
   else
     FCodigo := value;
end;

procedure TProduto.SetDescricao(const Value: String);
begin
 FDescricao := value;
end;

procedure TProduto.SetUnidMedida(const Value: String);
begin
   FUnidMedida := Value;
end;

procedure TProduto.ValidaDados;
begin
 If Codigo<=0 Then
  Begin
   Application.MessageBox('Campo Codígo é obrigatorio','Erro',mb_IconError);
   Abort;
  End;

 If trim(Descricao)='' Then
  Begin
   Application.MessageBox('Campo Descrição é obrigatorio','Erro',mb_IconError);
   Abort;
  End;

 If trim(UnidMedida)='' Then
  Begin
   Application.MessageBox('Campo Unidade de Medida é Obrigatorio','Erro',mb_IconError);
   Abort;
  End;
end;

end.
