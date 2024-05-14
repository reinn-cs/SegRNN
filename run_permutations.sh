#!/bin/bash

sh scripts/permutations/electricity/run_electricity_linear.sh;
sh scripts/permutations/electricity/run_electricity_segrnn.sh;
sh scripts/permutations/electricity/run_electricity_vanrnn.sh;

sh scripts/permutations/traffic/run_traffic_linear.sh;
sh scripts/permutations/traffic/run_traffic_segrnn.sh;
sh scripts/permutations/traffic/run_traffic_vanrnn.sh;

sh scripts/permutations/weather/run_weather_linear.sh;
sh scripts/permutations/weather/run_weather_segrnn.sh;
sh scripts/permutations/weather/run_weather_vanrnn.sh;

