FROM python:3.7

RUN apt-get update &&  apt-get install -y mecab mecab-ipadic libmecab-dev mecab-ipadic-utf8

# in order to run install-mecab-ipadic-neologd
RUN apt-get install -y git curl build-essential file sudo
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git

WORKDIR /mecab-ipadic-neologd
RUN (echo "yes" && cat)  | ./bin/install-mecab-ipadic-neologd -n

RUN mkdir -p /home/test
COPY test.txt /home/test/test.txt
COPY requirements.txt /home/test/requirements.txt
WORKDIR /home/test/

RUN cat test.txt | mecab
# RUN cat test.txt | mecab -d /usr/lib/mecab/dic/mecab-ipadic-neologd/
RUN cat test.txt | mecab -d /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd

RUN pip3 install -r requirements.txt
RUN ln -s /etc/mecabrc /usr/local/etc/mecabrc

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]


