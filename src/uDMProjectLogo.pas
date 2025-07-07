(* C2PP
  ***************************************************************************

  Fie Frapic

  Copyright 2024-2025 Patrick Prémartin under AGPL 3.0 license.

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
  File last update : 2025-07-03T10:43:59.349+02:00
  Signature : 3af937f73b3e3ad21a5258c49aacac34f8b6ec8b
  ***************************************************************************
*)

unit uDMProjectLogo;

interface

uses
  System.SysUtils,
  System.Classes,
  System.ImageList,
  FMX.ImgList;

type
  TdmProjectLogo = class(TDataModule)
    imgProjectLogo: TImageList;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  dmProjectLogo: TdmProjectLogo;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
