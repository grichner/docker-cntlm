FROM opensuse/tumbleweed:latest
LABEL maintainer="grichner at gmx dot net"

RUN zypper --non-interactive in cntlm && \
    zypper clean --all

COPY start-docker.sh /usr/local/bin/start-docker.sh
COPY cntlm.conf.example /etc/cntlm.conf

EXPOSE 3128

ENTRYPOINT ["/usr/local/bin/start-docker.sh"]
