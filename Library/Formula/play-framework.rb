require 'formula'

class PlayFramework <Formula
  url 'http://download.playframework.org/releases/play-1.0.2.zip'
  homepage 'http://www.playframework.org'
  sha1 'd6ad8f5fe2cd56154ec03b905396859c'

  def install
    prefix.install Dir['*']
    bin.mkpath
    ln_s prefix+'play', bin
  end
end
