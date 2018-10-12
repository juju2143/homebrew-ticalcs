cask 'cemu' do
  version '1.1.1'
  sha256 'bc1bb34d1547f5731fd49169024903d4bf35b04e973a177d6e1d7c19188cbdbb'

  # github.com/CE-Programming/CEmu was verified as official when first introduced to the cask
  url "https://github.com/CE-Programming/CEmu/releases/download/v#{version}/macOS_CEmu.dmg"
  appcast 'https://github.com/CE-Programming/CEmu/releases.atom'
  name 'CEmu'
  homepage 'https://ce-programming.github.io/CEmu/'

  app 'CEmu.app'
end
