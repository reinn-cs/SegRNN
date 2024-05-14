if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

root_path_name=./dataset/
data_path_name=traffic.csv
model_id_name=traffic
data_name=custom


seq_len=720
for pred_len in 96 192 336 720
do
  for model_name in Linear NLinear
  do
    for rnn_type in linear tanh
    do
    python -u run_longExp.py \
      --is_training 1 \
      --root_path $root_path_name \
      --data_path $data_path_name \
      --model_id $model_id_name'_'$seq_len'_'$pred_len \
      --model $model_name \
      --data $data_name \
      --features M \
      --seq_len $seq_len \
      --pred_len $pred_len \
      --seg_len 48 \
      --enc_in 862 \
      --d_model 512 \
      --dropout 0.1 \
      --train_epochs 30 \
      --patience 10 \
      --rnn_type $rnn_type \
      --dec_way pmf \
      --channel_id 0 \
      --revin 1 \
      --random_seed $random_seed \
      --itr 1 --batch_size 8 --learning_rate 0.003 > logs/LongForecasting/$model_name'_'$rnn_type'_'$model_id_name'_'$seq_len'_'$pred_len.log
    done
  done
done
