if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

root_path_name=./data/
data_path_name=weather.csv
model_id_name=weather
data_name=custom

seq_len=720
pred_len=96
for random_seed in 2023 2024 2025 2026 2027
    do
    for model_name in Linear NLinear
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
          --dec_way pmf \
          --channel_id 1 \
          --random_seed $random_seed \
          --des $random_seed \
          --itr 1 --batch_size 64 --learning_rate 0.001
    done
done
