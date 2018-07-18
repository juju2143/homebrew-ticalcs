cask 'ti-connect' do
    version '4.0'
    sha256 '4404f04464ba977b81227d6546a82868c7f58d2ebbda5b116e613d884d4c5cb8'

    url "https://education.ti.com/download/en/ed-tech/D7445DBBA5124FA9B4F3F1B222A8005A/54FDF69C5FAB4143B20C7CC779FA51BD/TIConnect_#{version.no_dots}.dmg"
    name 'TI Connect™'
    homepage 'https://education.ti.com/en/products/computer-software/ti-connect-sw'
  
    pkg 'ticonnectx.pkg'

    uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.Conversionplugin.pkg'
    uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.QuickstartGuidetoUsingTIConnectforOSX.pkg'
    uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.TIAppKit.pkg'
    uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.TIConnect.pkg'
    uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.TIConnectManagerX.pkg'
    uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.TIConnectManagerXInteraction.pkg'
    uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.TIDataConversionBase.pkg'
    uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.TIDataEditor.pkg'
    uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.TIDeviceExplorer.pkg'
    uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.TIOSRestore.pkg'
    uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.TIPluginLocator.pkg'
    uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.TISoftwareUpdate.pkg'
    uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.TIUniBold.pkg'
    uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.TIUniRegular.pkg'
    uninstall pkgutil: 'com.ti.education.tiConnectapplicationSuite.UnInstallTIConnect.pkg'
end
