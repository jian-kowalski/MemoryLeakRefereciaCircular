program uMemoryLeak;

uses
  Vcl.Forms,
  uForm in 'uForm.pas' {Form1},
  uClasseItemNota in 'uClasseItemNota.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
