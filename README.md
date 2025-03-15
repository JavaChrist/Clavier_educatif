# POC Clavier Correction

## 🚀 Description du projet
Ce projet est une **preuve de concept** (POC) pour un **clavier éducatif Flutter** permettant :
- **Correction des fautes d'orthographe** en temps réel.
- **Affichage du nombre de fautes détectées**.
- **Clavier personnalisé avec basculement Majuscule/Minuscule**.
- **Intégration d'un service de correction grammaticale**.

## 📂 Structure du projet
```
📁 clavier_educatif
│── 📂 lib
│   │── 📂 screens
│   │   └── keyboard_screen.dart   # Interface principale du clavier
│   │── 📂 widgets
│   │   └── custom_keyboard.dart   # Clavier personnalisé
│   │── 📂 services
│   │   └── grammar_service.dart   # Service de correction grammaticale
│── pubspec.yaml  # Dépendances Flutter
│── README.md  # Documentation
```

## ✅ Fonctionnalités implémentées
Voici les fonctionnalités déjà mises en place dans le projet :
- [x] **Clavier personnalisé Flutter** → Création d'un clavier sur mesure qui remplace le clavier natif.
- [x] **Affichage des touches en majuscules et minuscules** → Gestion du mode d'affichage en fonction de la touche Shift.
- [x] **Touche Shift pour basculer entre majuscules/minuscules** → Ajout d'un bouton Shift fonctionnel.
- [x] **Correction des fautes en temps réel** → Analyse automatique du texte avec indication des erreurs détectées.
- [x] **Détection et affichage du nombre de fautes** → Le nombre d'erreurs est affiché dynamiquement.
- [x] **Installation et exécution sur un appareil physique** → Tests réalisés avec succès sur un téléphone Android.

## 🔧 Fonctionnalités à implémenter
Les fonctionnalités suivantes sont prévues pour les prochaines mises à jour :
- [ ] **Ajout des chiffres et symboles au clavier** → Actuellement, seules les lettres sont disponibles.
- [ ] **Amélioration du design et de l'UX du clavier** → Ajustements visuels et animations pour une meilleure ergonomie.
- [ ] **Mise en cache des corrections pour améliorer les performances** → Optimisation du temps de réponse du correcteur.
- [ ] **Ajout d'une indication visuelle sur la touche Shift** → Affichage dynamique lorsque la touche Shift est activée.
- [ ] **Affichage des fautes en rouge dans la zone de texte** → Mise en évidence visuelle des erreurs pour une meilleure compréhension.
- [ ] **Amélioration du clavier** → Les lettres sur les touches doivent changer dynamiquement entre majuscules et minuscules selon l'état du Shift.
- [ ] **Effet visuel sur les touches lors de la pression** → Ajouter un effet de pression sur les touches pour un retour visuel amélioré.
- [ ] **Surlignage des fautes après plusieurs tentatives** → Une faute qui n'est pas corrigée après plusieurs essais sera mise en évidence plus fortement.
- [ ] **Affichage d'une règle simple après X erreurs** → Une explication rapide de la règle concernée sera affichée après un certain nombre d'erreurs.
- [ ] **Prévoir un système de récompense** → Encourager l'utilisateur avec un système de points ou badges pour améliorer l'apprentissage.

## 🛠️ Installation & Exécution
### 📥 Cloner le projet
```bash
git clone https://github.com/mon-repo/clavier_educatif.git
cd clavier_educatif
```

### 📦 Installer les dépendances
```bash
flutter pub get
```

### ▶ Lancer l'application sur un appareil physique
```bash
flutter run
```

## 🤝 Contribution
Si vous souhaitez contribuer à ce projet :
- **Forkez** le projet.
- **Proposez une pull request** avec vos améliorations.
- **Discutons des améliorations via les issues.**

## 📌 Remarque
Ce projet est un **POC**, certaines fonctionnalités peuvent être limitées ou en cours de développement.

---
🛠️ **Développé avec Flutter**

