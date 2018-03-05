FROM ruby:2.3.1
LABEL maintainer="celil.ileri [ at ] bil.omu.edu.tr"
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /oyak.omu.edu.tr
WORKDIR /oyak.omu.edu.tr
COPY Gemfile /oyak.omu.edu.tr/Gemfile
COPY Gemfile.lock /oyak.omu.edu.tr/Gemfile.lock
RUN bundle install
COPY . /oyak.omu.edu.tr
EXPOSE 3000
HEALTHCHECK --interval=15s --timeout=5s --start-period=10s --retries=2 CMD curl -f 0.0.0.0:3000 || exit 1
CMD ["rails", "s", "-p", "3000", "-b", "0.0.0.0"]
