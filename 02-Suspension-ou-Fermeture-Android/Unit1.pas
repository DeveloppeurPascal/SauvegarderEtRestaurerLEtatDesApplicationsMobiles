unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TForm1 = class(TForm)
    Rectangle1: TRectangle;
    Timer1: TTimer;
    rBackground: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Déclarations privées }
    fnombre: integer;
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Rectangle1.Width := 0;
  fnombre := 10;
  Timer1.Enabled := true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Rectangle1.Width := Rectangle1.Width + fnombre;
  if ((Rectangle1.Width > rBackground.Width) and (fnombre > 0)) or
    ((Rectangle1.Width < abs(fnombre) + 1) and (fnombre < 0)) then
    fnombre := -fnombre;
end;

end.
