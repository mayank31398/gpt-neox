# tokenize dataset
mkdir -p data
python tools/preprocess_data.py \
    --input data_raw/debug/mix_uspto.jsonl.zst \
    --output-prefix data/debug \
    --tokenizer-type HFGPT2Tokenizer \
    --dataset-impl mmap \
    --append-eod \
    --workers 1
