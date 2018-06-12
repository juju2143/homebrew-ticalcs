cask 'cemu' do
  version '1.0'
  sha256 'c5da7fdb62cadc8d6f7c8148bc85b8d2f5b14361009cd0ad5689596dfd5ef04c'

  # github.com/CE-Programming/CEmu was verified as official when first introduced to the cask
  url "https://github.com/CE-Programming/CEmu/releases/download/v#{version}/macOS_CEmu.zip"
  appcast 'https://github.com/CE-Programming/CEmu/releases.atom'
  name 'CEmu'
  homepage 'https://ce-programming.github.io/CEmu/'

  app 'CEmu.app'
end
