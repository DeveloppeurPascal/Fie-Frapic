/// <summary>
/// ***************************************************************************
///
/// Fie Frapic
///
/// Copyright 2024 Patrick Prémartin under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Mobile application for taking selfies with a background image for special
/// events (Valentine's Day, Halloween, company parties, festivals, etc.) or personalised by the user.
///
/// ***************************************************************************
///
/// Author(s) :
/// Patrick PREMARTIN
///
/// Site :
/// https://fiefrapic.olfsoftware.fr/
///
/// Project site :
/// https://github.com/DeveloppeurPascal/Fie-Frapic
///
/// ***************************************************************************
/// File last update : 2024-08-26T11:11:42.523+02:00
/// Signature : ae3b5189889dddac14cfb0b4b894c250bb5d45e5
/// ***************************************************************************
/// </summary>

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
      Text1.TextSettings.HorzAlign := TTextAlign.center;
      Text1.margins.left := Circle1.height / 2;
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
