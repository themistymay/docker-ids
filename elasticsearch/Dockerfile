FROM themistymay/ubuntu:java8

# Get Elasticsearch
RUN \
    apt-key adv --keyserver pool.sks-keyservers.net --recv-keys 46095ACC8548582C1A2699A9D27D666CD88E42B4 && \
    if ! grep "elasticsearch" /etc/apt/sources.list; then echo "deb http://packages.elasticsearch.org/elasticsearch/1.7/debian stable main" >> /etc/apt/sources.list;fi && \
    apt-get update

# Install elasticsearch and supervisor
RUN \
    apt-get install -y elasticsearch supervisor && \
    apt-get clean

# Move over the supervisor config
ADD elasticsearch.supervisor /etc/supervisor/conf.d/elasticsearch.conf

# Move over the elasticsearch config
ADD elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

# Define mountable directories.
VOLUME ["/data"]

EXPOSE 9200

CMD [ "/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf" ]
