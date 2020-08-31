unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Platform;

type
  TForm1 = class(TForm)
    btnShowForm2Modal: TButton;
    btnShowLog: TButton;
    btnShowForm2: TButton;
    Layout1: TLayout;
    procedure btnShowForm2ModalClick(Sender: TObject);
    procedure btnShowLogClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnShowForm2Click(Sender: TObject);
    procedure FormSaveState(Sender: TObject);
  private
    { Déclarations privées }
    function ApplicationEventService(AAppEvent: TApplicationEvent;
      AContext: TObject): Boolean;
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses Unit2, fLog;

procedure TForm1.btnShowLogClick(Sender: TObject);
begin
  frmLog.Show;
end;

function TForm1.ApplicationEventService(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
begin
  case AAppEvent of // liste des événements traités par Delphi 10.4 Sydney
    TApplicationEvent.FinishedLaunching:
      LogAdd('unit1 - ApplicationEventService - FinishedLaunching');
    TApplicationEvent.BecameActive:
      LogAdd('unit1 - ApplicationEventService - BecameActive');
    TApplicationEvent.WillBecomeInactive:
      LogAdd('unit1 - ApplicationEventService - WillBecomeInactive');
    TApplicationEvent.EnteredBackground:
      LogAdd('unit1 - ApplicationEventService - EnteredBackground');
    TApplicationEvent.WillBecomeForeground:
      LogAdd('unit1 - ApplicationEventService - WillBecomeForeground');
    TApplicationEvent.WillTerminate:
      LogAdd('unit1 - ApplicationEventService - WillTerminate');
    TApplicationEvent.LowMemory:
      LogAdd('unit1 - ApplicationEventService - LowMemory');
    TApplicationEvent.TimeChange:
      LogAdd('unit1 - ApplicationEventService - TimeChange');
    TApplicationEvent.OpenURL:
      LogAdd('unit1 - ApplicationEventService - OpenURL');
  else
    LogAdd('unit1 - ApplicationEventService - (' + ord(AAppEvent).ToString +
      ') non géré');
  end;
end;

procedure TForm1.btnShowForm2Click(Sender: TObject);
begin
  form2.Show;
end;

procedure TForm1.btnShowForm2ModalClick(Sender: TObject);
begin
  form2.ShowModal;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  LogAdd('unit1 - FormActivate');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LogAdd('unit1 - FormClose');
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  LogAdd('unit1 - FormCloseQuery');
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  FMXApplicationEventService: IFMXApplicationEventService;
begin
  LogAdd('unit1 - FormCreate');

  if TPlatformServices.Current.SupportsPlatformService
    (IFMXApplicationEventService, FMXApplicationEventService) then
    FMXApplicationEventService.SetApplicationEventHandler
      (ApplicationEventService)
  else
    LogAdd('IFMXApplicationEventService non géré.');
end;

procedure TForm1.FormDeactivate(Sender: TObject);
begin
  LogAdd('unit1 - FormDeactivate');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  LogAdd('unit1 - FormDestroy');
end;

procedure TForm1.FormHide(Sender: TObject);
begin
  LogAdd('unit1 - FormHide');
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  LogAdd('unit1 - FormResize');
end;

procedure TForm1.FormSaveState(Sender: TObject);
begin
  LogAdd('unit1 - FormSaveState');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  LogAdd('unit1 - FormShow');
end;

initialization

LogAdd('unit1 - initialization');

finalization

LogAdd('unit1 - finalization');

end.
