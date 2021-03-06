#!/bin/sh
# If you use my code and my names, fill these three in and everything will be fine
# If not, fill:
#	data_path
#		With the path to your dataset
#	data_name
#		With the name of the files from your dataset
#		I will append train.csv, dev.csv, and val.csv at the end when loading
#	results_path
#		With the path and filename of where the results will be saved
#	embeddings
#		With the path and filename of the embeddings in word2vec format

emb="ft"
task="1"

data_path="../data/hateval2019/"
embeddings="../data/embeddings/${emb}_embeddings.300.vec"
results_path="../results/cnn/task${task}_${emb}.txt"
data_name="task${task}_es_"

python ./cnn/main.py \
		-embeddings=$embeddings \
		-data-path=$data_path \
		-data-name=$data_name
	
python ./cnn/main.py \
		-test \
		-embeddings=$embeddings \
		-data-path=$data_path \
		-data-name=$data_name \
		-results-path=$results_path \
		-snapshot="cnn/snapshot/best_steps_model.pt"
