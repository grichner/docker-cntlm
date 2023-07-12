FROM opensuse/leap:latest
MAINTAINER gregor.richner-extern at deutschebahn com

RUN zypper --non-interactive patch
RUN zypper --non-interactive patch && \
    zypper --non-interactive in cntlm && \
    zypper clean --all

COPY start-docker.sh /usr/local/bin/start-docker.sh
COPY cntlm.conf.example /etc/cntlm.conf

EXPOSE 3128

ENTRYPOINT ["/usr/local/bin/start-docker.sh"]
