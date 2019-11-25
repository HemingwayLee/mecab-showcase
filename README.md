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
* Use MeCab with `Keras`, [lstm](https://github.com/HemingwayLee/keras-showcase/blob/master/lstm/classification.ipynb), [feedforward neural network](https://github.com/HemingwayLee/keras-showcase/blob/master/feedforward/classification.ipynb)

## Compare with `cabocha` and `JUMAN++`
* `MeCab` is the most popular tokenizer  
* `JUMAN++` is more accurate than `MeCab`, but it is also slower than `MeCab`  
* `cabocha` is base on `MeCab`, but it can detect more named entities  

### Paper 
https://www.aclweb.org/anthology/D15-1276  
https://www.anlp.jp/proceedings/annual_meeting/2018/pdf_dir/A5-2.pdf  