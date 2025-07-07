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
  File last update : 2025-07-03T10:44:00.000+02:00
  Signature : d6b6af974d7af8b2410fed87c3763c5f7afe621e
  ***************************************************************************
*)

program FieFrapic;

uses
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  cBoutonMenu in 'cBoutonMenu.pas' {cadBoutonMenu: TFrame},
  cBoutonPrendrePhoto in 'cBoutonPrendrePhoto.pas' {cadBoutonPrendrePhoto: TFrame},
  cBoutonAbout in 'cBoutonAbout.pas' {cadBoutonAbout: TFrame},
  cBoutonReglages in 'cBoutonReglages.pas' {cadBoutonReglages: TFrame},
  uDMProjectLogo in 'uDMProjectLogo.pas' {dmProjectLogo: TDataModule},
  uStyleConsts in 'uStyleConsts.pas',
  uConfig in 'uConfig.pas',
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
  cBoutonIconeSave in 'cBoutonIconeSave.pas' {cadBoutonIconeSave: TFrame},
  cBoutonIconeZoom0 in 'cBoutonIconeZoom0.pas' {cadBoutonIconeZoom0: TFrame},
  Olf.FMX.AboutDialog in '..\lib-externes\AboutDialog-Delphi-Component\src\Olf.FMX.AboutDialog.pas',
  Olf.FMX.AboutDialogForm in '..\lib-externes\AboutDialog-Delphi-Component\src\Olf.FMX.AboutDialogForm.pas' {OlfAboutDialogForm},
  Olf.RTL.Language in '..\lib-externes\librairies\src\Olf.RTL.Language.pas',
  Olf.RTL.Params in '..\lib-externes\librairies\src\Olf.RTL.Params.pas',
  Olf.RTL.SystemAppearance in '..\lib-externes\librairies\src\Olf.RTL.SystemAppearance.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait, TFormOrientation.InvertedPortrait];
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmProjectLogo, dmProjectLogo);
  Application.Run;
end.
