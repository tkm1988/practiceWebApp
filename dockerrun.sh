#!/bin/bash
docker container run --rm -p 8000:8000 -h "dtkmap1f" --name "dtkmap1f" -it \
       -v /Users/tkm/GitHub/practiceWebApp/src:/home/tkm1988/mysite \
       mycentos:latest
