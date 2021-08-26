FROM ruby: 2.7.4

ENV app_path /opt/jenkins/
WORKDIR ${app_path}

COPY Gemfile* ${app_path}

RUN bundle install

COPY . ${app_path}

ENTRYPOINT ["bundle", "exec", "cucumber -p ${BROWSER} -t ${TAG} --format json -o /opt/jenkins/cucumber.json"]
