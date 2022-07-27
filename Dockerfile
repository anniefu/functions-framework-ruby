FROM ruby

COPY . /functions-framework-ruby

WORKDIR /functions-framework-ruby

RUN bundle install

RUN ./client -buildpacks=false -builder-source=test/conformance -type=http -validate-concurrency=true -cmd='bundle exec functions-framework-ruby --source test/conformance/app.rb --target concurrent_func --signature-type http'