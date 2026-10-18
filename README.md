# Tap do Homebrew da FaKL-Code

Tap do [Homebrew](https://brew.sh) para a [FaKL-Code IDE](https://github.com/FaKL-Code/FaKL-Code-IDE),
só macOS com Apple Silicon.

```bash
brew install --cask fakl-code/tap/fakl-code
```

O app tem assinatura ad hoc e não é notarizado, então não entra no Homebrew oficial (que desativa
casks que falham no Gatekeeper). O cask tira a quarentena depois de instalar. O cask é gerado pela
release da FaKL-Code (`build/empacotar.mjs`); veja
[docs/distribuicao.md](https://github.com/FaKL-Code/FaKL-Code-IDE/blob/main/docs/distribuicao.md).
O cask ainda não foi testado num Mac.
