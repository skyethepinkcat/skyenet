FROM phusion/passenger-ruby30:latest

ENV HOME /root

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN rm -f /etc/service/nginx/down

RUN rm /etc/nginx/sites-enabled/default

ADD docker/webapp.conf /etc/nginx/sites-enabled/webapp.conf

RUN mkdir /home/app/webapp

COPY Gemfile /root/Gemfile

RUN bundle install --gemfile /root/Gemfile

COPY --chown=app:app . /home/app/webapp


CMD ["/sbin/my_init"]
