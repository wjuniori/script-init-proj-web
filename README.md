# script-init-proj-web

Este repositório consiste basicamente no script init-proj-web.sh, responsável por criar uma estrutura básica para projetos front-end. Para executar (via linha de comando):

`./init-proj-web.sh`

## Configurações Contempladas

* Criar diretórios, sub-diretórios e arquivos (html, css e js)
* Criar arquivos README.md, .travis.yml, .gitignore e robots.txt
* Configurar npm
* Configurar Gulp
* Configurar Git/GitHub

## Pré-Requisitos

* Ter instalado o npm
* Ter instalado o Gulp globalmente
* Ter configurado a chave SSH para o Git/GitHub
  * https://help.github.com/en/articles/checking-for-existing-ssh-keys
  * https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
  * https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/
  * https://help.github.com/articles/testing-your-ssh-connection/
* Ter configurado o token de acesso pessoal TRAVIS_CI_TOKEN com o escopo public_repo ou repo (o repo é necessário para repositórios privados) no GitHub
  * https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line
* Ter criado o repositório remoto no GitHub
* Ter incluído o repositório nas configurações (Legacy Services Integration) do Travis CI
  * https://travis-ci.org/account/repositories

## Requisitos

* Preencher as VARIÁVEIS DE CONFIGURAÇÃO

## Pós-Requisitos

* Definir a variável de ambiente TRAVIS_CI_TOKEN no Travis CI (Only available to the master branch)
  * https://docs.travis-ci.com/user/environment-variables#defining-variables-in-repository-settings
* Reiniciar o build (Restart build) no Travis CI

## Variáveis de Configuração

`Diretório do script (init-proj-web.sh)`
dirScript="/home/user/git/github/script-init-proj-web"

`Diretório`
dir="/home/user/git/github"

`Repositório Git/GitHub (Ex.: project-rfuteam)`
rep="project-test"

`Projeto (Ex.: rfuteam)`
proj="test"

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
