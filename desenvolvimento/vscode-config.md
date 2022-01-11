# Configuração VSCode

## Pastas Utlizadas Pelo VSCode

- C:\Users\otoju\.vscode
- C:\Users\otoju\AppData\Roaming\Code

## Extensões Recomendadas

- Darkest+ theme
- Material Icon Theme
- Material Product Icons

## Settings Recomendadas

```
{
    "workbench.colorTheme": "Darkest+ Italic",
    "workbench.iconTheme": "material-icon-theme",
    "workbench.productIconTheme": "material-product-icons",
    "editor.fontFamily": "Fira Code",
    "editor.fontLigatures": true,
    "editor.fontSize": 16,
    "editor.lineHeight": 1.1,
    "editor.fontWeight": "600",
    "editor.smoothScrolling": true,
}
```

## Fonte Recomendada

- [Fira Code](https://fonts.google.com/specimen/Fira+Code)
- [JetBrains Mono](https://fonts.google.com/specimen/JetBrains+Mono)

---

## Configurações para Python

### Uso do PipEnv

- Instalação: `pip install --user pipenv`
- Inicialização do projeto: `pipenv --three`
- No VSCode:
  - Abrir arquivo Python (.py)
  - No rodapé à esquerda, escolher o interpretador Python do ambiente virtual
  - Quando executar (Ctrl+F5) o script (.py), ele executará no ambiente virtual
  - No Setting do projeto (settings.json), entrar com a propriedade: `"python.analysis.autoSearchPaths": true`


### Caminho do Python instalado pelo Chocolatey

- C:\Python310

```
$>py -m site --user-site
C:\Users\otoju\AppData\Roaming\Python\Python310\site-packages
```

