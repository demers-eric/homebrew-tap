class Nanobar < Formula
  desc "Minimal macOS status bar companion for AeroSpace (Custom Fork)"
  homepage "https://github.com/demers-eric/nanobar"
  license "MIT"
  
  # This tells Homebrew to pull directly from your fork and branch
  head "https://github.com/demers-eric/nanobar.git", branch: "alt-key-visibility"

  depends_on macos: :sequoia

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/NanoBar" => "nanobar"
  end

  service do
    run opt_bin/"nanobar"
    keep_alive true
    run_at_load true
    log_path "/tmp/nanobar.log"
    error_log_path "/tmp/nanobar.err"
    environment_variables PATH: std_service_path_env
  end
end
