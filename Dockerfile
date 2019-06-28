FROM ruby:2.5.1
LABEL maintainer="celil.ileri [ at ] bil.omu.edu.tr"
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -qq -y build-essential nodejs yarn \
    libpq-dev \
    mysql-client \
    imagemagick libmagickcore-dev libmagickwand-dev
    
RUN mkdir /oyak_omu_edu_tr
WORKDIR /oyak_omu_edu_tr
COPY Gemfile /oyak_omu_edu_tr/Gemfile
COPY Gemfile.lock /oyak_omu_edu_tr/Gemfile.lock
RUN bundle install 
COPY . /oyak_omu_edu_tr

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

#EXPOSE 3000
#HEALTHCHECK --interval=15s --timeout=5s --start-period=10s --retries=2 CMD curl -f 0.0.0.0:3000 || exit 1
#CMD ["rails", "s", "-b", "0.0.0.0"]