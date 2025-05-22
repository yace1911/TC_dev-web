# MY Boutique - Application E-commerce

Une application e-commerce complète développée en PHP avec une architecture MVC.

## Fonctionnalités

### Pour les clients
- Création et gestion de compte
- Catalogue de produits avec filtres par catégorie
- Panier d'achat interactif
- Processus de commande complet
- Historique des commandes
- Participation aux événements

### Pour les commerciaux (IT)
- Gestion des produits (ajout, modification, suppression)
- Création d'événements (soumis à validation par l'admin)

### Pour les administrateurs
- Tableau de bord avec statistiques de ventes
- Gestion complète des utilisateurs
- Validation des événements
- Suivi des commandes
- Rapports de ventes

## Installation

### Prérequis
- PHP 7.4 ou supérieur
- MySQL 5.7 ou supérieur
- Serveur Apache (XAMPP, WAMP, etc.)

### Étapes d'installation

1. Clonez ou téléchargez ce dépôt dans votre répertoire web (ex: htdocs pour XAMPP)

2. Importez la base de données
   - Ouvrez phpMyAdmin
   - Créez une base de données nommée `my_boutique`
   - Importez le fichier `database.sql` pour créer les tables et les données de démo

3. Configurez la connexion à la base de données
   - Ouvrez le fichier `config/database.php`
   - Modifiez les paramètres de connexion si nécessaire (nom d'utilisateur, mot de passe, etc.)

4. Assurez-vous que les dossiers suivants sont accessibles en écriture :
   - `public/assets/uploads/products/`
   - `public/assets/uploads/events/`
   
5. Créez ces dossiers s'ils n'existent pas :
   ```bash
   mkdir -p public/assets/uploads/products
   mkdir -p public/assets/uploads/events
   ```

## Utilisation

1. Accédez à l'application via votre navigateur :
   ```
   http://localhost/MY-boutique/
   ```

2. Comptes de démonstration :
   - Administrateur :
     - Email : admin@myboutique.com
     - Mot de passe : password123
   
   - Commercial/IT :
     - Email : it@myboutique.com
     - Mot de passe : password123

3. Vous pouvez également créer votre propre compte client via le formulaire d'inscription.

## Structure du projet

```
MY-boutique/
├── app/                  # Code de l'application
│   ├── controllers/      # Contrôleurs
│   ├── models/           # Modèles
│   └── views/            # Vues
├── config/               # Configuration (BDD, etc.)
├── core/                 # Classes de base du framework MVC
├── public/               # Fichiers publics
│   ├── assets/           # CSS, JS, images
│   ├── index.php         # Point d'entrée de l'application
│   └── .htaccess         # Configuration d'Apache
└── .htaccess             # Redirection vers public/
```

## Développement

### Ajout de nouvelles fonctionnalités
1. Créez ou modifiez les modèles dans `app/models/`
2. Ajoutez les méthodes correspondantes dans les contrôleurs `app/controllers/`
3. Créez ou modifiez les vues dans `app/views/`

### Base de données
- Le fichier `database.sql` contient le schéma complet de la base de données
- Utilisez le modèle correspondant pour interagir avec chaque table 
