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
  cBoutonIconeSave,
  cBoutonIconeZoom0,
  uTypes,
  FMX.fhtmlcomp;

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
    txtAboutHTML: THtLabel;
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
    procedure GoToPhotoScreen(AskPermission: boolean = true);
    procedure GoToPhotoValidationScreen;
    procedure GoToOptionsScreen;
    procedure GoToAboutScreen;
    procedure HideAllScreens;
    procedure ModifieEtatDuFlash(isActive: boolean);
    procedure ActiveLaCamera(ACamera: TTypeCamera);
    procedure ReloadAboutText;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  FMX.DialogService,
  FMX.Platform,
  System.Permissions,
  uStyleConsts,
  System.DateUtils,
  System.IOUtils,
  uConfig,
  FMX.MediaLibrary;

procedure TfrmMain.cadBoutonAbout1Click(Sender: TObject);
begin
  GoToAboutScreen;
end;

procedure TfrmMain.CadBoutonIconeChoixAppareil1Click(Sender: TObject);
begin
  case tconfig.CameraType of
    TTypeCamera.Front:
      begin
        tconfig.CameraType := TTypeCamera.back;
        tconfig.save;
      end;
    TTypeCamera.back:
      begin
        tconfig.CameraType := TTypeCamera.Front;
        tconfig.save;
      end
  else
    raise exception.create('Camera Type Unknown !');
  end;
  ActiveLaCamera(tconfig.CameraType);
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

procedure TfrmMain.ActiveLaCamera(ACamera: TTypeCamera);
begin
  if CameraComponent1.active then
    CameraComponent1.active := false;

  try
    case tconfig.CameraType of
      TTypeCamera.Front:
        CameraComponent1.Kind := TCameraKind.FrontCamera;
      TTypeCamera.back:
        CameraComponent1.Kind := TCameraKind.BackCamera;
    else
      raise exception.create('Camera type unknown !');
    end;
  except
    CameraComponent1.Kind := TCameraKind.Default;
    CadBoutonIconeChoixAppareil1.visible := false;
  end;

  lFlashOnOff.visible := CameraComponent1.HasFlash;
  if CameraComponent1.HasFlash then
    ModifieEtatDuFlash(tconfig.isCameraFlashActive);

  try
    CameraComponent1.quality := TVideoCaptureQuality.PhotoQuality;
  except
  end;

  try
{$IFDEF ANDROID}
    CameraComponent1.FocusMode := TFocusMode.ContinuousAutoFocus;
{$ENDIF}
    CameraComponent1.active := true;
  except
    CameraComponent1.FocusMode := TFocusMode.locked;
    CameraComponent1.active := true;
  end;
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
    txtAboutHTML.TextSettings.FontColor := CTextColorInDarkMode;
    ReloadAboutText;
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
    txtAboutHTML.TextSettings.FontColor := CTextColorInLightMode;
    ReloadAboutText;
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
      if (FCurrentScreen = rPhotoScreen) then
        ActiveLaCamera(tconfig.CameraType);
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
    imgCamera.Size.Size := tsizef.create(w, h);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FCurrentScreen := nil;
  FCurrentProject := TcadPrjSaintValentin2014.create(nil);

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
  sbAbout.ViewportPosition := tpointf.create(0, 0);

  txtAboutHTML.TextSettings.Font.Size :=
    cadAboutBoutonRetourAuMenu1.Text1.TextSettings.Font.Size;
  ReloadAboutText;

  CurrentScreen := rAboutScreen;
end;

procedure TfrmMain.GoToHomeScreen;
begin
  sbHome.ViewportPosition := tpointf.create(0, 0);
  CurrentScreen := rHomeScreen;
end;

procedure TfrmMain.GoToOptionsScreen;
begin
  sbOptions.ViewportPosition := tpointf.create(0, 0);

  swOptionsThemeClair.IsChecked := not tconfig.ThemeSombreActif;

  CurrentScreen := rOptionsScreen;
end;

procedure TfrmMain.GoToPhotoScreen(AskPermission: boolean);
begin
  if AskPermission then
    TPermissionsService.DefaultService.RequestPermissions
      (['android.permission.CAMERA'],
      procedure(const APermissions: TClassicStringDynArray;
        const AGrantResults: TClassicPermissionStatusDynArray)
      var
        i: integer;
      begin
        for i := 0 to length(AGrantResults) - 1 do
          if (AGrantResults[i] = TPermissionStatus.Denied) then
            raise exception.create
              ('Permission nécessaire pour prendre une photo.');
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

    ActiveLaCamera(tconfig.CameraType);

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
  Img0 := TImage.create(self);
  try
    Img0.parent := self;
    Img0.Bitmap.Assign(FCurrentProject.imgBackground.Bitmap);
    Img0.width := Img0.Bitmap.width;
    Img0.Height := Img0.Bitmap.Height;
    Path := FMX.Objects.TPath.create(self);
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
      bmp := TBitmap.create(w, h);
      try
        x := trunc((imgCamera.width * 100 / tconfig.ZoomLevel - w) / 2);
        y := trunc((imgCamera.Height * 100 / tconfig.ZoomLevel - h) / 2);
        bmp.CopyFromBitmap(imgCamera.Bitmap, trect.create(x, y, x + w,
          y + h), 0, 0);
        Path.fill.Bitmap.Bitmap.Assign(bmp);
      finally
        // Img0.Bitmap.Assign(bmp); // pour comparer capture et affichage
        bmp.free;
      end;
      Img1 := TImage.create(self);
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
  end;
{$ENDIF}
end;

procedure TfrmMain.ReloadAboutText;
begin
  txtAboutHTML.Text := '<h1 style="text-align:center;color:#' +
    inttohex(txtAboutHTML.TextSettings.FontColor).Substring(2) +
    ';">Fie FraPic</h1>' + '<p style="color:#' +
    inttohex(txtAboutHTML.TextSettings.FontColor).Substring(2) +
    ';">Application mobile de prise de photo sur des événements ponctuels, Fie Frapic a été créée à l''origine pour la Saint Valentin 2024 mais évoluera en fonction de la demande et des événements auxquels on nous proposera de participer.</p>'
    + '<h2 style="color:#' + inttohex(txtAboutHTML.TextSettings.FontColor)
    .Substring(2) + ';">Licences</h2>' + '<p style="color:#' +
    inttohex(txtAboutHTML.TextSettings.FontColor).Substring(2) +
    ';">Les éléments visuels (icones, images) proviennent de bibliothèques graphiques ou ont été créés spécifiquement pour ce programme. Ils sont sous licence d''Adobe Stock, Google, Austin Andrews, Hans Böhm, Michael Irigoyen, Michael Richins, Colton Wiscombe et Patrick Prémartin.<br/>Ne les réutilisez pas sans accord préalable de leurs auteurs ou ayants droits.</p>'
    + '<p style="color:#' + inttohex(txtAboutHTML.TextSettings.FontColor)
    .Substring(2) +
    ';">Cette application a été développée sous Delphi 12 Athens.</p>' +
    '<p style="color:#' + inttohex(txtAboutHTML.TextSettings.FontColor)
    .Substring(2) +
    ';">L''application utilise également des éléments de la librairie Delphi HTML Components d''Alexander Sviridenkov.</p>'
    + '<h2 style="color:#' + inttohex(txtAboutHTML.TextSettings.FontColor)
    .Substring(2) + ';">Infos éditeur</h2>' + '<p style="color:#' +
    inttohex(txtAboutHTML.TextSettings.FontColor).Substring(2) +
    ';">Cette application a été développée par Patrick Prémartin.</p>' +
    '<p style="color:#' + inttohex(txtAboutHTML.TextSettings.FontColor)
    .Substring(2) +
    ';">Elle est éditée par la société OLF SOFTWARE immatriculée au registre du commerce et des ociétés de Paris (France) sous la référence 439521725.</p>'
    + '<h2 style="color:#' + inttohex(txtAboutHTML.TextSettings.FontColor)
    .Substring(2) + ';">Données personnelles</h2>' + '<p style="color:#' +
    inttohex(txtAboutHTML.TextSettings.FontColor).Substring(2) +
    ';">Fie Frapix est autonome dans sa version courante. Elle ne dépend pas d''internet et ne communique rien à l''extérieur.</p>'
    + '<p style="color:#' + inttohex(txtAboutHTML.TextSettings.FontColor)
    .Substring(2) +
    ';">Nous n''avons pas connaissance de ce que vous en faites. Les photos ne sont pas stockées par l''application.</p>'
    + '<p style="color:#' + inttohex(txtAboutHTML.TextSettings.FontColor)
    .Substring(2) +
    ';">Aucune information vous concernant ne nous est transmise ou n''est transmise par l''application à des tiers.</p>'
    + '<p style="color:#' + inttohex(txtAboutHTML.TextSettings.FontColor)
    .Substring(2) +
    ';">Nous n''utilisons pas de cookies, pas de tracking, pas de stats sur votre utilisation de l''application.</p>'
    + '<h2 style="color:#' + inttohex(txtAboutHTML.TextSettings.FontColor)
    .Substring(2) + ';">Support</h2>' + '<p style="color:#' +
    inttohex(txtAboutHTML.TextSettings.FontColor).Substring(2) +
    ';">Si vous avez des questions ou désirez des fonctionnalités supplémentaires, laissez nous un message sur le site de l''application.</p>'
    + '<p style="color:#' + inttohex(txtAboutHTML.TextSettings.FontColor)
    .Substring(2) +
    ';">Pour en savoir plus rendez-vous sur <a href="https://fiefrapic.olfsoftware.fr">https://fiefrapic.olfsoftware.fr</a>&nbsp;</p>'
    + '<p style="text-align:center;color:#' +
    inttohex(txtAboutHTML.TextSettings.FontColor).Substring(2) +
    ';">(c) 2024 Patrick Prémartin</p>';
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
  ReloadAboutText;
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
