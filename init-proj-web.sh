#! /bin/bash

##################### CONFIGURAÇÕES CONTEMPLADAS #####################

# 1º PASSO) Criar diretórios, sub-diretórios e arquivos (html, css e js)
# 2º PASSO) Criar arquivos README.md, .travis.yml, .gitignore e robots.txt
# 3º PASSO) Configurar npm
# 4º PASSO) Configurar Gulp
# 5º PASSO) Configurar Git/GitHub

##################### PRÉ-REQUISITOS #####################

# Ter instalado o npm
# Ter instalado o Gulp globalmente
# Ter configurado a chave SSH para o Git/GitHub
  # https://help.github.com/en/articles/checking-for-existing-ssh-keys
  # https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
  # https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/
  # https://help.github.com/articles/testing-your-ssh-connection/
# Ter configurado o token de acesso pessoal TRAVIS_CI_TOKEN com o escopo public_repo ou repo (o repo é necessário para repositórios privados) no GitHub
  # https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line
# Ter criado o repositório remoto no GitHub
# Ter incluído o repositório nas configurações (Legacy Services Integration) do Travis CI
  # https://travis-ci.org/account/repositories

##################### REQUISITOS #####################

# Preencher as VARIÁVEIS DE CONFIGURAÇÃO

##################### PÓS-REQUISITOS #####################

# Definir a variável de ambiente TRAVIS_CI_TOKEN no Travis CI (Only available to the master branch)
  # https://docs.travis-ci.com/user/environment-variables#defining-variables-in-repository-settings
# Reiniciar o build (Restart build) no Travis CI

##################### VARIÁVEIS DE CONFIGURAÇÃO #####################

# Diretório deste script (init-proj-web.sh)
dirScript="/home/wjuniori/git/github/script-init-proj-web"

# Diretório
dir="/home/wjuniori/git/github"

# Repositório Git/GitHub (Ex.: project-rfuteam)
rep="project-test"

# Projeto (Ex.: rfuteam)
proj="test"

# Usuário Git/GitHub
user="wjuniori"

# E-mail Git/GitHub
email="wjuniori.si@gmail.com"

# Autor
autor="Washington Júnior"

# Dependências/packages locais de produção
# (Ex.: bootstrap @fortawesome/fontawesome-free jquery.easing jquery)
# Se não houver dependências, declarar dep=""
dep="bootstrap @fortawesome/fontawesome-free jquery.easing jquery"

# Dependências/packages locais de desenvolvimento
# (Ex.: del merge-stream gulp-imagemin gulp-autoprefixer gulp-clean-css gulp-header gulp-rename browser-sync gulp-uglify gulp-replace gulp-htmlmin)
# Se não houver dependências, declarar devDep=""
devDep="del merge-stream gulp-imagemin gulp-autoprefixer gulp-clean-css gulp-header gulp-rename browser-sync gulp-uglify"

##################### FUNÇÕES #####################

# Criar diretórios, sub-diretórios e arquivos (html, css e js)
function criarDir() {

  if ! [ -d $dir/$rep ]
  then

    echo
    echo "*** Criando diretório $dir/$rep, sub-diretórios e arquivos (html, css e js) ***"
    echo

    # Criar os diretórios $dir/$rep/public/dist
    mkdir -p $dir/$rep/public/dist/docs
    mkdir -p $dir/$rep/public/dist/css
    mkdir -p $dir/$rep/public/dist/js
    mkdir -p $dir/$rep/public/dist/img/originals/brand
    mkdir -p $dir/$rep/public/dist/video

    # Criar o arquivo html com um conteúdo básico
    cp -n $dirScript/index.html $dir/$rep/
    # HELP: sed -i 's,<substituir>,<substituto>,g' <file>
    sed -i "s,<proj>,$proj,g" $dir/$rep/index.html

    # Criar o arquivo css com um conteúdo básico
    echo "/*
*
* @author <autor>
* @version 0.1
*/

/* ********** PALETA DE CORES **********

*/" >> $dir/$rep/public/dist/css/$proj.css
    sed -i "s,<autor>,$autor,g" $dir/$rep/public/dist/css/$proj.css

    # Criar o arquivo js com um conteúdo básico
    echo "'use strict'; // Start of use strict" >> $dir/$rep/public/dist/js/$proj.js
  fi
}

# Criar arquivos README.md, .travis.yml, .gitignore e robots.txt
function criarArq() {

  if ! [ -f $dir/$rep/README.md ] || ! [ -f $dir/$rep/.gitignore ] || ! [ -f $dir/$rep/robots.txt ]
  then

    echo
    echo "*** Criando arquivos README.md, .travis.yml, .gitignore e robots.txt ***"
    echo

    if ! [ -f $dir/$rep/README.md ]
    then

      # Criar o arquivo README.md com um conteúdo básico
      cp -n $dirScript/README-mod.md $dir/$rep/README.md
      sed -i "s,<rep>,$rep,g" $dir/$rep/README.md
      sed -i "s,<proj>,$proj,g" $dir/$rep/README.md
      sed -i "s,<user>,$user,g" $dir/$rep/README.md
      sed -i "s,<autor>,$autor,g" $dir/$rep/README.md
    fi

    # Criar o arquivo .travis.yml com um conteúdo básico
    cp -n $dirScript/.travis.yml $dir/$rep/
    sed -i "s,<email>,$email,g" $dir/$rep/.travis.yml

    # Criar o arquivo .gitignore com um conteúdo básico
    cp -n $dirScript/.gitignore $dir/$rep/

    # Criar o arquivo robots.txt com um conteúdo básico
    cp -n $dirScript/robots.txt $dir/$rep/
  fi
}

# Configurar npm
function configNpm() {

  if ! [ -f $dir/$rep/package.json ] && [[ -n "$dep" || -n "$devDep" ]]
  then

    echo
    echo "*** Configurando npm ***"
    echo

    cd $dir/$rep/

    # Criar arquivo package.json
    npm init --yes

    # Substituir o arquivo package.json com um conteúdo básico
    cp $dirScript/package.json $dir/$rep/
    sed -i "s,<rep>,$rep,g" $dir/$rep/package.json
    sed -i "s,<proj>,$proj,g" $dir/$rep/package.json
    sed -i "s,<user>,$user,g" $dir/$rep/package.json
    sed -i "s,<email>,$email,g" $dir/$rep/package.json
    sed -i "s,<autor>,$autor,g" $dir/$rep/package.json

    if [ -n "$dep" ]
    then
      # Instalar dependências/packages locais de produção
      npm i $dep --save
    fi
  fi
}

# Configurar Gulp
function configGulp() {

  if ! [ -f $dir/$rep/gulpfile.js ] && [[ -n "$dep" || -n "$devDep" ]]
  then

    echo
    echo "*** Configurando Gulp ***"
    echo

    cd $dir/$rep/

    # Instalar Gulp localmente
    npm i gulp --save-dev

    # Criar o arquivo gulpfile.js com um conteúdo básico
    cp -n $dirScript/gulpfile.js $dir/$rep/
    sed -i "s,<user>,$user,g" $dir/$rep/gulpfile.js
    sed -i "s,<rep>,$rep,g" $dir/$rep/gulpfile.js
    sed -i "s,<proj>,$proj,g" $dir/$rep/gulpfile.js

    if [ -n "$devDep" ]
    then
      # Instalar dependências/packages locais de desenvolvimento
      npm i $devDep --save-dev
    fi

    # Executar a tarefa default que constrói tudo
    gulp
  fi
}

# Configurar Git/GitHub
function configGitGithub() {

  if ! [ -d $dir/$rep/.git ]
  then

    echo
    echo "*** Configurando Git/GitHub ***"
    echo

    cd $dir/$rep/

    # Criar Repositório
    git init

    # Adicionar os arquivos novos e modificados ao próximo commit
    git add .

    # Registrar o commit com todos os arquivos adicionados com o "git add"
    git commit -m "Criado repositório $rep"

    # Configurar o repositório remoto
    # origin é o nome padrão para o principal remote
    git remote add origin git@github.com:$user/$rep.git

    # Enviar alterações (commits) de uma branch para o repositório remoto
    # Somente na primeira vez (criar a branch master no remote origin)
    git push -u origin master

    # Criar a branch gh-pages
    #git branch gh-pages

    # Mudar para a branch gh-pages
    #git checkout gh-pages

    # Ao criar a branch gh-pages, isto ainda não foi refletido no repositório remoto.
    # Desta forma, para fazer o primeiro upload, deve-se usar:
    #git push -u origin gh-pages

    # Mudar para a branch master
    #git checkout master
  fi
}

##################### MENU #####################

select opcao in "Criar diretórios, sub-diretórios e arquivos (html, css e js)" "Criar arquivos README.md, .gitignore e robots.txt" "Configurar npm" "Configurar Gulp" "Configurar Git/GitHub" "Executar todos os passos" "Sair"
do
  case $opcao in
    "Criar diretórios, sub-diretórios e arquivos (html, css e js)" )
      echo "*** OPÇÃO 1 SELECIONADA ***"
      echo "----------------------------"
      criarDir
      echo "----------------------------"
      ;;
    "Criar arquivos README.md, .travis.yml, .gitignore e robots.txt" )
      echo "*** OPÇÃO 2 SELECIONADA ***"
      echo "----------------------------"
      criarArq
      echo "----------------------------"
      ;;
    "Configurar npm" )
      echo "*** OPÇÃO 3 SELECIONADA ***"
      echo "----------------------------"
      configNpm
      echo "----------------------------"
      ;;
    "Configurar Gulp" )
      echo "*** OPÇÃO 4 SELECIONADA ***"
      echo "----------------------------"
      configGulp
      echo "----------------------------"
      ;;
    "Configurar Git/GitHub" )
      echo "*** OPÇÃO 5 SELECIONADA ***"
      echo "----------------------------"
      configGitGithub
      echo "----------------------------"
      ;;
    "Executar todos os passos" )
      echo "*** OPÇÃO 6 SELECIONADA ***"
      echo "----------------------------"
      criarDir
      criarArq
      configNpm
      configGulp
      configGitGithub
      echo "----------------------------"
      ;;
    "Sair" )
      echo "*** OPÇÃO 7 SELECIONADA ***"
      echo "----------------------------"
      echo "Saindo"
      echo "----------------------------"
      exit
      ;;
    * )
      echo "----------------------------"
      echo "Erro! Por favor, informe uma opção válida"
      echo "----------------------------"
      ;;
  esac
done