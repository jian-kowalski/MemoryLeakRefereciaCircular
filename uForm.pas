unit uForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }

    procedure  ChamarVazamento;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uClasseItemNota;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ChamarVazamento;
end;

procedure TForm1.ChamarVazamento;
begin
  ShowMessage(
    TNota.New(
    ).Item
     .DescricaoDoItem
  );
end;

end.
