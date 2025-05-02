import UIKit
import WebKit

class ABConsentViewController: UIViewController {
    
    private var webView: WKWebView!
    weak var delegate: ABConsentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        loadConsentPage()
    }
    
    private func setupWebView() {
        let configuration = WKWebViewConfiguration()
        let userContentController = WKUserContentController()
        
        // Ajouter un handler pour recevoir les messages du JavaScript
        userContentController.add(self, name: "abConsentHandler")
        configuration.userContentController = userContentController
        
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        webView.navigationDelegate = self
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(webView)
    }
    
    private func loadConsentPage() {
        guard let htmlPath = Bundle(for: ABConsentViewController.self)
            .path(forResource: "consent", ofType: "html", inDirectory: "ABConsent.bundle") else {
            let error = NSError(domain: "ABConsent", code: 404, userInfo: [NSLocalizedDescriptionKey: "HTML file not found"])
            delegate?.didFailWithError(error)
            return
        }
        
        do {
            let htmlContent = try String(contentsOfFile: htmlPath, encoding: .utf8)
            webView.loadHTMLString(htmlContent, baseURL: URL(string: "https://consentframework.com"))
        } catch {
            delegate?.didFailWithError(error)
        }
    }
    
    // Méthode pour fermer la vue
    @objc func dismiss() {
        dismiss(animated: true) {
            self.delegate?.didDismissConsentUI()
        }
    }
}

// Extension pour gérer les messages du JavaScript
extension ABConsentViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard let body = message.body as? [String: Any],
              let action = body["action"] as? String else {
            return
        }
        
        switch action {
        case "consentUpdate":
            if let data = body["data"] as? [String: Any] {
                delegate?.didUpdateConsent(consents: data)
            }
        case "userActionComplete":
            // Fermer automatiquement après que l'utilisateur ait fait son choix
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.dismiss()
            }
        default:
            break
        }
    }
}

// Extension pour gérer la navigation web
extension ABConsentViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        delegate?.didFailWithError(error)
    }
}