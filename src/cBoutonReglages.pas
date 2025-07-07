(* C2PP
  ***************************************************************************

  Fie Frapic

  Copyright 2024-2025 Patrick Pr�martin under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Mobile application for taking selfies with a background image for special
  events (Valentine's Day, Halloween, company parties, festivals, etc.) or personalised by the user.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://fiefrapic.olfsoftware.fr/

  Project site :
  https://github.com/DeveloppeurPascal/Fie-Frapic

  ***************************************************************************
  File last update : 2025-07-03T10:43:59.342+02:00
  Signature : cf76acea6586520f196e1ae47b22f539e86bddcc
  ***************************************************************************
*)

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
    { D�clarations priv�es }
  public
    procedure TraduireTexte; override;
    { D�clarations publiques }

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
