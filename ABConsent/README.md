# ABConsent SDK pour iOS

Ce SDK permet d'intégrer facilement la solution de gestion de consentement ABConsent dans vos applications iOS.

## Installation

### CocoaPods

```ruby
pod 'ABConsent'
```

## Utilisation

### Initialisation

```swift
import ABConsent

// Dans votre AppDelegate ou SceneDelegate
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Initialiser le SDK
    ABConsent.initialize()
    return true
}
```

### Afficher l'interface de consentement

```swift
import ABConsent

class YourViewController: UIViewController, ABConsentDelegate {
    
    func showConsentUI() {
        ABConsent.showConsentUI(from: self, delegate: self)
    }
    
    // Implémentation des méthodes du délégué
    func didUpdateConsent(consents: [String: Any]) {
        print("Consentements mis à jour: \(consents)")
    }
    
    func didDismissConsentUI() {
        print("Interface de consentement fermée")
    }
    
    func didFailWithError(_ error: Error) {
        print("Erreur: \(error.localizedDescription)")
    }
}
```

### Vérifier les consentements

```swift
// Vérifier un consentement spécifique
if ABConsent.hasConsent(for: "analytics") {
    // L'utilisateur a consenti à l'analyse
}

// Récupérer tous les consentements
if let allConsents = ABConsent.getAllConsents() {
    print("Tous les consentements: \(allConsents)")
}
```

### Réinitialiser les consentements

```swift
ABConsent.resetConsents()
```

## Licence

Ce projet est sous licence MIT. Voir le fichier LICENSE pour plus d'informations.
```

## Étape 9: Création du fichier LICENSE

```text:ABConsent/LICENSE
MIT License

Copyright (c) 2023 Votre Organisation

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.