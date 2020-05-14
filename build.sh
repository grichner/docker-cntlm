#!/bin/bash

tAg=`date "+%Y%m%d%H%M"`;dockerCMD="docker build -t grichner/cntlm-tst:${tAg} .";eval $dockerCMD
docker push grichner/cntlm-tst:${tAg}
docker tag grichner/cntlm-tst:${tAg} grichner/cntlm-tst:latest
docker push grichner/cntlm-tst:latest

