unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit;

type
  TForm2 = class(TForm)
    Layout1: TLayout;
    btnForm3Show: TButton;
    btnHide: TButton;
    Edit1: TEdit;
    procedure btnForm3ShowClick(Sender: TObject);
    procedure btnHideClick(Sender: TObject);
    procedure FormSaveState(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses Unit3;

procedure TForm2.btnForm3ShowClick(Sender: TObject);
begin
  form3.Show;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  R: TBinaryReader;
begin
  // valeurs par défaut au lancement du programme
  Edit1.Text := 'Form2';

  // valeurs stockées lors de la dernière exécution
  if (savestate.Stream.Size > 0) then
  begin
    R := TBinaryReader.Create(savestate.Stream);
    try
      try
        Edit1.Text := R.ReadString;
      except
      end;
      try // ne fera pas ce qu'on veut
        visible := R.ReadBoolean;
        if visible then
          bringtofront;
      except
      end;
    finally
      R.Free;
    end;
  end;
end;

procedure TForm2.FormSaveState(Sender: TObject);
var
  W: TBinaryWriter;
begin
  savestate.Stream.Clear;
  W := TBinaryWriter.Create(savestate.Stream);
  try
    W.Write(Edit1.Text); // type String
    W.Write(visible); // type Boolean
  finally
    W.Free;
  end;
end;

procedure TForm2.btnHideClick(Sender: TObject);
begin
  Hide;
end;

end.
