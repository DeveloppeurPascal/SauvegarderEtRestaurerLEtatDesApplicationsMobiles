unit fLog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TfrmLog = class(TForm)
    ToolBar1: TToolBar;
    btnRecharger: TButton;
    btnEffacer: TButton;
    btnFermer: TButton;
    mmoLog: TMemo;
    procedure btnFermerClick(Sender: TObject);
    procedure btnRechargerClick(Sender: TObject);
    procedure btnEffacerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmLog: TfrmLog;

procedure LogAdd(ch: string);

implementation

{$R *.fmx}

uses
  System.IOUtils;

function GetLogFilePath: string;
begin
  result := tpath.Combine(tpath.GetDocumentsPath, '_Webinaire20200830');
  if not tdirectory.Exists(result) then
    tdirectory.CreateDirectory(result);
  result := tpath.Combine(result, 'log.txt');
end;

procedure LogAdd(ch: string);
var
  log: tstringlist;
  nomfichier: string;
begin
  if ch.Length > 0 then
  begin
    log := tstringlist.Create;
    try
      nomfichier := GetLogFilePath;
      if tfile.Exists(nomfichier) then
        log.LoadFromFile(nomfichier, TEncoding.UTF8);
      log.Add(ch);
      log.SaveToFile(nomfichier, TEncoding.UTF8);
    finally
      FreeAndNil(log);
    end;
    if assigned(frmLog) and frmLog.Visible and assigned(frmLog.mmoLog) then
    begin
      frmLog.mmoLog.Lines.Add(ch);
      frmLog.mmoLog.GoToTextEnd;
    end;
  end;
end;

procedure TfrmLog.btnEffacerClick(Sender: TObject);
begin
  tfile.Delete(GetLogFilePath);
  mmoLog.Lines.Clear;
end;

procedure TfrmLog.btnFermerClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLog.btnRechargerClick(Sender: TObject);
var
  nomfichier: string;
begin
  mmoLog.Lines.Clear;
  nomfichier := GetLogFilePath;
  if tfile.Exists(nomfichier) then
    mmoLog.Lines.LoadFromFile(nomfichier, TEncoding.UTF8);
end;

procedure TfrmLog.FormShow(Sender: TObject);
begin
  btnRechargerClick(nil);
end;

end.
