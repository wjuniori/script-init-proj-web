# script-init-proj-web

Este repositório consiste basicamente no script init-proj-web.sh, responsável por criar uma estrutura básica para projetos front-end. Para executar (via linha de comando):

`./init-proj-web.sh`

## Configurações Contempladas

* Criar diretórios, sub-diretórios e arquivos (html, css e js)
* Criar arquivos README.md, .gitignore e robots.txt
* Configurar npm
* Configurar Gulp
* Configurar Git/GitHub

## Pré-Requisitos

* Ter instalado o npm
* Ter instalado o Gulp globalmente
* Ter configurado a chave SSH para o Git/GitHub
* Ter criado o repositório remoto no GitHub
* Preencher as VARIÁVEIS DE CONFIGURAÇÃO no script init-proj-web.sh

## Variáveis de Configuração

`Diretório do script (init-proj-web.sh)`
dirScript="/home/user/git/github/script-init-proj-web"

`Diretório`
dir="/home/user/git/github"

`Repositório Git/GitHub (Ex.: projeto-rfuteam)`
rep="projeto-teste"

`Projeto (Ex.: rfuteam)`
proj="teste"

`Usuário Git/GitHub`
user="user"

`E-mail Git/GitHub`
email="user@email.com"

`Autor`
autor="autor"

`Dependências/packages locais de produção`
`(Ex.: bootstrap @fortawesome/fontawesome-free jquery.easing jquery)`
`Se não houver dependências, declarar dep=""`
dep="bootstrap @fortawesome/fontawesome-free jquery.easing jquery"

`Dependências/packages locais de desenvolvimento`
`(Ex.: del merge-stream gulp-imagemin gulp-autoprefixer gulp-clean-css gulp-header gulp-rename browser-sync gulp-uglify gulp-replace gulp-htmlmin)`
`Se não houver dependências, declarar devDep=""`
devDep="del merge-stream gulp-imagemin gulp-autoprefixer gulp-clean-css gulp-header gulp-rename browser-sync gulp-uglify gulp-replace gulp-htmlmin"

## Bugs e Issues

Tem um bug ou uma issue com este script? [Abra uma nova issue](https://github.com/wjuniori/script-init-proj-web/issues) aqui no GitHub.

## Sobre

Este repositório foi criado e é mantido por **[Washington Júnior](https://github.com/wjuniori/)**. Para ver mais projetos, visite [portfólio](https://wjuniori.github.io/).
