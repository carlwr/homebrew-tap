class GnuMakeManualManpage < Formula
  desc "The full GNU Make Manual as a man page (make-manual(7))"
  homepage "https://www.gnu.org/software/make"
  url "https://ftp.gnu.org/gnu/make/make-4.4.1.tar.gz"
  sha256 "dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3"
  license "GFDL-1.3-or-later"

  depends_on "texi2mdoc" => :build

  MANPAGE = "make-manual.7".freeze

  def caveats
    <<~EOS
    The man page is installed as make-manual(7).

    To view it, run the command `man make-manual`.
    EOS
  end

  def install
    manpage = buildpath/MANPAGE
    texi    = buildpath/"doc/make.texi"

    manpage.write Utils.safe_popen_read("texi2mdoc", texi)
    man7.install manpage
  end

  test do
    assert_predicate man7/MANPAGE, :exist?
  end

end
