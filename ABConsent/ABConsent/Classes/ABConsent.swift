import Foundation
import UIKit

public class ABConsent {
    
    /// Initialise le SDK ABConsent
    /// - Parameter debug: Active le mode debug si true
    public static func initialize(debug: Bool = false) {
        if debug {
            print("ABConsent SDK initialized in debug mode")
        }
    }
    
    /// Présente l'interface de consentement
    /// - Parameters:
    ///   - viewController: Le ViewController depuis lequel présenter l'interface
    ///   - delegate: Le délégué qui recevra les événements de consentement
    public static func showConsentUI(from viewController: UIViewController, delegate: ABConsentDelegate) {
        ABConsentManager.shared().showConsentUI(from: viewController, delegate: delegate)
    }
    
    /// Vérifie si l'utilisateur a donné son consentement pour un objectif spécifique
    /// - Parameter purpose: L'identifiant de l'objectif à vérifier
    /// - Returns: true si l'utilisateur a consenti, false sinon
    public static func hasConsent(for purpose: String) -> Bool {
        return ABConsentManager.shared().hasConsent(for: purpose)
    }
    
    /// Récupère toutes les données de consentement
    /// - Returns: Un dictionnaire contenant toutes les données de consentement
    public static func getAllConsents() -> [String: Any]? {
        return ABConsentManager.shared().getAllConsents()
    }
    
    /// Réinitialise les consentements de l'utilisateur
    public static func resetConsents() {
        ABConsentManager.shared().resetConsents()
    }
}