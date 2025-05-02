import Foundation

public protocol ABConsentDelegate: AnyObject {
    /// Appelé lorsque l'utilisateur a terminé son choix de consentement
    /// - Parameter consents: Dictionnaire contenant les consentements de l'utilisateur
    func didUpdateConsent(consents: [String: Any])
    
    /// Appelé lorsque l'utilisateur a fermé l'interface de consentement
    func didDismissConsentUI()
    
    /// Appelé en cas d'erreur lors du chargement ou de l'utilisation de la CMP
    /// - Parameter error: L'erreur survenue
    func didFailWithError(_ error: Error)
}