FROM ubuntu:16.04

RUN apt-get update &&  apt-get install -y mecab mecab-ipadic libmecab-dev mecab-ipadic-utf8

# in order to run install-mecab-ipadic-neologd
RUN apt-get install -y git curl build-essential file sudo
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git

WORKDIR /mecab-ipadic-neologd
RUN (echo "yes" && cat)  | ./bin/install-mecab-ipadic-neologd -n

RUN mkdir -p /home/test
COPY ./text/* /home/test/
COPY ./csv/myname.csv /home/test/
WORKDIR /home/test/
RUN /usr/lib/mecab/mecab-dict-index -d /usr/share/mecab/dic/ipadic/ -u myname.dic -f utf8 -t utf8 /home/test/myname.csv

RUN cat tank.txt | mecab
RUN cat tank.txt | mecab -u myname.dic

RUN cat kimetsu_no_yaiba.txt | mecab
RUN cat kimetsu_no_yaiba.txt | mecab -u myname.dic
