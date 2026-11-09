class Coreslot < Formula
  desc "Memory guard for the heavy commands of parallel coding agents"
  homepage "https://github.com/core-slot/coreslot"
  url "https://github.com/core-slot/coreslot/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "af8d37c8e67fc780121d0b082edd2747ab4b9dc64907d97c5cd6c9538eb667a8"
  license "MIT"
  head "https://github.com/core-slot/coreslot.git", branch: "main"

  depends_on "go" => :build

  def install
    # The same build as the release archives: cgo-free, -trimpath and -s -w. std_go_args adds
    # -trimpath and puts -s -w ahead of the ldflags given here (unless brew is run with
    # --debug-symbols), so they are not repeated.
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/coreslot"
  end

  test do
    assert_match "coreslot #{version} (protocol formats: 2)", shell_output("#{bin}/coreslot version")
    # A separate budget under the test's own directory, never the user's.
    ENV["CORESLOT_STATE_DIR"] = (testpath/"state").to_s
    system bin/"coreslot", "run", "--restart=yes", "--", "true"
    system bin/"coreslot", "doctor"
  end
end
