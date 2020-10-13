FROM ubuntu:16.04

RUN apt-get update &&  apt-get install -y mecab mecab-ipadic libmecab-dev mecab-ipadic-utf8

# in order to run install-mecab-ipadic-neologd
RUN apt-get install -y git curl build-essential file sudo
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git

WORKDIR /mecab-ipadic-neologd
RUN (echo "yes" && cat)  | ./bin/install-mecab-ipadic-neologd -n

RUN mkdir -p /home/test
COPY test.txt /home/test/test.txt
WORKDIR /home/test/

RUN cat test.txt | mecab
RUN cat test.txt | mecab -d /usr/lib/mecab/dic/mecab-ipadic-neologd/

