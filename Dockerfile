FROM ruby:3.2.2

RUN gem install bundler -v 2.4.14

RUN apt-get update -qq && apt-get install -y postgresql-client shared-mime-info

ARG USER
ARG UID

RUN test -n "$USER"
RUN test -n "$UID"

RUN adduser --quiet --gecos "$USER" --uid "$UID" --disabled-login "$USER" && adduser $USER sudo && \
    chown -R "$USER":"$USER" /usr/local/bundle

COPY entrypoint.sh /usr/bin
ENTRYPOINT ["entrypoint.sh"]

USER "$USER"

WORKDIR /app

COPY . /app

CMD ["bundle", "exec" ,"rails", "server", "-b", "0.0.0.0"]
