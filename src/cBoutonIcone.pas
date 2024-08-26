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
/// File last update : 2024-08-26T11:11:42.492+02:00
/// Signature : ae873c66ffa0d0a2a703271113631593de2642ed
/// ***************************************************************************
/// </summary>

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
