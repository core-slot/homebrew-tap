cask "coreslot-menubar" do
  version "0.1.0"
  # Replaced from the v0.1.0 release zip when that is published.
  sha256 "d1e9fe12479920af5d4d92ceae50bc130b372a74802819e430e0d2c800b72a84"

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
