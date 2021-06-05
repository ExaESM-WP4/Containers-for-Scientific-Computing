#!/usr/bin/env bash

# parameters
app_dir="/app/"
data_path="data/"
data_file="${data_path}/data.dat"

# create data
mkdir -p "${data_path}"
"${app_dir}/create_data" > "${data_file}"

# plot data
gnuplot -c "${app_dir}/plot_data.gp" "${data_file}"