#!/usr/bin/env bash
# Usage: bash run_q2_experiments.sh BATCH LR [BATCH LR ...]
# Run at most three independent configurations concurrently, recording all output.
set -uo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
if (( $# == 0 || $# % 2 != 0 )); then
    echo 'Usage: bash run_q2_experiments.sh BATCH LR [BATCH LR ...]' >&2
    exit 2
fi
mkdir -p outputs
export OMP_NUM_THREADS=1 MKL_NUM_THREADS=1
PYTHON_BIN=/home/jianglan/miniconda3/envs/rob831/bin/python
run_one() {
    local batch="$1" rate="$2" name="q2_b${1}_r${2}"
    local log="outputs/${name}.txt"
    if [[ -e "$log" ]]; then
        echo "Refusing to overwrite existing log: $log" >&2
        return 1
    fi
    local command=("$PYTHON_BIN" -u rob831/scripts/run_hw2.py
        --env_name InvertedPendulum-v4 --ep_len 1000 --discount 0.92
        -n 100 -l 2 -s 64 -b "$batch" -lr "$rate" -rtg --seed 1 --exp_name "$name")
    echo "Starting $name"
    {
        printf 'OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 '
        printf '%q ' "${command[@]}"
        printf '2>&1 | tee %q\n' "$log"
    } > "outputs/${name}.command.txt"
    "${command[@]}" 2>&1 | tee "$log" > /dev/null
    local result=$?
    echo "Finished $name (exit $result); log: $log"
    return "$result"
}
pids=()
failed=0
while (( $# )); do
    run_one "$1" "$2" &
    pids+=("$!")
    shift 2
    if (( ${#pids[@]} == 3 || $# == 0 )); then
        for pid in "${pids[@]}"; do
            wait "$pid" || failed=1
        done
        pids=()
    fi
done
exit "$failed"
