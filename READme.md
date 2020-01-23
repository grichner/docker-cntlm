docker build --tag cntlm .

create cntlm.conf:
docker run -it --rm cntlm

docker run -d --name cntlm -p 127.0.0.1:3128:3128 -v /etc/cntlm/config.conf:/cntlm.conf cntlm

