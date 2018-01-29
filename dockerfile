FROM ruby:2.4.1

# Instala Depedencias
RUN  apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev

# path da app
  ENV INSTALL_PATH /usr/src/app

# cria diretorio da app
  RUN mkdir -p $INSTALL_PATH

# define diretorio da app com diretorio principal
  WORKDIR $INSTALL_PATH

# copia GemFile para dentro do container
  COPY  Gemfile ./

# Instala as Gems
 RUN bundle install

  # Copia o codigo para dentro do container
     COPY . .
        # . representa o diretório currente tanto para local quanto para o contanier
#Roda o Servidor
          CMD puma -C config/puma.rb
