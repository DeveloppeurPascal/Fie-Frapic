# 20240205 - [DeveloppeurPascal](https://github.com/DeveloppeurPascal)

## En live sur Twitch de 10 à 13 heures

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

### Tests sur iPad Pro

* retrait de l'autofocus sur iOS (crash comme sur macOS)
* retrait du bouton de sauvearde de l'image pour iOS (refus de l'OS, utiliser le partage)
* changement de l'activation/désactivation de la caméra

__Crash lors de l'affichage de l'écran de prise de photo une fois la première photo traitée.__

### Tests sur Android

* retrait du bloc de mise en place de l'autofocus qui ne fonctionne pas non plus sur Android (tfocusmode.ContinuousAutoFocus)
* désactivation du bouton de changement de caméra si l'OS génère une erreur lors du choix de la caméra à l'affichage de l'écran de capture

__Fonctionne (plus ou moins) correctement selon la version d'Android et l'ancienneté du smartphone.__

### Tests sur iPad Pro

__Plante toujours sur le réaffichage de l'écran de prise de photo une fois qu'on en a validé une.__

## Plus tard dans la journée, hors stream

* ajout de la déclaration de l'utilisation de la caméra dans le manifest Android afin de permettre un filtrage des périphériques sur les magasins d'applications
* remplacement du logo du programme dans les écrans par le nouveau
* changement du fonctionnement de l'activation de la caméra (regroupement des fonctionnalités pour toutes les paramétrer à chaque changement d'appareil entre le choix de celui-ci et son activation)
* masquage de l'icone du flash si la caméra n'en a pas
* réactivation de l'autofocus pour Android (avec interception et activation en mode classique s'il est indisponible)
* paramétrage de la qualité de prise de vue en utilisant le mode "photo" (équivalent à "haute définition")
* ajout d'une marge autour du logo du programme afin de ne pas le voir collé au haut de l'écran
* déploiement de la version 1.1 pour Android et soumission à Google Play et Amazon Appstore
