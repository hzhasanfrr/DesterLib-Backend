FROM ubuntu:22.04

WORKDIR /usr/src/desterlib

SHELL ["/bin/bash", "-c"]

RUN chmod 777 /usr/src/desterlib

ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en"

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install wget curl python3.9 python3-pip git zip unzip -y

RUN git clone https://github.com/DesterLib/Backend.git desterlib 

RUN cd desterlib && pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
