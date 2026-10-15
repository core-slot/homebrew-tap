class Coreslot < Formula
  desc "One core budget for every test suite, build and agent on your machine"
  homepage "https://github.com/core-slot/coreslot"
  url "https://github.com/core-slot/coreslot/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "50fdf56a7cffc2f8300ce06c214a2b32df26995809f8a919f8f517e71161c8a4"
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
    assert_match "coreslot #{version} (protocol formats: 1)", shell_output("#{bin}/coreslot version")
    # A separate budget under the test's own directory, never the user's.
    ENV["CORESLOT_STATE_DIR"] = (testpath/"state").to_s
    system bin/"coreslot", "run", "--", "true"
    system bin/"coreslot", "doctor"
  end
end
