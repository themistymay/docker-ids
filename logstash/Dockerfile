FROM themistymay/ubuntu:java8

RUN apt-get update
RUN apt-get install -y supervisor curl

# Get Logstash
RUN \
    apt-key adv --keyserver pool.sks-keyservers.net --recv-keys 46095ACC8548582C1A2699A9D27D666CD88E42B4 && \
    if ! grep "logstash" /etc/apt/sources.list; then echo "deb http://packages.elasticsearch.org/logstash/1.5/debian stable main" >> /etc/apt/sources.list;fi && \
    apt-get update

# Logstash
RUN apt-get install -y logstash && \
    apt-get clean

RUN /opt/logstash/bin/plugin install logstash-input-courier
#RUN /opt/logstash/bin/plugin install logstash-output-courier

RUN curl -O "http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz"
RUN gzip -d GeoLiteCity.dat.gz
RUN mv GeoLiteCity.dat /opt/logstash/GeoLiteCity.dat

ADD logstash.supervisor /etc/supervisor/conf.d/logstash.conf
ADD suricata.logstash /etc/logstash/suricata.conf

#RUN mkdir -p /opt/logstash/ssl

CMD [ "/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf" ]
