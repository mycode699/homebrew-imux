cask "imux" do
  version "4.0.3"
  sha256 "8887803dc4cc523934a88f180deaa8b89a9e3d0d5d6b8cb4f52ae37f6ad999e9"

  # Versioned artifact from the official download surface (matches latest.json archiveUrl).
  url "https://www.iccjk.com/downloads/imux-v#{version}-macos.dmg"
  name "imux"
  desc "AI command center with terminal, splits, and remote workspaces"
  homepage "https://www.iccjk.com/"

  livecheck do
    url "https://www.iccjk.com/downloads/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :sonoma

  app "imux.app"
  # Compatibility CLI name remains `icc` inside the app bundle.
  binary "#{appdir}/imux.app/Contents/Resources/bin/icc", target: "icc"

  uninstall quit: "com.icc.app"

  zap trash: [
    "~/Library/Application Support/icc",
    "~/Library/Application Support/imux",
    "~/Library/Caches/com.icc.app",
    "~/Library/Caches/icc",
    "~/Library/Caches/imux",
    "~/Library/HTTPStorages/com.icc.app",
    "~/Library/Preferences/com.icc.app.plist",
    "~/Library/Saved Application State/com.icc.app.savedState",
  ]
end
