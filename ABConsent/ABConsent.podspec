Pod::Spec.new do |s|
  s.name             = 'ABConsent'
  s.version          = '0.1.0'
  s.summary          = 'SDK iOS pour intégrer la CMP ABConsent'
  s.description      = <<-DESC
  Ce SDK permet d'intégrer facilement la solution de gestion de consentement ABConsent dans vos applications iOS.
  Il affiche l'interface de consentement et gère les préférences utilisateur.
                       DESC
  s.homepage         = 'https://github.com/votre-organisation/abconsent-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Votre Nom' => 'votre.email@example.com' }
  s.source           = { :git => 'https://github.com/votre-organisation/abconsent-ios.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'
  s.source_files = 'ABConsent/Classes/**/*'
  s.resource_bundles = {
    'ABConsent' => ['ABConsent/Assets/*.html']
  }
end