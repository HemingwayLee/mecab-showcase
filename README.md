# mecab-showcase

## Installation
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

* Note: the installation of [mecab-ipadic-neologd](https://github.com/neologd/mecab-ipadic-neologd) is optional. `mecab-ipadic-neologd` is customized system dictionary for MeCab. It includes many neologisms (new word), which are extracted from many language resources on the Web.

### Docker
#### Use the one from [smizy](https://github.com/smizy/docker-mecab)
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

#### Use the one from [here](https://github.com/HemingwayLee/mecab-showcase/blob/master/Dockerfile)
* Installation
```
git clone https://github.com/HemingwayLee/mecab-showcase.git
cd mecab-showcase
docker build mymecab -t .
docker run -it --rm mymecab
```

* Inside docker container, we can test mecab with/without `mecab-ipadic-neologd`
```
cat test.txt | mecab
cat test.txt | mecab -d /usr/lib/mecab/dic/mecab-ipadic-neologd/
```

* Result without `mecab-ipadic-neologd`
```
8	名詞,数,*,*,*,*,*
月	名詞,一般,*,*,*,*,月,ツキ,ツキ
3	名詞,数,*,*,*,*,*
日	名詞,接尾,助数詞,*,*,*,日,ニチ,ニチ
に	助詞,格助詞,一般,*,*,*,に,ニ,ニ
放送	名詞,サ変接続,*,*,*,*,放送,ホウソウ,ホーソー
さ	動詞,自立,*,*,サ変・スル,未然レル接続,する,サ,サ
れ	動詞,接尾,*,*,一段,連用形,れる,レ,レ
た	助動詞,*,*,*,特殊・タ,基本形,た,タ,タ
「	記号,括弧開,*,*,*,*,「,「,「
中居	名詞,固有名詞,人名,姓,*,*,中居,ナカイ,ナカイ
正広	名詞,固有名詞,人名,名,*,*,正広,マサヒロ,マサヒロ
の	助詞,連体化,*,*,*,*,の,ノ,ノ
金曜日	名詞,副詞可能,*,*,*,*,金曜日,キンヨウビ,キンヨービ
の	助詞,連体化,*,*,*,*,の,ノ,ノ
スマイル	名詞,一般,*,*,*,*,スマイル,スマイル,スマイル
たち	名詞,接尾,一般,*,*,*,たち,タチ,タチ
へ	助詞,格助詞,一般,*,*,*,へ,ヘ,エ
」(	名詞,サ変接続,*,*,*,*,*
TBS	名詞,一般,*,*,*,*,*
系	名詞,接尾,一般,*,*,*,系,ケイ,ケイ
)	名詞,サ変接続,*,*,*,*,*
で	助詞,格助詞,一般,*,*,*,で,デ,デ
EOS
```

* Result with `mecab-ipadic-neologd`
```
8月3日	名詞,固有名詞,一般,*,*,*,8月3日,ハチガツミッカ,ハチガツミッカ
に	助詞,格助詞,一般,*,*,*,に,ニ,ニ
放送	名詞,サ変接続,*,*,*,*,放送,ホウソウ,ホーソー
さ	動詞,自立,*,*,サ変・スル,未然レル接続,する,サ,サ
れ	動詞,接尾,*,*,一段,連用形,れる,レ,レ
た	助動詞,*,*,*,特殊・タ,基本形,た,タ,タ
「	記号,括弧開,*,*,*,*,「,「,「
中居正広の金曜日のスマイルたちへ	名詞,固有名詞,一般,*,*,*,中居正広の金曜日のスマイルたちへ,ナカイマサヒロノキンヨウビノスマイルタチヘ,ナカイマサヒロノキンヨービノスマイルタチヘ
」(	記号,一般,*,*,*,*,*
TBS	名詞,固有名詞,一般,*,*,*,TBS,ティービーエス,ティービーエス
系	名詞,接尾,一般,*,*,*,系,ケイ,ケイ
)	記号,一般,*,*,*,*,*
で	助動詞,*,*,*,特殊・ダ,連用形,だ,デ,デ
EOS
```

## Run `MeCab` using command line
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

## Run `MeCab` using python3

### Prerequisite
```
python3 -m virtualenv venv
source venv/bin/activate
pip3 install -r requirements.txt
```
 
* [sample code](https://github.com/HemingwayLee/mecab-showcase/blob/master/HelloMeCab.ipynb)
```
ipython kernel install --user --name=venv
jupyter notebook
```

* Retrain `word2vec` with MeCab, [code](https://github.com/HemingwayLee/japanese-words-to-vectors) 
* Pre-trained word embedding with MeCab, [link](http://www.cl.ecei.tohoku.ac.jp/~m-suzuki/jawiki_vector/)
* Use MeCab with `Keras`, [lstm](https://github.com/HemingwayLee/keras-showcase/blob/master/lstm/classification.ipynb), [named entity recognition with lstm](https://github.com/HemingwayLee/keras-showcase/blob/master/lstm/ner.ipynb)

## Compare with `cabocha` and `JUMAN++`
* `MeCab` is the most popular tokenizer  
* `JUMAN++` is more accurate than `MeCab`, but it is also slower than `MeCab`  
* `cabocha` is base on `MeCab`, but it can detect more named entities  

### Paper 
https://www.aclweb.org/anthology/D15-1276  
https://www.anlp.jp/proceedings/annual_meeting/2018/pdf_dir/A5-2.pdf  
