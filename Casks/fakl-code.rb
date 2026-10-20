cask "fakl-code" do
  version "0.1.12"
  sha256 "206d7f2025d940aa19db2b7220f8a9ccacd1967a5a4319c3d7cec52281bb675c"

  url "https://github.com/FaKL-Code/FaKL-Code-IDE/releases/download/v#{version}/FaKL-Code-macOS-arm64.zip"
  name "FaKL-Code IDE"
  desc "Open source IDE for AI-assisted development, a VSCodium fork"
  homepage "https://github.com/FaKL-Code/FaKL-Code-IDE"

  livecheck do
    url "https://github.com/FaKL-Code/FaKL-Code-IDE/releases"
    strategy :github_releases
  end

  depends_on arch: :arm64

  app "FaKL-Code IDE.app"

  # O app tem assinatura ad hoc e não é notarizado: tira a quarentena para o Gatekeeper
  # não bloquear a primeira abertura. Remova esta linha quando houver notarização.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/FaKL-Code IDE.app"],
                   sudo: false
  end

  zap trash: [
    "~/.fakl",
    "~/.fakl-code",
    "~/Library/Application Support/FaKL-Code",
  ]
end
