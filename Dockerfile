FROM ruby:2.7.1
RUN apt-get update -qq && \
  apt-get install -y mysql-client-* libmysqlclient-dev-* nodejs npm && \
  apt-get clean autoclean && \
  apt-get autoremove -y && \
  npm install yarn -g && \
  rm -rf /var/lib/apt /var/lib/dpkg /var/lib/cache /var/lib/log && \
  mkdir /railsjig
WORKDIR /railsjig
ADD Gemfile /railsjig/Gemfile
ADD Gemfile.lock /railsjig/Gemfile.lock
RUN bundle install
ADD . /railsjig
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
EXPOSE 80:80

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "80"]