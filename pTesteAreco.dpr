program pTesteAreco;



uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  uDMCadastro in 'uDMCadastro.pas' {DMCadastro: TDataModule},
  ufrmProdutos in 'ufrmProdutos.pas' {frmProdutos},
  uClassProdutos in 'uClassProdutos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Teste Areco';
  Application.CreateForm(TDMCadastro, DMCadastro);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
