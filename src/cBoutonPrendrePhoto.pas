/// <summary>
/// ***************************************************************************
///
/// Fie Frapic
///
/// Copyright 2024 Patrick Pr�martin under AGPL 3.0 license.
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
/// Signature : 65c80a04fa59f1fc2b4ea3154b7e4d54e8026752
/// ***************************************************************************
/// </summary>

unit cBoutonPrendrePhoto;

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
  TcadBoutonPrendrePhoto = class(TcadBoutonMenu)
  private
    { D�clarations priv�es }
  public
    procedure TraduireTexte; override;
    { D�clarations publiques }

  end;

implementation

{$R *.fmx}
{ TcadBoutonPrendrePhoto }

procedure TcadBoutonPrendrePhoto.TraduireTexte;
begin
  // TODO : traduire texte selon la langue en cours (ou choisie par l'utilisateur)
  text1.Text := 'Photo';
end;

end.
