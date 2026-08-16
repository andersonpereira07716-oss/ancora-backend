' VBScript para elevar privilégios e instalar Git
' Execute dando duplo-clique no arquivo

Set objShell = CreateObject("Shell.Application")
objShell.ShellExecute "cmd.exe", "/c winget install --id Git.Git --exact --accept-source-agreements --accept-package-agreements && pause", "", "runas", 1
