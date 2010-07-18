require 'formula'

class HttpConsole < Formula
  head 'git://github.com/cloudhead/http-console.git'

  def install
    prefix.install Dir['*']
  end
end
