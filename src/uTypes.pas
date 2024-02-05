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
