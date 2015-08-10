FROM themistymay/ubuntu:java8

RUN apt-get update
RUN apt-get -y install software-properties-common
#RUN add-apt-repository -y ppa:oisf/suricata-stable
RUN add-apt-repository ppa:oisf/suricata-beta
RUN add-apt-repository ppa:devel-k/log-courier
RUN apt-get update
RUN apt-get -y install \
                    supervisor \
                    suricata \
                    tcpdump \
                    python-pip \
                    python-simplejson \
                    wget \
                    log-courier \
                    python-pip

# Install idstools for rule updates.
RUN pip install --upgrade \
    https://github.com/jasonish/py-idstools/archive/master.zip

# Update the rules.
RUN idstools-rulecat --rules-dir=/etc/suricata/rules

# Get config in place
RUN mv /etc/suricata/suricata.yaml /etc/suricata/suricata.yaml-default
ADD suricata.yaml /etc/suricata/suricata.yaml

# Install Elastic Search curator for optimizing and purging events.
RUN pip install elasticsearch-curator

ADD suricata.supervisor /etc/supervisor/conf.d/suricata.conf
ADD log-courier.supervisor /etc/supervisor/conf.d/log-courier.conf


RUN mkdir -p /etc/log-courier
ADD log-courier.conf /etc/log-courier/log-courier.conf

# COPY entrypoint.sh /tmp/entrypoint.sh
# RUN chmod +x /tmp/entrypoint.sh
#
# CMD ["/tmp/entrypoint.sh"]
CMD [ "/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf" ]
