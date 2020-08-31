unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Platform,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TForm1 = class(TForm)
    Rectangle1: TRectangle;
    Timer1: TTimer;
    rBackground: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormSaveState(Sender: TObject);
  private
    { D�clarations priv�es }
    FNombre: integer;
    FEcranActif: boolean;
    function ApplicationEventService(AAppEvent: TApplicationEvent;
      AContext: TObject): boolean;
    procedure SetEcranActif(const Value: boolean);
    property EcranActif: boolean read FEcranActif write SetEcranActif;
  public
    { D�clarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses System.IOUtils;

function TForm1.ApplicationEventService(AAppEvent: TApplicationEvent;
  AContext: TObject): boolean;
begin
  case AAppEvent of
    TApplicationEvent.BecameActive:
      EcranActif := true;
    TApplicationEvent.WillBecomeInactive:
      EcranActif := false;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  FMXApplicationEventService: IFMXApplicationEventService;
  R: TBinaryReader;
begin
  // valeurs par d�faut au lancement du programme
  Rectangle1.Width := 0;
  FNombre := 10;

  // valeurs stock�es lors de la derni�re ex�cution
  savestate.StoragePath := tpath.Combine(tpath.GetDocumentsPath,
    '_Webinaire20200830');
  if not tdirectory.Exists(savestate.StoragePath) then
    tdirectory.CreateDirectory(savestate.StoragePath);
  if (savestate.Stream.Size > 0) then
  begin
    R := TBinaryReader.Create(savestate.Stream);
    try
      try
        Rectangle1.Width := R.ReadSingle;
      except
      end;
      try
        FNombre := R.ReadInteger;
      except
      end;
    finally
      R.Free;
    end;
  end;

  // activation des services de plateforme
  if TPlatformServices.Current.SupportsPlatformService
    (IFMXApplicationEventService, FMXApplicationEventService) then
    FMXApplicationEventService.SetApplicationEventHandler
      (ApplicationEventService)
  else
    EcranActif := true;
end;

procedure TForm1.FormSaveState(Sender: TObject);
var
  W: TBinaryWriter;
begin
  EcranActif := false;
  savestate.Stream.Clear;
  W := TBinaryWriter.Create(savestate.Stream);
  try
    W.Write(Rectangle1.Width); // type Single
    W.Write(FNombre); // type Integer
  finally
    W.Free;
  end;
end;

procedure TForm1.SetEcranActif(const Value: boolean);
begin
  // TODO : eviter les ex�cutions multiples
  // optimiser en v�rifiant que la nouvelle valeur est bien diff�rente,
  // avec un for�age lors de la premi�re ex�cution
  FEcranActif := Value;
  if FEcranActif then
  begin
    Timer1.Enabled := true;
  end
  else
  begin
    Timer1.Enabled := false;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Rectangle1.Width := Rectangle1.Width + FNombre;
  if ((Rectangle1.Width > rBackground.Width) and (FNombre > 0)) or
    ((Rectangle1.Width < abs(FNombre) + 1) and (FNombre < 0)) then
    FNombre := -FNombre;
end;

end.
