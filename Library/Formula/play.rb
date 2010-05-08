require 'formula'

class Play <Formula
  url 'http://download.playframework.org/releases/play-1.0.2.1.zip'
  homepage 'http://www.playframework.org/'
  sha1 '94d938afa01bcda8488a8588bd528d48bc09e282'
  version '1.0.2.1'

  def install
    rm Dir['*.bat']
    
    prefix.install Dir['*']
    (prefix + 'bin').mkpath
    (prefix+'bin'+'play').make_symlink(prefix+'play')
  end
end
