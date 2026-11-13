cask "coreslot-menubar" do
  version "0.1.0"
  sha256 "3129871419c3f9b321a6f2dfc4fbff5ee6b8db272bcf3b597d583812486689bf"

  url "https://github.com/core-slot/coreslot-menubar/releases/download/v#{version}/coreslot-menubar-#{version}.zip"
  name "coreslot"
  desc "Menu bar view of what coreslot runs, queues and holds in memory"
  homepage "https://github.com/core-slot/coreslot-menubar"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "coreslot.app"

  uninstall quit: "io.github.core-slot.menubar"

  zap trash: [
    "~/Library/Preferences/io.github.core-slot.menubar.plist",
    "~/Library/Saved Application State/io.github.core-slot.menubar.savedState",
  ]
end
