cask "fakl-code" do
  version "0.1.17"
  sha256 "171a7c5da1ec027100856fa2f5ae2b01240a20f782cad3498748ce8ddbcf344a"

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
