class Makewash < Formula
  desc     "make make make less unbearable output"
  homepage "https://github.com/carlwr/makewash"
  version  "1.001"
  license  "(custom)"

  url "https://github.com/carlwr/makewash.git",
    using: :git,
    branch: "main"

  uses_from_macos "zsh"

  def install
    system "make", "install", "prefix=#{prefix}"
  end

end
