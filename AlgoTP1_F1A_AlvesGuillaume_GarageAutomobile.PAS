{
ALGO: GarageAutomobile
//BUT: Créer un algorithme qui gère 2 garages (adresse,nom,capacité maximum de 15 voitures) possédant des voitures (marque,modèle,énergie,puissance finale,puissance DYN,couleur,options,année du modèle, prix du modèle,etc...)  
//ENTREES:Caractéristiques de chaque garage et voiture
//SORTIES:Affichage fonctionnalité demandée


// Cette version ne contient pas :
//	-toutes les vérifications(fonctions incomplètes) des valeurs entrées par l'utilisateur ( garage et voiture)
//	-l'attribution de tous les paramètres d'une voiture, et d'un garage
//	-la formalisation du programme traitant la navigation de l'utilisateur (corps du programme)
	
// 	Traitement partiellement entamé


CONST
	CapaciteMax=15
	MaxFiscal=51
	MaxModele=10
	MaxGarage=10
	
TYPE LOGO=(Mercedes,Toyota,Renault,Peugeot,BMW)

TYPE ENERGIE=(Essence,Diesel,GPL,Electrique,Hybride)

TYPE COULEUR=(Rouge,Noir,Blanc,Bleu,Jaune)

TYPE
	ADRESSE=ENREGISTREMENT
		
		CP,email,voie,ville,pays,Tel,numero:CHAINE
FIN ENREGISTREMENT

TYPE
	Voiture=ENREGISTREMENT
		marque:logo
		carburant:energie
		Pfiscale,PDYN,modele,prix,age:ENTIER
		plaque,annee,datecircu:CHAINE
		color:COULEUR
FIN ENREGISTREMENT
	
TYPE
	GARAGE=ENREGISTREMENT
		nom:CHAINE
		emplac:adresse
		capacite:ENTIER
FIN ENREGISTREMENT		


FONCTION VerifDate (Date:CHAINE) DE BOOLEEN					//Vérifier si la chaine entrée est une date
	VAR
			DEBUT
				
			FIN


FONCTION CreaVoiture DE Voiture						//Création de voiture, avec vérification de chaque paramètre après l'entrée de l'utilisateur
	VAR
		longueur:ENTIER
		string:CHAINE
			DEBUT
				ECRIRE("Creation de voiture")
				ECRIRE("Entrez la marque de la voiture (Mercedes,Toyota,Renault,Peugeot, ou BMW): ")				//Lecture marque de la fonction voiture
				LIRE(CreaVoiture.marque)
				ECRIRE("Entrez le modèle de la voiture")
					REPETER
						ECRIRE(" jusqu'à " & MaxModele)
						LIRE(CreaVoiture.modele)
					JUSQU'A (CreaVoiture.modele>=1) ET (CreaVoiture.modele<=MaxModele)
				ECRIRE("Entrez le type d'énergie que la voiture requiert (Essence,Diesel,GPL,Electrique, ou Hybride): ")
				LIRE(CreaVoiture.carburant)
				ECRIRE("Entrez la puissance fiscale de la voiture")
					REPETER
						ECRIRE(" jusqu'à " & MaxFiscal)
						LIRE(CreaVoiture.Pfiscale)
					JUSQU'A (CreaVoiture.Pfiscale>=1) ET (CreaVoiture.Pfiscale<=MaxFiscal)
				ECRIRE("Entrez la puissance de la voiture ( en CV )")
				LIRE(CreaVoiture.PDYN)
				ECRIRE("Entrez la couleur de la voiture (Rouge,Noir,Blanc,Bleu,Jaune)")
				LIRE(CreaVoiture.couleur)
				ECRIRE("Entrez l'année de fabrication de la voiture")
					REPETER
						ECRIRE(" au format AAAA")
						LIRE(CreaVoiture.annee)
						longueur<-(longueur(CreaVoiture.annee))
						//Fonction Calcul de l'année d'aujourd'hui
					JUSQU'A (longueur=4) ET (CreaVoiture.age>0)
				ECRIRE("Entrez le prix de la voiture")
				LIRE(CreaVoiture.prix)
				ECRIRE("Entrez la date de mise en circulation de la voiture")
					REPETER
						ECRIRE(" au format JJ/MM/AAAA")
						LIRE(CreaVoiture.datecircu)
					JUSQU'A //Vérification du format JJ/MM/AAAA
				longueur<-(longueur(CreaVoiture.datecircu))
				string<-EXTRACTION(CreaVoiture.datecircu,longueur-4,4)
			FIN
			
FONCTION VerifEmail (mail:CHAINE) DE BOOLEEN
	VAR
		longueur:ENTIER
			DEBUT
				VerifEmail								//initialisation
				longueur<-(longueur(mail))
				POUR i DE 1 A longueur FAIRE
					SI mail[i]="@" ALORS				//Vérification du caractère "@" seulement, besoin d'ajouter la vérification du caractère"."
						VerifEmail<-VRAI
					FIN SI
				FIN POUR
			FIN
			
FONCTION VerifAdresse (emplac:adresse) DE BOOLEEN
	VAR
		longTest,i:ENTIER
			DEBUT
				VerifAdresse<-FAUX						//initialisation
				longTest<-(longueur(emplac.CP))
					SI LongTest<5 ALORS
						VerifAdresse<-FAUX
					FIN SI
					SI VerifEmail(mail)=FAUX ALORS
						VerifAdresse<-FAUX
					//besoin de vérifier certains paramètres (numéro de téléphone, code postal, email)
			FIN

FONCTION CreaGarage DE Garage
	VAR
		DEBUT
			ECRIRE("Entrez le nom du garage")
			LIRE("CreaGarage.nom")
			ECRIRE("Adresse, ")
			ECRIRE("Entrez le numéro de la rue")
			LIRE(emplac.numero)
			ECRIRE("Entrez la rue (exemple: rue des arbres)")
			LIRE(emplac.voie)
			ECRIRE("Entrez le nom de la ville")
			LIRE(emplac.ville)
			ECRIRE("Entrez le pays")
			LIRE(emplac.pays)
			ECRIRE("Entrez le numéro de téléphone")
			LIRE(emplac.Tel)
		FIN

VAR
	commande,stockgarage:ENTIER
	tabdonnee:tableau[1..10] DE garage 

DEBUT
	ECRIRE("Programme de stockage de voitures et de garages")
	stockgarage<-0
		REPETER
			ECRIRE("Il y a actuellement " & stockgarage & " garage(s)")
			ECRIRE("Entrez : ")
			ECRIRE(" 0 pour quitter")
			ECRIRE(" 1 pour créer un garage")
			ECRIRE(" 2 pour créer une voiture")
			LIRE(commande)
				SI (commande=2) ET (stockgarage=0) ALORS
					ECRIRE("Veuillez d'abord créer un garage")
				SINON
					CAS commande PARMI
						1:
							DEBUT
								(tabdonnee.stockgarage+1)<-CreaGarage
								
							FIN
						2:
							DEBUT
								
							FIN
		JUSQU'A commande=0
FIN


}