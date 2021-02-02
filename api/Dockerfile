FROM ruby:2.7.1

RUN apt update && \
  apt install -y build-essential \
  libpq-dev \
  nodejs \
  && rm -rf /var/lib/apt/lists/*

ENV APP_ROOT /app
RUN mkdir -p ${APP_ROOT}
WORKDIR $APP_ROOT

COPY Gemfile ${APP_ROOT}/Gemfile
COPY Gemfile.lock ${APP_ROOT}/Gemfile.lock

RUN bundle install

ADD . ${APP_HOME}

EXPOSE 80

RUN chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]
# CMD ["rails", "s", "-b", "0.0.0.0", "-p", "80"]
