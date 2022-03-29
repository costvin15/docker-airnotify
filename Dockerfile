FROM ubuntu:20.04

EXPOSE 8801

RUN apt-get update && \
    apt-get install -y git python3-pip build-essential

RUN pip3 install pipenv

RUN git clone -b master https://github.com/airnotifier/airnotifier.git /airnotifier
RUN mkdir -p /var/airnotifier/pemdir && \
    mkdir -p /var/log/airnotifier

WORKDIR /airnotifier

RUN pipenv install --deploy

ADD config.py /airnotifier
ADD start.sh /airnotifier
RUN chmod a+x /airnotifier/start.sh
ENTRYPOINT /airnotifier/start.sh
