FROM themistymay/ubuntu:java8

RUN apt-get update
RUN apt-get install -y supervisor curl

# Kibana
RUN \
    curl -s https://download.elasticsearch.org/kibana/kibana/kibana-4.1.1-linux-x64.tar.gz | tar -C /opt -xz && \
    mv /opt/kibana-4.1.1-linux-x64 /opt/kibana && \
    sed -i 's/port: 5601/port: 80/' /opt/kibana/config/kibana.yml && \
    sed -i 's#elasticsearch_url: "http://localhost:9200"#elasticsearch_url: "http://elasticsearch:9200"#' /opt/kibana/config/kibana.yml

ADD kibana.supervisor /etc/supervisor/conf.d/kibana.conf

EXPOSE 80

CMD [ "/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf" ]
