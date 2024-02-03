unit cBoutonPrendrePhoto;

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
  TcadBoutonPrendrePhoto = class(TcadBoutonMenu)
  private
    { Déclarations privées }
  public
    procedure TraduireTexte; override;
    { Déclarations publiques }

  end;

implementation

{$R *.fmx}
{ TcadBoutonPrendrePhoto }

procedure TcadBoutonPrendrePhoto.TraduireTexte;
begin
  // TODO : traduire texte selon la langue en cours (ou choisie par l'utilisateur)
  text1.Text := 'Photo';
end;

end.
