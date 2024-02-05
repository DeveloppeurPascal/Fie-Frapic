# 20240205 - [DeveloppeurPascal](https://github.com/DeveloppeurPascal)

* changement de l'icone / logo du projet
* mise à jour du dépôt sur GitHub pour l'imge utilisée sur les partages sociaux du dépôt
* génération des splashscrren Android et imges de lancement iOS (iPhone, iPad) par Delphi 12 Athens
* ajout des images de lancement au projet pour iOS et Android
* ajout d'un "Zoom0" pour revenir à la taille d'origine de la photo capturée
* déplacement des loupes en colonne de gauche de l'écran
* déplacement de la case de fermeture de l'écran de prise de photo en haut à droite comme dans l'écran de validation de l'image finale
* ajout de fichiers README.md dans les dossiers des "assets"
* mise à jour de la taille du texte des crédits pour qu'il soit plus lisible
* centrage des textes des boutons par rapport à la zone rectangulaire affichée
* changement du modèle de photo pour la Saint Valentin 2024 (fond+cadre en paysage pour impression en format photo classique 300dpi)
* correction du lancement de l'écran de capture sur Mac qui plantait l'application suite à ajout de l'autofocus
* ajout d'un espace entre les boutons de zoom en prise de photo
* correction du positionnement de l'image de la caméra, décalée suite à l'ajout des boutons de zoom

## Tests sur iPad Pro

* retrait de l'autofocus sur iOS (crash comme sur macOS)
* retrait du bouton de sauvearde de l'image pour iOS (refus de l'OS, utiliser le partage)
* changement de l'activation/désactivation de la caméra

=> crash lors de l'affichage de l'écran de prise de photo une fois la première photo traitée

## Tests sur Android

* retrait du bloc de mise en place de l'autofocus qui ne fonctionne pas non plus sur Android (tfocusmode.ContinuousAutoFocus)
* désactivation du bouton de changement de caméra si l'OS génère une erreur lors du choix de la caméra à l'affichage de l'écran de capture

=> fonctionne (plus ou moins) correctement selon la version d'Android et l'ancienneté du smartphone

## Tests sur iPad Pro

* plante toujours sur le réaffichage de l'écran de prise de photo une fois qu'on en a validé une
