if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi
model_name=VanillaRNN

root_path_name=./data/
data_path_name=weather.csv
model_id_name=weather
data_name=custom

seq_len=720
pred_len=96
for random_seed in 3000 3001 3002 3003 3004 3005 3006 3007 3008 3008
    do
    for rnn_type in rnn gru lstm linear linear_tanh
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
          --enc_in 21 \
          --d_model 512 \
          --dropout 0.5 \
          --train_epochs 30 \
          --patience 5 \
          --rnn_type $rnn_type \
          --dec_way pmf \
          --channel_id 1 \
          --random_seed $random_seed \
          --des $random_seed \
          --itr 1 --batch_size 64 --learning_rate 0.001
    done
done
