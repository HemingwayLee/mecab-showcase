# mecab-showcase

## Install
### Mac
```
brew install mecab
brew install mecab-ipadic
brew install git curl xz
git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
cd mecab-ipadic-neologd
./bin/install-mecab-ipadic-neologd -n
pip3 install mecab-python3
```

### Ubuntu
```
sudo apt-get install mecab mecab-ipadic libmecab-dev
sudo apt-get install mecab-ipadic-utf8
sudo apt-get install git curl
git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
cd mecab-ipadic-neologd
sudo ./bin/install-mecab-ipadic-neologd -n
pip3 install mecab-python3
```

### Docker
```
docker pull smizy/mecab:0.996-alpine
docker run -it --rm smizy/mecab:0.996-alpine
```

* Run with docker  
```
科学基礎研究所
```

* Result
```
科学	名詞,一般,*,*,*,*,科学,カガク,カガク
基礎	名詞,一般,*,*,*,*,基礎,キソ,キソ
研究所	名詞,一般,*,*,*,*,研究所,ケンキュウジョ,ケンキュージョ
EOS
```

## Run MeCab using command line
```
echo "日本語形態素解析" | mecab
```

* Result
```
日本語	名詞,一般,*,*,*,*,日本語,ニホンゴ,ニホンゴ
形態素	名詞,一般,*,*,*,*,形態素,ケイタイソ,ケイタイソ
解析	名詞,サ変接続,*,*,*,*,解析,カイセキ,カイセキ
EOS
```




