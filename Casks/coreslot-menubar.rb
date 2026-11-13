cask "coreslot-menubar" do
  version "0.1.1"
  sha256 "aeb354c6e7f65dd1a64b57ce3b9c13c60c828cb84d254571c2e80599d330f116"

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
