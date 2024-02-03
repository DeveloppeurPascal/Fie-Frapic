program FieFrapic;

uses
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  Olf.RTL.SystemAppearance in '..\lib-externes\librairies\Olf.RTL.SystemAppearance.pas',
  cBoutonMenu in 'cBoutonMenu.pas' {cadBoutonMenu: TFrame},
  cBoutonPrendrePhoto in 'cBoutonPrendrePhoto.pas' {cadBoutonPrendrePhoto: TFrame},
  cBoutonAbout in 'cBoutonAbout.pas' {cadBoutonAbout: TFrame},
  cBoutonReglages in 'cBoutonReglages.pas' {cadBoutonReglages: TFrame},
  Olf.RTL.Language in '..\lib-externes\librairies\Olf.RTL.Language.pas',
  uDMProjectLogo in 'uDMProjectLogo.pas' {dmProjectLogo: TDataModule},
  uStyleConsts in 'uStyleConsts.pas',
  uConfig in 'uConfig.pas',
  Olf.RTL.Params in '..\lib-externes\librairies\Olf.RTL.Params.pas',
  cBoutonRetourAuMenu in 'cBoutonRetourAuMenu.pas' {cadBoutonRetourAuMenu: TFrame},
  uTypes in 'uTypes.pas',
  cPrjSaintValentin2014 in '..\_PRIVATE\src\cPrjSaintValentin2014.pas' {cadPrjSaintValentin2014: TFrame},
  cBoutonIcone in 'cBoutonIcone.pas' {cadBoutonIcone: TFrame},
  CBoutonIconeChoixAppareil in 'CBoutonIconeChoixAppareil.pas' {CadBoutonIconeChoixAppareil: TFrame},
  cBoutonIconeFlashOn in 'cBoutonIconeFlashOn.pas' {cadBoutonIconeFlashOn: TFrame},
  cBoutonIconeFlashOff in 'cBoutonIconeFlashOff.pas' {cadBoutonIconeFlashOff: TFrame},
  cBoutonIconeZoomPlus in 'cBoutonIconeZoomPlus.pas' {cadBoutonIconeZoomPlus: TFrame},
  cBoutonIconeZoomMoins in 'cBoutonIconeZoomMoins.pas' {cadBoutonIconeZoomMoins: TFrame},
  cBoutonIconeTakePhoto in 'cBoutonIconeTakePhoto.pas' {cadBoutonIconeTakePhoto: TFrame},
  cBoutonIconeClose in 'cBoutonIconeClose.pas' {cadBoutonIconeClose: TFrame},
  cBoutonIconeShare in 'cBoutonIconeShare.pas' {cadBoutonIconeShare: TFrame},
  cBoutonIconeSave in 'cBoutonIconeSave.pas' {cadBoutonIconeSave: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait, TFormOrientation.InvertedPortrait];
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmProjectLogo, dmProjectLogo);
  Application.Run;
end.
