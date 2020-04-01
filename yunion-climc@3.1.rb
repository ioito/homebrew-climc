class YunionClimcAT31 < Formula
  desc "Command-line interface to the OneCloud API server"
  homepage "https://yunion.io"
  url "https://github.com/yunionio/onecloud.git",
    :tag      => "release/3.1"
  version_scheme 1
  head "https://github.com/yunionio/onecloud.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    (buildpath/"src/yunion.io/x/onecloud").install buildpath.children
    cd buildpath/"src/yunion.io/x/onecloud" do
      system "GOOS=darwin", "make", "cmd/climc"
      bin.install "_output/bin/climc"
      prefix.install_metafiles
    end
  end

  test do
    system "false"
  end
end
