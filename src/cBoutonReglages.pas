unit cBoutonReglages;

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
  TcadBoutonReglages = class(TcadBoutonMenu)
  private
    { D�clarations priv�es }
  public
    procedure TraduireTexte; override;
    { D�clarations publiques }

  end;

implementation

{$R *.fmx}
{ TcadBoutonReglages }

procedure TcadBoutonReglages.TraduireTexte;
begin
  // TODO : traduire texte selon la langue en cours (ou choisie par l'utilisateur)
  text1.Text := 'Options';
end;

end.
