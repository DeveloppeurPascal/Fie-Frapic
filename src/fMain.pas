unit fMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  uDMProjectLogo,
  FMX.Objects,
  FMX.Layouts,
  FMX.ImgList,
  cBoutonMenu,
  cBoutonPrendrePhoto,
  cBoutonAbout,
  cBoutonReglages,
  cBoutonRetourAuMenu,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  cPrjSaintValentin2014,
  cBoutonIcone,
  cBoutonIconeFlashOn,
  CBoutonIconeChoixAppareil,
  cBoutonIconeTakePhoto,
  cBoutonIconeFlashOff,
  cBoutonIconeClose,
  cBoutonIconeZoomMoins,
  cBoutonIconeZoomPlus,
  System.Messaging,
  FMX.Media,
  cBoutonIconeShare,
  cBoutonIconeSave, cBoutonIconeZoom0;

type
  TfrmMain = class(TForm)
    rHomeScreen: TRectangle;
    rOptionsScreen: TRectangle;
    rPhotoValidationScreen: TRectangle;
    rAboutScreen: TRectangle;
    rPhotoScreen: TRectangle;
    sbHome: TVertScrollBox;
    sbOptions: TVertScrollBox;
    Layout1: TLayout;
    Glyph1: TGlyph;
    Layout2: TLayout;
    cadBoutonPrendrePhoto1: TcadBoutonPrendrePhoto;
    cadBoutonReglages1: TcadBoutonReglages;
    cadBoutonAbout1: TcadBoutonAbout;
    sbAbout: TVertScrollBox;
    Glyph2: TGlyph;
    txtAbout: TText;
    Layout3: TLayout;
    Layout4: TLayout;
    cadAboutBoutonRetourAuMenu1: TcadBoutonRetourAuMenu;
    Glyph3: TGlyph;
    Layout5: TLayout;
    Layout6: TLayout;
    cadOptionsBoutonRetourAuMenu2: TcadBoutonRetourAuMenu;
    gplOptionsTheme: TGridPanelLayout;
    icoOptionsThemeSombre: TPath;
    swOptionsThemeClair: TSwitch;
    icoOptionsThemeClair: TPath;
    lPhotoHeader: TLayout;
    lPhotoFooter: TLayout;
    gplFooter: TGridPanelLayout;
    lFlashOnOff: TLayout;
    cadBoutonIconeFlashOn1: TcadBoutonIconeFlashOn;
    cadBoutonIconeFlashOff1: TcadBoutonIconeFlashOff;
    cadBoutonIconeTakePhoto1: TcadBoutonIconeTakePhoto;
    CadBoutonIconeChoixAppareil1: TCadBoutonIconeChoixAppareil;
    CameraComponent1: TCameraComponent;
    imgPhotoFinale: TImage;
    lPhotoValidHeader: TLayout;
    lPhotoValidFooter: TLayout;
    gplPhotoValidCenter: TGridPanelLayout;
    cadBoutonIconeTakePhoto2: TcadBoutonIconeTakePhoto;
    cadPhotoValidBoutonIconeClose: TcadBoutonIconeClose;
    cadBoutonIconeSave1: TcadBoutonIconeSave;
    cadBoutonIconeShare1: TcadBoutonIconeShare;
    MaskPath: TPath;
    cadPhotoBoutonIconeClose: TcadBoutonIconeClose;
    lPhotoLeft: TLayout;
    gplZoomButtons: TGridPanelLayout;
    cadBoutonIconeZoomPlus1: TcadBoutonIconeZoomPlus;
    cadBoutonIconeZoom01: TcadBoutonIconeZoom0;
    cadBoutonIconeZoomMoins1: TcadBoutonIconeZoomMoins;
    lBackground: TLayout;
    imgCamera: TImage;
    procedure FormCreate(Sender: TObject);
    procedure cadBoutonAbout1Click(Sender: TObject);
    procedure cadBoutonPrendrePhoto1Click(Sender: TObject);
    procedure cadBoutonReglages1Click(Sender: TObject);
    procedure cadAboutBoutonRetourAuMenu1Click(Sender: TObject);
    procedure cadOptionsBoutonRetourAuMenu2Click(Sender: TObject);
    procedure swOptionsThemeClairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: WideChar;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure CameraComponent1SampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
    procedure CadBoutonIconeChoixAppareil1Click(Sender: TObject);
    procedure cadBoutonIconeFlashOff1Click(Sender: TObject);
    procedure cadBoutonIconeFlashOn1Click(Sender: TObject);
    procedure cadBoutonIconeTakePhoto1Click(Sender: TObject);
    procedure cadBoutonIconeTakePhoto2Click(Sender: TObject);
    procedure cadPhotoValidBoutonIconeCloseClick(Sender: TObject);
    procedure cadBoutonIconeSave1Click(Sender: TObject);
    procedure cadBoutonIconeShare1Click(Sender: TObject);
    procedure cadBoutonIconeZoomMoins1Click(Sender: TObject);
    procedure cadBoutonIconeZoomPlus1Click(Sender: TObject);
    procedure cadBoutonIconeZoom01Click(Sender: TObject);
    procedure cadPhotoBoutonIconeCloseClick(Sender: TObject);
  private
    FCurrentScreen: TRectangle;
    FCurrentProject: TcadPrjSaintValentin2014;
    procedure SetCurrentScreen(const Value: TRectangle);
  protected
    procedure ApplicationEventChangedHandler(const Sender: TObject;
      const AMessage: TMessage);
  public
    property CurrentScreen: TRectangle read FCurrentScreen
      write SetCurrentScreen;
    procedure TraduireTexte;
    procedure AfficheLesBonnesCouleurs;
    procedure GoToHomeScreen;
    procedure GoToPhotoScreen(AskPermmission: boolean = true);
    procedure GoToPhotoValidationScreen;
    procedure GoToOptionsScreen;
    procedure GoToAboutScreen;
    procedure HideAllScreens;
    procedure ModifieEtatDuFlash(isActive: boolean);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  FMX.DialogService,
  FMX.Platform,
  FMX.MediaLibrary,
  System.Permissions,
  uStyleConsts,
  System.DateUtils,
  System.IOUtils,
  uConfig,
  uTypes;

procedure TfrmMain.cadBoutonAbout1Click(Sender: TObject);
begin
  GoToAboutScreen;
end;

procedure TfrmMain.CadBoutonIconeChoixAppareil1Click(Sender: TObject);
begin
  CameraComponent1.active := false;
  case tconfig.CameraType of
    ttypecamera.Front:
      try
        CameraComponent1.Kind := TCameraKind.BackCamera;
        tconfig.CameraType := ttypecamera.back;
        tconfig.save;
      except
        CameraComponent1.Kind := TCameraKind.FrontCamera;
        tconfig.CameraType := ttypecamera.Front;
      end;
    ttypecamera.back:
      try
        CameraComponent1.Kind := TCameraKind.FrontCamera;
        tconfig.CameraType := ttypecamera.Front;
        tconfig.save;
      except
        CameraComponent1.Kind := TCameraKind.BackCamera;
        tconfig.CameraType := ttypecamera.back;
      end;
  else
    showmessage('Camera Type Unknown !');
  end;
  CameraComponent1.active := true;
end;

procedure TfrmMain.cadPhotoBoutonIconeCloseClick(Sender: TObject);
begin
  GoToHomeScreen;
end;

procedure TfrmMain.cadPhotoValidBoutonIconeCloseClick(Sender: TObject);
begin
  GoToHomeScreen;
end;

procedure TfrmMain.cadBoutonIconeFlashOff1Click(Sender: TObject);
begin
  ModifieEtatDuFlash(true);
end;

procedure TfrmMain.cadBoutonIconeFlashOn1Click(Sender: TObject);
begin
  ModifieEtatDuFlash(false);
end;

procedure TfrmMain.cadBoutonIconeSave1Click(Sender: TObject);
var
  FileName: string;
begin
  FileName := TPath.combine(TPath.GetPicturesPath,
    'FieFrapic_' + FormatDateTime('yyyymmdd_hhnnss', now) + '.jpg');

  if not tfile.Exists(FileName) then
    imgPhotoFinale.Bitmap.SaveToFile(FileName);

  // TODO : traduire texte
  showmessage('Image sauvegardée');
end;

procedure TfrmMain.cadBoutonIconeShare1Click(Sender: TObject);
var
  ssas: IFMXShareSheetActionsService;
begin
  if TPlatformServices.Current.SupportsPlatformService
    (IFMXShareSheetActionsService, ssas) then
    ssas.Share(nil, '', imgPhotoFinale.Bitmap);
end;

procedure TfrmMain.cadBoutonIconeTakePhoto1Click(Sender: TObject);
begin
  GoToPhotoValidationScreen;
end;

procedure TfrmMain.cadBoutonIconeTakePhoto2Click(Sender: TObject);
begin
  GoToPhotoScreen;
end;

procedure TfrmMain.cadBoutonIconeZoom01Click(Sender: TObject);
begin
  tconfig.ZoomLevel := 100;
  tconfig.save;
end;

procedure TfrmMain.cadBoutonIconeZoomMoins1Click(Sender: TObject);
begin
  tconfig.ZoomLevel := tconfig.ZoomLevel - 5;
  tconfig.save;
end;

procedure TfrmMain.cadBoutonIconeZoomPlus1Click(Sender: TObject);
begin
  tconfig.ZoomLevel := tconfig.ZoomLevel + 5;
  tconfig.save;
end;

procedure TfrmMain.cadBoutonPrendrePhoto1Click(Sender: TObject);
begin
  GoToPhotoScreen;
end;

procedure TfrmMain.cadBoutonReglages1Click(Sender: TObject);
begin
  GoToOptionsScreen;
end;

procedure TfrmMain.AfficheLesBonnesCouleurs;
begin
  if tconfig.ThemeSombreActif then
  begin
    // ********************
    // * Home Screen
    rHomeScreen.fill.Color := CBackgroundColorInDarkMode;
    rPhotoScreen.fill.Color := rHomeScreen.fill.Color;
    rOptionsScreen.fill.Color := rHomeScreen.fill.Color;
    rAboutScreen.fill.Color := rHomeScreen.fill.Color;
    rPhotoValidationScreen.fill.Color := rHomeScreen.fill.Color;
    // ********************
    // * About Screen
    txtAbout.TextSettings.FontColor := CTextColorInDarkMode;
    // ********************
    // * Options Screen
    icoOptionsThemeSombre.Stroke.Color := CIconStrokeColorInDarkMode;
    icoOptionsThemeSombre.fill.Color := CIconFillColorInDarkMode;
    icoOptionsThemeClair.Stroke.Color := CIconStrokeColorInDarkMode;
    icoOptionsThemeClair.fill.Color := CIconFillColorInDarkMode;
    // ********************
    // * Photo Screen
    MaskPath.Stroke.Color := CMaskPathStrokeColorInDarkMode;
  end
  else
  begin
    // ********************
    // * HomeScreen
    rHomeScreen.fill.Color := CBackgroundColorInLightMode;
    rPhotoScreen.fill.Color := rHomeScreen.fill.Color;
    rOptionsScreen.fill.Color := rHomeScreen.fill.Color;
    rAboutScreen.fill.Color := rHomeScreen.fill.Color;
    rPhotoValidationScreen.fill.Color := rHomeScreen.fill.Color;
    // ********************
    // * About Screen
    txtAbout.TextSettings.FontColor := CTextColorInLightMode;
    // ********************
    // * Options Screen
    icoOptionsThemeSombre.Stroke.Color := CIconStrokeColorInLightMode;
    icoOptionsThemeSombre.fill.Color := CIconFillColorInLightMode;
    icoOptionsThemeClair.Stroke.Color := CIconStrokeColorInLightMode;
    icoOptionsThemeClair.fill.Color := CIconFillColorInLightMode;
    // ********************
    // * Photo Screen
    MaskPath.Stroke.Color := CMaskPathStrokeColorInLightMode;
  end;
end;

procedure TfrmMain.ApplicationEventChangedHandler(const Sender: TObject;
  const AMessage: TMessage);
begin
  case TApplicationEventMessage(AMessage).Value.Event of
    TApplicationEvent.WillBecomeInactive:
      begin
        CameraComponent1.active := false;
      end;
    TApplicationEvent.BecameActive:
      CameraComponent1.active := (FCurrentScreen = rPhotoScreen);
  end;
end;

procedure TfrmMain.cadAboutBoutonRetourAuMenu1Click(Sender: TObject);
begin
  GoToHomeScreen;
end;

procedure TfrmMain.cadOptionsBoutonRetourAuMenu2Click(Sender: TObject);
begin
  GoToHomeScreen;
end;

procedure TfrmMain.CameraComponent1SampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
var
  w, h: single;
begin
  CameraComponent1.SampleBufferToBitmap(imgCamera.Bitmap, true);
  w := imgCamera.Bitmap.width * tconfig.ZoomLevel / 100;
  h := imgCamera.Bitmap.Height * tconfig.ZoomLevel / 100;
  if (imgCamera.width <> w) or (imgCamera.Height <> h) then
    imgCamera.Size.Size := tsizef.Create(w, h);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FCurrentScreen := nil;
  FCurrentProject := TcadPrjSaintValentin2014.Create(nil);

  AfficheLesBonnesCouleurs;
  TMessageManager.DefaultManager.SubscribeToMessage(TMSGThemeChanged,
    procedure(const Sender: TObject; const M: TMessage)
    begin
      AfficheLesBonnesCouleurs;
    end);

  TraduireTexte;
  TMessageManager.DefaultManager.SubscribeToMessage(TMSGLanguageChanged,
    procedure(const Sender: TObject; const M: TMessage)
    begin
      TraduireTexte;
    end);

  TMessageManager.DefaultManager.SubscribeToMessage(TApplicationEventMessage,
    ApplicationEventChangedHandler);

  HideAllScreens;
  tthread.ForceQueue(nil,
    procedure
    begin
      GoToHomeScreen;
    end);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FCurrentProject.free;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
var KeyChar: WideChar; Shift: TShiftState);
begin
  if (Key = vkEscape) or (Key = vkHardwareBack) then
  begin
    if CurrentScreen = rHomeScreen then
      close
    else
      GoToHomeScreen;
  end;
end;

procedure TfrmMain.GoToAboutScreen;
begin
  sbAbout.ViewportPosition := tpointf.Create(0, 0);

  txtAbout.TextSettings.Font.Size :=
    cadAboutBoutonRetourAuMenu1.Text1.TextSettings.Font.Size;

  CurrentScreen := rAboutScreen;
end;

procedure TfrmMain.GoToHomeScreen;
begin
  sbHome.ViewportPosition := tpointf.Create(0, 0);
  CurrentScreen := rHomeScreen;
end;

procedure TfrmMain.GoToOptionsScreen;
begin
  sbOptions.ViewportPosition := tpointf.Create(0, 0);

  swOptionsThemeClair.IsChecked := not tconfig.ThemeSombreActif;

  CurrentScreen := rOptionsScreen;
end;

procedure TfrmMain.GoToPhotoScreen(AskPermmission: boolean);
begin
  if AskPermmission then
    TPermissionsService.DefaultService.RequestPermissions
      (['android.permission.CAMERA'],
      procedure(const APermissions: TClassicStringDynArray;
        const AGrantResults: TClassicPermissionStatusDynArray)
      var
        i: integer;
        ok: boolean;
      begin
        ok := true;
        for i := 0 to length(AGrantResults) - 1 do
          if (AGrantResults[i] = TPermissionStatus.Denied) then
          begin
            showmessage('Permission nécessaire pour prendre une photo.');
            ok := false;
            break;
          end;
        if ok then
          GoToPhotoScreen(false);
      end,
      procedure(const APermissions: TClassicStringDynArray;
        const APostRationaleProc: TProc)
      begin
        TDialogService.showmessage
          ('Il est nécessaire d''avoir cette autorisation pour prendre une photo.',
          procedure(Const AModalResult: TModalResult)
          begin
            if assigned(APostRationaleProc) then
              APostRationaleProc;
          end);
      end)
  else
  begin
    MaskPath.data.data := FCurrentProject.MaskPath.data.data;

    if CameraComponent1.active then
      CameraComponent1.active := false;

    ModifieEtatDuFlash(tconfig.isCameraFlashActive);

    case tconfig.CameraType of
      ttypecamera.Front:
        CameraComponent1.Kind := TCameraKind.FrontCamera;
      ttypecamera.back:
        CameraComponent1.Kind := TCameraKind.BackCamera;
    else
      showmessage('Camera type unknown !');
    end;

{$IF Defined(ANDROID)}
    try
      CameraComponent1.FocusMode := tfocusmode.ContinuousAutoFocus;
      // crash sur Mac & iOS
    except
    end;
{$ENDIF}
    CameraComponent1.active := true;

    CurrentScreen := rPhotoScreen;
  end;
end;

procedure TfrmMain.GoToPhotoValidationScreen;
var
  Img0, Img1: TImage;
  Path: FMX.Objects.TPath;
  bmp: TBitmap;
  MaskBounds: TRectF;
  x, y, w, h: integer;
begin
  Img0 := TImage.Create(self);
  try
    Img0.parent := self;
    Img0.Bitmap.Assign(FCurrentProject.imgBackground.Bitmap);
    Img0.width := Img0.Bitmap.width;
    Img0.Height := Img0.Bitmap.Height;
    Path := FMX.Objects.TPath.Create(self);
    try
      Path.parent := Img0;
      Path.align := talignlayout.contents;
      Path.margins.top := 200;
      Path.margins.right := 472;
      Path.margins.bottom := 200;
      Path.margins.left := 472;
      Path.WrapMode := TPathWrapMode.Fit;
      Path.data.data := FCurrentProject.MaskPath.data.data;
      Path.Stroke.Kind := TBrushKind.None;
      Path.fill.Kind := TBrushKind.Bitmap;
      Path.fill.Bitmap.WrapMode := twrapmode.TileStretch;
      MaskBounds := MaskPath.data.GetBounds;
      MaskBounds.Fit(MaskPath.BoundsRect);
      // Fit() ne se contente pas de donner le ratio mais réduit aussi la taille
      w := trunc(MaskBounds.width * 100 / tconfig.ZoomLevel);
      h := trunc(MaskBounds.Height * 100 / tconfig.ZoomLevel);
      bmp := TBitmap.Create(w, h);
      try
        x := trunc((imgCamera.width * 100 / tconfig.ZoomLevel - w) / 2);
        y := trunc((imgCamera.Height * 100 / tconfig.ZoomLevel - h) / 2);
        bmp.CopyFromBitmap(imgCamera.Bitmap, trect.Create(x, y, x + w,
          y + h), 0, 0);
        Path.fill.Bitmap.Bitmap.Assign(bmp);
      finally
        // Img0.Bitmap.Assign(bmp); // pour comparer capture et affichage
        bmp.free;
      end;
      Img1 := TImage.Create(self);
      try
        Img1.parent := Img0;
        Img1.Bitmap.Assign(FCurrentProject.imgForeground.Bitmap);
        Img1.width := Img0.width;
        Img1.Height := Img0.Height;

        bmp := Img0.MakeScreenshot;
        try
          imgPhotoFinale.Bitmap.Assign(bmp);
        finally
          bmp.free;
        end;
      finally
        Img1.free;
      end;
    finally
      Path.free;
    end;
  finally
    Img0.free;
  end;

{$IFDEF IOS}
  cadBoutonIconeSave1.visible := false;
{$ENDIF}
  cadBoutonIconeShare1.visible :=
    TPlatformServices.Current.SupportsPlatformService
    (IFMXShareSheetActionsService);

  CurrentScreen := rPhotoValidationScreen;
end;

procedure TfrmMain.HideAllScreens;
var
  o: TFMXObject;
begin
  for o in Children do
    if (o is TRectangle) and string(o.name).tolower.StartsWith('r') and
      string(o.name).tolower.EndsWith('screen') then
      (o as TRectangle).visible := false;
end;

procedure TfrmMain.ModifieEtatDuFlash(isActive: boolean);
begin
{$IF Defined(IOS) or Defined(ANDROID)}
  try
    if isActive then
      CameraComponent1.FlashMode := TFlashMode.FlashOn
    else
      CameraComponent1.FlashMode := TFlashMode.AutoFlash;

    cadBoutonIconeFlashOn1.visible := isActive;
    cadBoutonIconeFlashOff1.visible := not isActive;

    if (tconfig.isCameraFlashActive <> isActive) then
    begin
      tconfig.isCameraFlashActive := isActive;
      tconfig.save;
    end;
  except
    cadBoutonIconeFlashOn1.visible := false;
    cadBoutonIconeFlashOff1.visible := true;
    tconfig.isCameraFlashActive := false;
    tconfig.save;
    // showmessage('Flash not available');
  end;
{$ENDIF}
end;

procedure TfrmMain.SetCurrentScreen(const Value: TRectangle);
begin
  if assigned(FCurrentScreen) then
  begin
    // TODO : faire une éventuelle animation de masquage
    FCurrentScreen.visible := false;
  end;

  FCurrentScreen := Value;

  if assigned(FCurrentScreen) then
  begin
    if (FCurrentScreen <> rPhotoScreen) and (CameraComponent1.active) then
      CameraComponent1.active := false;

    // TODO : faire une éventuelle animation d'affichage
    FCurrentScreen.align := talignlayout.Client;
    FCurrentScreen.visible := true;
  end;
end;

procedure TfrmMain.swOptionsThemeClairClick(Sender: TObject);
begin
  tconfig.ThemeSombreActif := not swOptionsThemeClair.IsChecked;
  tconfig.save;
end;

procedure TfrmMain.TraduireTexte;
begin
  // TODO : traduire texte selon la langue en cours (ou choisie par l'utilisateur)

  // Texte de l'écran des informations légales (crédits et licences)
  txtAbout.Text := 'Fie FraPic' + slinebreak + '(c) 2024 Patrick Prémartin' +
    slinebreak + '' + slinebreak +
    'Application mobile de prise de photo sur des événements ponctuels, Fie Frapic a été développée à l''origine pour la Saint Valentin 2024 sous Delphi 12 Alexandria.'
    + slinebreak + slinebreak +
    'Les éléments visuels (icones, images) proviennent de bibliothèques graphiques ou ont été créés spécifiquement pour ce programme. Ils sont sous licence d ''Adobe Stock, Google, Austin Andrews, Hans Böhm, Michael Irigoyen, Michael Richins, Colton Wiscombe et Patrick Prémartin. Ne les réutilisez pas sans accord préalable de leurs auteurs ou ayants droits.'
    + slinebreak + slinebreak +
    'Pour en savoir plus rendez-vous sur https://fiefrapic.olfsoftware.fr' +
    slinebreak;
end;

initialization

TDialogService.PreferredMode := TDialogService.TPreferredMode.Async;
{$IFDEF MACOS}
globalusemetal := true;
{$ENDIF}
{$IFDEF DEBUG}
ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.
