class PosixManpages < Formula
  desc "Man pages for `POSIX.1-2017` shell utils, library functions and system headers"
  homepage "https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/man-pages-posix"
  url "https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/man-pages-posix/man-pages-posix-2017-a.tar.gz"
  sha256 "8ba538e91db62622c507e34899e1e7d560e870505c00cd4d7f8d5048e54d056e"
  license "(custom)"

  option    "with-0p", "desc"
  option "without-1p", "don't include section (1) pages"
  option    "with-3p", "include section (3) pages (library functions)"


  def caveats
    <<~EOS
    Man pages are installed with a 'posix-' prefix. E.g. to view the POSIX man page for find(1), use:
        man posix-find

    Only man pages for section (1) are installed by default. To override, run `brew install` with any combination of the following CLI arguments:
        --with-0p
        --without-1p
        --with-3p
    EOS
  end


  def install

    if build.with? "0p"
      Dir.glob("man0p/*.0p").each do |file|
        (man/"man0").install file => "posix-#{File.basename(file)}"
      end
    end

    if build.with? "1p"
      Dir.glob("man1p/*.1p").each do |file|
        man1.install file => "posix-#{File.basename(file)}"
      end
    end

    if build.with? "3p"
      Dir.glob("man3p/*.3p").each do |file|
        man3.install file => "posix-#{File.basename(file)}"
      end
    end

  end


  test do
    assert_predicate man1/"posix-admin.1p", :exist?
  end


end
