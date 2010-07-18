require 'formula'

# TODO de-version the include and lib directories

class Ruby18 <Formula
  @url='http://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p248.tar.bz2'
  @homepage='http://www.ruby-lang.org/en/'
  @md5='37e19d46b7d4b845f57d3389084b94a6'

  depends_on 'readline'

  def options
    [
      ["--no-suffix", "Don't add the 1.8 suffix commands"],
    ]
  end
  
  def install
    ENV.gcc_4_2

    args = [ "--prefix=#{prefix}",
            "--with-readline=#{HOMEBREW_PREFIX}",
            "--enable-pthread",
            "--enable-shared" ]

    args << "--program-suffix=1.8" unless ARGV.include? "--no-suffix"

    system "./configure", *args
    system "make"
    system "make install"

    #Gems
    Ruby18Rubygems.new.brew do
      ruby = ARGV.include?("--no-suffix") ? "ruby" : "ruby1.8"
      ruby = "#{prefix}/bin/#{ruby}"
      system ruby, "setup.rb", "--prefix=#{prefix}", "--format-executable"
    end
  end
  
  def caveats; <<-EOS
If you install gems with the RubyGems installed with this formula they will
to this formula's prefix. This needs to be fixed, as for example, upgrading
Ruby will lose all your gems. Maybe.
    EOS
  end

  def skip_clean? path
    # TODO only skip the clean for the files that need it, we didn't get a
    # comment about why we're skipping the clean, so you'll need to figure
    # that out first --mxcl
    true
  end
end

class Ruby18Rubygems <Formula
  url "http://production.cf.rubygems.org/rubygems/rubygems-1.3.7.tgz"
  md5 "e85cfadd025ff6ab689375adbf344bbe"
  homepage "http://docs.rubygems.org/"
end
