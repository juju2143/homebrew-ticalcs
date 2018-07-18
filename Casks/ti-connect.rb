cask 'ti-connect' do
  version '4.0'
  sha256 '4404f04464ba977b81227d6546a82868c7f58d2ebbda5b116e613d884d4c5cb8'

  url "https://education.ti.com/download/en/ed-tech/D7445DBBA5124FA9B4F3F1B222A8005A/54FDF69C5FAB4143B20C7CC779FA51BD/TIConnect_#{version.no_dots}.dmg"
  name 'TI Connect™'
  homepage 'https://education.ti.com/en/products/computer-software/ti-connect-sw'

  pkg 'ticonnectx.pkg'

  uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.*.pkg'
end
