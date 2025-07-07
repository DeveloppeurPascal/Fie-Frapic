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
  File last update : 2025-07-03T10:43:59.352+02:00
  Signature : dc07f936ce43c8841481841935ce896abb49d407
  ***************************************************************************
*)

unit uTypes;

interface

uses
  System.Messaging;

type
{$SCOPEDENUMS ON}
  /// <summary>
  /// Types des caméras prises en charge par le programme
  /// </summary>
  TTypeCamera = (Front, Back);

  /// <summary>
  /// Sent by the config unit (or the system) when the theme (light/dark) has changed.
  /// </summary>
  TMSGThemeChanged = class(TMessage);

  /// <summary>
  /// Sent by the config unit (or the system) when the UI language has changed.
  /// </summary>
  TMSGLanguageChanged = class(TMessage);

implementation

end.
