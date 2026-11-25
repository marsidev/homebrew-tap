cask "browter" do
  version "0.1.0"
  sha256 "15a576e4e2ae09e938dee50f4f7432f94c22ef05bf526be1de19947fee57731c"

  url "https://github.com/marsidev/browter/releases/download/v#{version}/Browter-#{version}-macos.zip"
  name "Browter"
  desc "Lightweight background-only default browser that routes links to the right browser or profile"
  homepage "https://github.com/marsidev/browter"

  depends_on macos: ">= :ventura"

  app "Browter.app"
  binary "#{appdir}/Browter.app/Contents/MacOS/Browter", target: "browter"

  uninstall quit: "dev.marsidev.browter"

  zap trash: [
    "~/.config/browter",
    "~/Library/Logs/Browter.log",
    "~/Library/Preferences/dev.marsidev.browter.plist",
  ]

  caveats <<~EOS
    Browter is currently ad-hoc signed (not notarized). If macOS Gatekeeper blocks it, run:
      xattr -dr com.apple.quarantine "#{appdir}/Browter.app"

    To get started:
      browter init
      browter profiles

    Then set Browter as your default browser in:
      System Settings -> Desktop & Dock -> Default web browser -> Browter
  EOS
end
