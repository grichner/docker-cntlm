docker build --tag cntlm .

create cntlm.conf:
docker run -it --rm cntlm

	docker run grichner/cntlm-tst:latest -d -p 3128:3128 -v /etc/cntlm/config.conf:/cntlm.conf 
OR via swarm
```
version: '3.9'

networks:
  default:
    driver: overlay
    driver_opts:
      encrypted: "true"
      ## ^^ make sure your network and/or kernel is ready for this !!

services:
  cntlm:
    user: '0'
    #ports:
      #- '3128' 
      ## ^^if you want to use it eclusive for your stack you don't need to expose
    volumes:
      - '/data/swarm_persist_mem/.cntlm/cntlm.conf:/etc/cntlm.conf'
    image: grichner/cntlm-tst
    
    deploy:
      #placement: 
      #  constraints:
      #    - node.hostname==DNS.name.here
      replicas: 1
      update_config:
        parallelism: 1
        delay: 10s
        order: start-first
      resources:
        limits:
          #cpus: '0.50'
          memory: 128M
        reservations:
          #cpus: '0.25'
          memory: 64M
```
.
