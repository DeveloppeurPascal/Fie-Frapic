unit uConfig;

interface

type
{$SCOPEDENUMS ON}
  TTypeCamera = (Front, Back);

  TConfig = class
  private
    class procedure SetThemeSombreActif(const Value: boolean); static;
    class function GetThemeSombreActif: boolean; static;
    class procedure SetCameraType(const Value: TTypeCamera); static;
    class function GetCameraType: TTypeCamera; static;
    class function GetisCameraFlashActive: boolean; static;
    class procedure SetisCameraFlashActive(const Value: boolean); static;
  protected
  public
    class property ThemeSombreActif: boolean read GetThemeSombreActif
      write SetThemeSombreActif;
    class property CameraType: TTypeCamera read GetCameraType
      write SetCameraType;
    class property isCameraFlashActive: boolean read GetisCameraFlashActive
      write SetisCameraFlashActive;
    class procedure save;
  end;

implementation

{ TConfig }

uses
  System.IOUtils,
  Olf.RTL.Params,
  Olf.RTL.SystemAppearance,
  System.Messaging,
  uTypes;

const
  CThemeSombreActif = 'tsa';
  CCameraType = 'ct';
  CCameraFlashActive = 'cfa';

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
