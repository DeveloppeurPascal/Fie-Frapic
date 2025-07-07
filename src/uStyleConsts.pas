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
  File last update : 2025-07-03T10:43:59.349+02:00
  Signature : 4593491d184535e2a60fc896b46f808136ef8103
  ***************************************************************************
*)

unit uStyleConsts;

interface

uses
  System.UITypes;

// Todo : compléter XMLDoc

Const
  // **************************************************
  // * Dark Mode
  // **************************************************

  /// <summary>
  ///
  /// </summary>
  CMenuBoutonShadowColorInDarkMode = TAlphaColors.White;
  /// <summary>
  ///
  /// </summary>
  CMenuBoutonBackgroundColorInDarkMode = TAlphaColors.Darkgray;
  // CMenuBoutonBackgroundColorInDarkMode = TAlphaColors.Dimgray;
  /// <summary>
  ///
  /// </summary>
  CMenuBoutonIconStrokeColorInDarkMode = TAlphaColors.White;
  /// <summary>
  ///
  /// </summary>
  CMenuBoutonIconFillColorInDarkMode = TAlphaColors.Aliceblue;
  /// <summary>
  ///
  /// </summary>
  CMenuBoutonTextColorInDarkMode = TAlphaColors.White;
  /// <summary>
  ///
  /// </summary>
  CBackgroundColorInDarkMode = TAlphaColors.Dimgray;
  /// <summary>
  ///
  /// </summary>
  CTextColorInDarkMode = CMenuBoutonTextColorInDarkMode;
  /// <summary>
  ///
  /// </summary>
  CIconStrokeColorInDarkMode = CMenuBoutonIconStrokeColorInDarkMode;
  /// <summary>
  ///
  /// </summary>
  CIconFillColorInDarkMode = CMenuBoutonIconFillColorInDarkMode;
  /// <summary>
  ///
  /// </summary>
  CMaskPathStrokeColorInDarkMode = CIconStrokeColorInDarkMode;

  // **************************************************
  // * Light Mode
  // **************************************************

  /// <summary>
  ///
  /// </summary>
  CMenuBoutonShadowColorInLightMode = TAlphaColors.Black;
  /// <summary>
  ///
  /// </summary>
  CMenuBoutonBackgroundColorInLightMode = TAlphaColors.Azure;
  // CMenuBoutonBackgroundColorInLightMode = TAlphaColors.Lightyellow;
  /// <summary>
  ///
  /// </summary>
  CMenuBoutonIconStrokeColorInLightMode = TAlphaColors.Black;
  /// <summary>
  ///
  /// </summary>
  CMenuBoutonIconFillColorInLightMode = TAlphaColors.Darkblue;
  /// <summary>
  ///
  /// </summary>
  CMenuBoutonTextColorInLightMode = TAlphaColors.Black;
  /// <summary>
  ///
  /// </summary>
  CBackgroundColorInLightMode = TAlphaColors.Lightsalmon;
  /// <summary>
  ///
  /// </summary>
  CTextColorInLightMode = CMenuBoutonTextColorInLightMode;
  /// <summary>
  ///
  /// </summary>
  CIconStrokeColorInLightMode = CMenuBoutonIconStrokeColorInLightMode;
  /// <summary>
  ///
  /// </summary>
  CIconFillColorInLightMode = CMenuBoutonIconFillColorInLightMode;
  /// <summary>
  ///
  /// </summary>
  CMaskPathStrokeColorInLightMode = CIconStrokeColorInLightMode;

implementation

end.
