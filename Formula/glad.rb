class Glad < Formula
  desc "Pre-built GLAD (OpenGL Loader-Generator)"
  homepage "https://github.com/Dav1dde/glad"
  url "https://github.com/jamesy0ung/homebrew-glad/releases/download/release/glad.tar.gz"
  version "1.0.0"
  sha256 "fe75e68b49fa23dd2ca25f91eff1d0da1b76b9d4a9922a174bb34105bfe0559c"
  
  def install
    (include/"KHR").install Dir["include/KHR/*"]
    (include/"glad").install Dir["include/glad/*"]
    
    (lib/"glad").install "src/glad.c"
    
    bin.mkpath
    
    (bin/"glad-location").write <<~EOS
      #!/bin/bash
      echo "GLAD source file location: #{lib}/glad/glad.c"
      echo "GLAD headers location: #{include}/glad/glad.h"
      echo "KHR headers location: #{include}/KHR/khrplatform.h"
    EOS
    
    chmod 0755, bin/"glad-location"
  end
  
  def caveats
    <<~EOS
      GLAD files have been installed:
        Source file: #{lib}/glad/glad.c
        Headers: #{include}/glad/glad.h
                #{include}/KHR/khrplatform.h
      
      To find the locations of GLAD files, run:
        glad-location
      
      When compiling, add #{lib}/glad/glad.c to your source files.
    EOS
  end

  test do
    system "test", "-f", "#{include}/glad/glad.h"
    system "test", "-f", "#{include}/KHR/khrplatform.h"
    system "test", "-f", "#{lib}/glad/glad.c"
  end
end