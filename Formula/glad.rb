class Glad < Formula
    desc "Pre-built GLAD (OpenGL Loader-Generator)"
    homepage "https://github.com/Dav1dde/glad"
    url "https://github.com/jamesy0ung/homebrew-glad/releases/download/release/glad.tar.gz"
    version "1.0.0"
    sha256 "fe75e68b49fa23dd2ca25f91eff1d0da1b76b9d4a9922a174bb34105bfe0559c"
    
    def install
      include.install Dir["include/KHR/*"]
      include.install Dir["include/glad/*"]
      
      (prefix/"src").install "src/glad.c"
      
      ln_sf prefix/"src/glad.c", "/usr/local/src/glad.c"
    end
    
    test do
      system "test", "-f", "#{include}/glad.h"
      system "test", "-f", "#{include}/khrplatform.h"
      system "test", "-f", "#{prefix}/src/glad.c"
    end
  end