FROM debian
MAINTAINER Francesco d'Aloisio <fdaloisio@gmail.com>

RUN apt-get update && apt-get -y install build-essential libreadline-dev libffi-dev pkg-config python-setuptools python-dev git

WORKDIR /opt

RUN git clone https://github.com/micropython/micropython.git

WORKDIR /opt/micropython/unix

RUN make axtls
RUN make

ENTRYPOINT ["./micropython"]
