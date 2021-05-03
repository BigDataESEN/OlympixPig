# Olympix Pig

## Présentation

* Ce projet contient un script écrit en `Pig Latin` permettant d'analyser le contenu du dataset `olympix_data.csv`.

## Prérequis

* Installer Apache Hadoop sur votre machine
* Installer Java JDK version 1.8
* Installer Apache Pig


## Utilisation

* Télécharger le fichier de données disponible sur ce lien [https://github.com/BigDataESEN/datasets/blob/main/olympix_data.csv](https://github.com/BigDataESEN/datasets/blob/main/olympix_data.csv)

* Envoyer le fichier `olympix_data.csv` à votre cluster hdfs.
  ```
  hdfs dfs -mkdir app
  hdfs dfs -put olympix_data.csv app/olympix_data.csv
  ```
  
* Démarrer le service MapReduce JobHistory Server
  ```
  mapred --daemon start historyserver
  ```

* Placer le fichier `analyse.pig` dans votre répertoire de travail, puis lancer la commande suivante :

  ```
  pig analyse.pig
  ```

  Ce script calcule pour chaque pays le nombre total de médailles gangées, puis récupére les cinq pays qui ont remporté le plus de médailles. Le résultat sera stocké dans le repertoire __output__ de votre cluster hdfs.

  ![screenshot](https://www.nassimbahri.ovh/docs/bigdata/documentations/olympix/c3.png)

## Modification

* Pour modifier le nombre de pays à afficher, vous devez modifier la ligne suivante :

  ```
  top_countries = limit sorted_pays 5;
  ```

   Par exemple: remplacer la valeur `5` par `10` pour afficher les dix pays qui ont remporté le plus de médailles.

* Pour modifier le chemin vers le dossier de résultat, vous devez modifier la ligne suivante :

  ```
  store top_countries into 'output';
  ```

## Voir aussi

* Version MapReduce disponible sur ce [lien](https://github.com/BigDataESEN/OlympixMapReduce).