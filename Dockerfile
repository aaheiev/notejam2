# docker build -t notejam2 .

FROM ruby:2.7.2-alpine

# APP
ARG http_port=3000
ARG app_group=notejam
ARG app_user=notejam
ARG app_home=/notejam

# CI
ARG product_version=0.0.1
ARG assembly_version=0.0.1.1

ENV APP_HOME         $app_home
ENV HTTP_PORT        $http_port
ENV HEALTHCHECK_URL  "http://127.0.0.1:${http_port}/health"
ENV PRODUCT_VERSION  $product_version
ENV ASSEMBLY_VERSION $assembly_version
ENV WEB_CONCURRENCY  2
ENV RAILS_ENV        "test"
ENV DOCKER_LOGS      1

ENV BUILD_DEPS="curl tar wget linux-headers" \
    DEV_DEPS="build-base sqlite-dev postgresql-dev zlib-dev libxml2-dev libxslt-dev readline-dev tzdata git nodejs"

RUN apk add --update --upgrade $BUILD_DEPS $DEV_DEPS

RUN addgroup -S ${app_group} \
    && adduser \
        --disabled-password \
        --gecos "" \
        --home "$APP_HOME" \
        -S ${app_user} -G ${app_group} \
    && chown ${app_user}:${app_group} $APP_HOME

WORKDIR $APP_HOME

COPY . $APP_HOME/

RUN bundle install

RUN apk del $BUILD_DEPS \
  && rm -rf /var/cache/apk/* \
  && rm -rf /usr/lib/ruby/gems/*/cache/*;

#RUN rake test
#RUN chown -R ${app_user}:${app_group} $APP_HOME
#
#EXPOSE ${http_port}
#
#USER ${app_user}
#
#ENTRYPOINT bin/rake db:migrate \
#    && bundle exec rails server -b 0.0.0.0 -p $HTTP_PORT
#
#HEALTHCHECK --interval=15s --timeout=5s --retries=10 CMD curl --silent --fail "${HEALTHCHECK_URL}" || exit 1
