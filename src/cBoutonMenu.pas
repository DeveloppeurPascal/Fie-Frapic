unit cBoutonMenu;

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
  FMX.Effects,
  FMX.Objects;

type
  TcadBoutonMenu = class(TFrame)
    Rectangle1: TRectangle;
    Circle1: TCircle;
    Text1: TText;
    ShadowEffect1: TShadowEffect;
    Path1: TPath;
  private
    { Déclarations privées }
  public
    procedure AfterConstruction; override;
    procedure TraduireTexte; virtual; abstract;
    procedure AfficheLesBonnesCouleurs;
  end;

implementation

{$R *.fmx}

uses
  System.Messaging,
  uStyleConsts,
  uConfig,
  uTypes;

{ TcadBoutonMenu }

procedure TcadBoutonMenu.AfficheLesBonnesCouleurs;
begin
  if tconfig.ThemeSombreActif then
  begin // mode sombre (explicite)
    ShadowEffect1.ShadowColor := CMenuBoutonShadowColorInDarkMode;
    Circle1.fill.Color := CMenuBoutonBackgroundColorInDarkMode;
    Rectangle1.fill.Color := CMenuBoutonBackgroundColorInDarkMode;
    Path1.stroke.Color := CMenuBoutonIconStrokeColorInDarkMode;
    Path1.fill.Color := CMenuBoutonIconFillColorInDarkMode;
    Text1.TextSettings.FontColor := CMenuBoutonTextColorInDarkMode;
  end
  else
  begin // mode clair (par défaut)
    ShadowEffect1.ShadowColor := CMenuBoutonShadowColorInLightMode;
    Circle1.fill.Color := CMenuBoutonBackgroundColorInLightMode;
    Rectangle1.fill.Color := CMenuBoutonBackgroundColorInLightMode;
    Path1.stroke.Color := CMenuBoutonIconStrokeColorInLightMode;
    Path1.fill.Color := CMenuBoutonIconFillColorInLightMode;
    Text1.TextSettings.FontColor := CMenuBoutonTextColorInLightMode;
  end;
end;

procedure TcadBoutonMenu.AfterConstruction;
begin
  inherited;

  AfficheLesBonnesCouleurs;
  TMessageManager.DefaultManager.SubscribeToMessage(TMSGThemeChanged,
    procedure(const Sender: TObject; const M: TMessage)
    begin
      AfficheLesBonnesCouleurs;
    end);

  TThread.ForceQueue(nil,
    procedure
    begin
      Circle1.width := Circle1.height;
      Rectangle1.margins.left := -Circle1.height / 2;
      Rectangle1.margins.top := 10 + Circle1.height / 8;
      Rectangle1.margins.bottom := Rectangle1.margins.top;
      Text1.TextSettings.Font.Size := Text1.height / 2;
      Path1.margins.top := Circle1.height / 5.5;
      Path1.margins.right := Path1.margins.top;
      Path1.margins.bottom := Path1.margins.top;
      Path1.margins.left := Path1.margins.top;

      TraduireTexte;
      TMessageManager.DefaultManager.SubscribeToMessage(TMSGLanguageChanged,
        procedure(const Sender: TObject; const M: TMessage)
        begin
          TraduireTexte;
        end);
    end);
end;

end.
