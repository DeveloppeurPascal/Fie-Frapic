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
/// File last update : 2024-08-26T11:11:42.539+02:00
/// Signature : f42aa0fb6387372d99f27330e8f834f1c1c8f7f7
/// ***************************************************************************
/// </summary>

unit cBoutonReglages;

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
  cBoutonMenu,
  FMX.Effects,
  FMX.Objects;

type
  TcadBoutonReglages = class(TcadBoutonMenu)
  private
    { Déclarations privées }
  public
    procedure TraduireTexte; override;
    { Déclarations publiques }

  end;

implementation

{$R *.fmx}
{ TcadBoutonReglages }

procedure TcadBoutonReglages.TraduireTexte;
begin
  // TODO : traduire texte selon la langue en cours (ou choisie par l'utilisateur)
  text1.Text := 'Options';
end;

end.
