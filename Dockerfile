FROM opensuse/leap:latest
MAINTAINER gregor.richner-extern at deutschebahn com

RUN zypper --non-interactive in cntlm && \
    zypper clean --all

COPY start-docker.sh /usr/local/bin/start-docker.sh

EXPOSE 3128

ENTRYPOINT ["/usr/local/bin/start-docker.sh"]
