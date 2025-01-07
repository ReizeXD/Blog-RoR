#!/usr/bin/env bash
set -e

# Instalar dependências
bundle install

# Pré-compilar assets
bundle exec rake assets:clean
bundle exec rake assets:precompile

# Aplicar migrações
./bin/rails db:migrate
