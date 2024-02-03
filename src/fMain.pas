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
  cBoutonIconeSave;

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
    imgCamera: TImage;
    lPhotoHeader: TLayout;
    lPhotoFooter: TLayout;
    gplFooter: TGridPanelLayout;
    lFlashOnOff: TLayout;
    cadBoutonIconeFlashOn1: TcadBoutonIconeFlashOn;
    cadBoutonIconeFlashOff1: TcadBoutonIconeFlashOff;
    cadBoutonIconeTakePhoto1: TcadBoutonIconeTakePhoto;
    CadBoutonIconeChoixAppareil1: TCadBoutonIconeChoixAppareil;
    gplHeader: TGridPanelLayout;
    cadBoutonIconeZoomPlus1: TcadBoutonIconeZoomPlus;
    cadBoutonIconeZoomMoins1: TcadBoutonIconeZoomMoins;
    cadBoutonIconeClose1: TcadBoutonIconeClose;
    CameraComponent1: TCameraComponent;
    imgPhotoFinale: TImage;
    lPhotoValidHeader: TLayout;
    lPhotoValidFooter: TLayout;
    gplPhotoValidCenter: TGridPanelLayout;
    cadBoutonIconeTakePhoto2: TcadBoutonIconeTakePhoto;
    cadBoutonIconeClose2: TcadBoutonIconeClose;
    cadBoutonIconeSave1: TcadBoutonIconeSave;
    cadBoutonIconeShare1: TcadBoutonIconeShare;
    MaskPath: TPath;
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
    procedure cadBoutonIconeClose1Click(Sender: TObject);
    procedure CameraComponent1SampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
    procedure CadBoutonIconeChoixAppareil1Click(Sender: TObject);
    procedure cadBoutonIconeFlashOff1Click(Sender: TObject);
    procedure cadBoutonIconeFlashOn1Click(Sender: TObject);
    procedure cadBoutonIconeTakePhoto1Click(Sender: TObject);
    procedure cadBoutonIconeTakePhoto2Click(Sender: TObject);
    procedure cadBoutonIconeClose2Click(Sender: TObject);
    procedure cadBoutonIconeSave1Click(Sender: TObject);
    procedure cadBoutonIconeShare1Click(Sender: TObject);
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
        CameraComponent1.Kind := tcamerakind.BackCamera;
        tconfig.CameraType := ttypecamera.back;
        tconfig.save;
      except
        CameraComponent1.Kind := tcamerakind.frontCamera;
        tconfig.CameraType := ttypecamera.Front;
      end;
    ttypecamera.back:
      try
        CameraComponent1.Kind := tcamerakind.frontCamera;
        tconfig.CameraType := ttypecamera.Front;
        tconfig.save;
      except
        CameraComponent1.Kind := tcamerakind.BackCamera;
        tconfig.CameraType := ttypecamera.back;
      end;
  else
    showmessage('Camera Type Unknown !');
  end;
  CameraComponent1.active := true;
end;

procedure TfrmMain.cadBoutonIconeClose1Click(Sender: TObject);
begin
  GoToHomeScreen;
end;

procedure TfrmMain.cadBoutonIconeClose2Click(Sender: TObject);
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
  showmessage('Image sauvegard�e');
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
  CameraComponent1.active := false;
  GoToPhotoValidationScreen;
end;

procedure TfrmMain.cadBoutonIconeTakePhoto2Click(Sender: TObject);
begin
  GoToPhotoScreen;
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
begin
  CameraComponent1.SampleBufferToBitmap(imgCamera.Bitmap, true);
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
            showmessage('Permission n�cessaire pour prendre une photo.');
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
          ('Il est n�cessaire d''avoir cette autorisation pour prendre une photo.',
          procedure(Const AModalResult: TModalResult)
          begin
            if assigned(APostRationaleProc) then
              APostRationaleProc;
          end);
      end)
  else
  begin
    MaskPath.data.data := FCurrentProject.MaskPath.data.data;

    ModifieEtatDuFlash(tconfig.isCameraFlashActive);

    case tconfig.CameraType of
      ttypecamera.Front:
        CameraComponent1.Kind := tcamerakind.frontCamera;
      ttypecamera.back:
        CameraComponent1.Kind := tcamerakind.BackCamera;
    else
      showmessage('Camera type unknown !');
    end;

    CameraComponent1.active := true;

    cadBoutonIconeZoomMoins1.visible := false; // TODO : � traiter
    cadBoutonIconeZoomPlus1.visible := false; // TODO : � traiter

    CurrentScreen := rPhotoScreen;
  end;
end;

procedure TfrmMain.GoToPhotoValidationScreen;
var
  Img0, Img1: TImage;
  Path: FMX.Objects.TPath;
  bmp: TBitmap;
begin
  Img0 := TImage.Create(self);
  try
    Img0.parent := self;
    Img0.Bitmap.Assign(FCurrentProject.imgBackground.Bitmap);
    Img0.width := Img0.Bitmap.width;
    Img0.height := Img0.Bitmap.height;
    Path := FMX.Objects.TPath.Create(self);
    try
      Path.parent := Img0;
      Path.align := talignlayout.center;
      Path.width := Img0.width - 2 * Img0.width / 10;
      Path.height := Img0.height - 2 * Img0.height / 10;
      Path.WrapMode := TPathWrapMode.Fit;
      Path.data.data := FCurrentProject.MaskPath.data.data;
      Path.Stroke.Kind := TBrushKind.None;
      Path.fill.Kind := TBrushKind.Bitmap;
      // TODO : � revoir (positionner la bonne partie de l'image de la cam�ra dans le masque)
      Path.fill.Bitmap.Bitmap.Assign(imgCamera.Bitmap);
      Path.fill.Bitmap.WrapMode := twrapmode.TileStretch;
      Img1 := TImage.Create(self);
      try
        Img1.parent := Img0;
        Img1.Bitmap.Assign(FCurrentProject.imgForeground.Bitmap);
        Img1.width := Img0.width;
        Img1.height := Img0.height;

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
    showmessage('Flash not available');
  end;
end;

procedure TfrmMain.SetCurrentScreen(const Value: TRectangle);
begin
  if assigned(FCurrentScreen) then
  begin
    // TODO : faire une �ventuelle animation de masquage
    FCurrentScreen.visible := false;
  end;

  FCurrentScreen := Value;

  if assigned(FCurrentScreen) then
  begin
    if (FCurrentScreen <> rPhotoScreen) and (CameraComponent1.active) then
      CameraComponent1.active := false;

    // TODO : faire une �ventuelle animation d'affichage
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

  // Texte de l'�cran des informations l�gales (cr�dits et licences)
  txtAbout.Text := 'Fie FraPic' + slinebreak + '(c) 2024 Patrick Pr�martin' +
    slinebreak + '' + slinebreak +
    'Application mobile de prise de photo sur des �v�nements ponctuels, Fie Frapic a �t� d�velopp�e � l''origine pour la Saint Valentin 2024 sous Delphi 12 Alexandria.'
    + slinebreak + slinebreak +
    'Certains �l�ments visuels sont sous licence d ''Adobe Stock ou Google.' +
    slinebreak + slinebreak +
    'Pour en savoir plus rendez-vous sur https://fiefrapic.olfsoftware.fr' +
    slinebreak;
end;

initialization

TDialogService.PreferredMode := TDialogService.TPreferredMode.Async;

end.
