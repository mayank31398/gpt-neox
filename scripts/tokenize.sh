# download tokenizer
mkdir -p vocab
wget https://s3.amazonaws.com/models.huggingface.co/bert/gpt2-vocab.json -O vocab/gpt2-vocab.json
wget https://s3.amazonaws.com/models.huggingface.co/bert/gpt2-merges.txt -O vocab/gpt2-merges.txt

# tokenize dataset
mkdir -p data
python tools/preprocess_data.py \
    --input data_raw/debug/mix_uspto.jsonl.zst \
    --output-prefix data/debug \
    --tokenizer-type GPT2BPETokenizer \
    --vocab vocab/gpt2-vocab.json \
    --merge-file vocab/gpt2-merges.txt \
    --dataset-impl mmap \
    --append-eod \
    --workers 1
