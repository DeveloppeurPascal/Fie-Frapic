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
  File last update : 2025-07-03T10:43:59.347+02:00
  Signature : a9fc00f62267d2a5f125616778adf7463398268e
  ***************************************************************************
*)

unit uConfig;

interface

uses
  uTypes;

// TODO : remplir les champs XMLDoc

type
  TConfig = class
  private
    class procedure SetThemeSombreActif(const Value: boolean); static;
    class function GetThemeSombreActif: boolean; static;
    class procedure SetCameraType(const Value: TTypeCamera); static;
    class function GetCameraType: TTypeCamera; static;
    class function GetisCameraFlashActive: boolean; static;
    class procedure SetisCameraFlashActive(const Value: boolean); static;
    class function GetZoomLevel: integer; static;
    class procedure SetZoomLevel(const Value: integer); static;
  protected
  public
    /// <summary>
    ///
    /// </summary>
    class property ThemeSombreActif: boolean read GetThemeSombreActif
      write SetThemeSombreActif;
    /// <summary>
    ///
    /// </summary>
    class property CameraType: TTypeCamera read GetCameraType
      write SetCameraType;
    /// <summary>
    ///
    /// </summary>
    class property isCameraFlashActive: boolean read GetisCameraFlashActive
      write SetisCameraFlashActive;
    /// <summary>
    /// Niveau de zoom pour l'affichage de l'image captur�e depuis la cam�ra.
    /// </summary>
    /// <remarks>
    /// Calcul� en pourcentage. Valeur par d�faut 100%.
    /// </remarks>
    class property ZoomLevel: integer read GetZoomLevel write SetZoomLevel;
    class procedure save;
  end;

implementation

{ TConfig }

uses
  System.IOUtils,
  Olf.RTL.Params,
  Olf.RTL.SystemAppearance,
  System.Messaging;

const
  CThemeSombreActif = 'tsa';
  CCameraType = 'ct';
  CCameraFlashActive = 'cfa';
  CZoomLevel = 'zl';

class function TConfig.GetCameraType: TTypeCamera;
begin
  result := TTypeCamera(TParams.getValue(CCameraType, ord(TTypeCamera.Front)));
end;

class function TConfig.GetisCameraFlashActive: boolean;
begin
  result := TParams.getValue(CCameraFlashActive, false);
end;

class function TConfig.GetThemeSombreActif: boolean;
begin
  result := TParams.getValue(CThemeSombreActif, isSystemThemeInDarkMode);
end;

class function TConfig.GetZoomLevel: integer;
begin
  result := TParams.getValue(CZoomLevel, 100);
end;

class procedure TConfig.save;
begin
  TParams.save;
end;

class procedure TConfig.SetCameraType(const Value: TTypeCamera);
begin
  TParams.setValue(CCameraType, ord(Value));
end;

class procedure TConfig.SetisCameraFlashActive(const Value: boolean);
begin
  TParams.setValue(CCameraFlashActive, Value);
end;

class procedure TConfig.SetThemeSombreActif(const Value: boolean);
begin
  if Value <> ThemeSombreActif then
  begin
    TParams.setValue(CThemeSombreActif, Value);
    TMessageManager.DefaultManager.SendMessage(nil, TMSGThemeChanged.Create);
  end;
end;

class procedure TConfig.SetZoomLevel(const Value: integer);
begin
  if (Value > 0) then
    TParams.setValue(CZoomLevel, Value);
end;

procedure LoadParams;
var
  path: string;
begin
{$IFDEF DEBUG}
  path := tpath.combine(tpath.GetDocumentsPath, 'OlfSoftware-debug',
    'FieFrapic-debug');
{$ELSE}
{$IFDEF IOS}
  path := tpath.combine(tpath.GetDocumentsPath, 'OlfSoftware', 'FieFrapic');
{$ELSE}
  path := tpath.combine(tpath.GetHomePath, 'OlfSoftware', 'FieFrapic');
{$ENDIF}
{$ENDIF}
  TParams.setFolderName(path);
end;

initialization

LoadParams;

end.
