require 'formula'

class Ant < Formula
  url 'http://www.apache.org/dist/ant/binaries/apache-ant-1.8.1-bin.tar.gz'
  version '1.8.1'
  homepage 'http://ant.apache.org/'
  md5 'dc9cc5ede14729f87fe0a4fe428b9185'

  def install
    rm_f Dir["bin/*.bat"]
    prefix.install %w[bin docs etc lib]
  end
end
