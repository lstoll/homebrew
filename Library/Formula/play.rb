require 'formula'

class Play <Formula
  url 'http://download.playframework.org/releases/play-1.0.2.1.zip'
  homepage 'http://www.playframework.org/'
  md5 'b13ab313945750810fe943aeeb2288d3'
  version '1.0.2.1'

  def install
    rm Dir['*.bat']
    
    prefix.install Dir['*']
    (prefix + 'bin').mkpath
    (prefix+'bin'+'play').make_symlink(prefix+'play')
  end
end
