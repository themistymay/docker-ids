FROM themistymay/ubuntu:java8

RUN apt-get update
RUN apt-get install -y supervisor

# Get Elasticsearch
RUN \
    apt-key adv --keyserver pool.sks-keyservers.net --recv-keys 46095ACC8548582C1A2699A9D27D666CD88E42B4 && \
    if ! grep "elasticsearch" /etc/apt/sources.list; then echo "deb http://packages.elasticsearch.org/elasticsearch/1.7/debian stable main" >> /etc/apt/sources.list;fi && \
    apt-get update

# Configure elasticsearch
RUN \
    apt-get install -y elasticsearch && \
    apt-get clean && \
    sed -i '/#cluster.name:.*/a cluster.name: pxes' /etc/elasticsearch/elasticsearch.yml && \
    sed -i '/#path.data: \/path\/to\/data/a path.data: /data' /etc/elasticsearch/elasticsearch.yml

# Enable CORS and dynamic scripting in Elastic Search.
RUN echo "http.cors.enabled: true" >> /etc/elasticsearch/elasticsearch.yml && \
    echo "script.disable_dynamic: false" >> /etc/elasticsearch/elasticsearch.yml

ADD elasticsearch.supervisor /etc/supervisor/conf.d/elasticsearch.conf

EXPOSE 9200

CMD [ "/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf" ]
