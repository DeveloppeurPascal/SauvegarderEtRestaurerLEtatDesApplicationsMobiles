unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    btnShowLog: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnShowLogClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses fLog;

procedure TForm2.btnShowLogClick(Sender: TObject);
begin
  frmlog.Show;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  LogAdd('unit2 - FormActivate');
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LogAdd('unit2 - FormClose');
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  LogAdd('unit2 - FormCloseQuery');
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  LogAdd('unit2 - FormCreate');
end;

procedure TForm2.FormDeactivate(Sender: TObject);
begin
  LogAdd('unit2 - FormDeactivate');
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  LogAdd('unit2 - FormDestroy');
end;

procedure TForm2.FormHide(Sender: TObject);
begin
  LogAdd('unit2 - FormHide');
end;

procedure TForm2.FormResize(Sender: TObject);
begin
  LogAdd('unit2 - FormResize');
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  LogAdd('unit2 - FormShow');
end;

initialization

LogAdd('unit2 - initialization');

finalization

LogAdd('unit2 - finalization');

end.
