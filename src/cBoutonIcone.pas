unit cBoutonIcone;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Objects;

type
  TcadBoutonIcone = class(TFrame)
    Rectangle1: TRectangle;
    Path1: TPath;
  private
    { Déclarations privées }
  public
    procedure AfterConstruction; override;
    procedure AfficheLesBonnesCouleurs;
  end;

implementation

{$R *.fmx}

uses
  System.Messaging,
  uStyleConsts,
  uConfig,
  uTypes;

{ TcadBoutonIcone }

procedure TcadBoutonIcone.AfficheLesBonnesCouleurs;
begin
  if tconfig.ThemeSombreActif then
  begin
    Rectangle1.Fill.color := CBackgroundColorInDarkMode;
    Path1.Stroke.color := CIconStrokeColorInDarkMode;
    Path1.Fill.color := CIconFillColorInDarkMode;
  end
  else
  begin
    Rectangle1.Fill.color := CBackgroundColorInLightMode;
    Path1.Stroke.color := CIconStrokeColorInLightMode;
    Path1.Fill.color := CIconFillColorInLightMode;
  end;
end;

procedure TcadBoutonIcone.AfterConstruction;
begin
  inherited;

  AfficheLesBonnesCouleurs;
  TMessageManager.DefaultManager.SubscribeToMessage(TMSGThemeChanged,
    procedure(const Sender: TObject; const M: TMessage)
    begin
      AfficheLesBonnesCouleurs;
    end);
end;

end.
