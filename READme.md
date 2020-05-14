docker build --tag cntlm .

create cntlm.conf:
docker run -it --rm cntlm

	docker run grichner/cntlm-tst:latest -d -p 3128:3128 -v /etc/cntlm/config.conf:/cntlm.conf 

