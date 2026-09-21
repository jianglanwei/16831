# Experiment 2: InvertedPendulum-v4

Selected approximate working configuration: **batch size 500, learning rate 0.03**.
It first reaches an average evaluation return of **1000 at iteration 72**
(the 73rd iteration, since the log is zero-based). All ten evaluations at
iterations 90–99 return 1000. The complete 100-iteration curve is plotted,
without smoothing, in `../plots/q2_inverted_pendulum.png` and `.svg`.

## Search interpretation

Batch sizes around **500–1000** and learning rates around **0.01–0.03** are a
useful approximate working range in these seed-1 trials. Both endpoint rates
reached 1000 at both tested batch sizes. This is an empirical range, not a
guarantee for every intermediate configuration or a proof of global optima.
The selected (500, 0.03) run has much stronger late performance than (500, 0.05),
which hits 1000 early but finishes with low returns. Batch 100 failed to reach
1000 at all four tested rates. Learning rate 0.1 failed at batch 500.

The extra trials at (300, 0.05), (400, 0.05), and (500, 0.06) were stopped when
an approximate range was requested. Their partial logs are preserved and
clearly marked below; unfinished runs are not treated as failed full trials.
No additional trials are running.

## Results

All rows use seed 1. A success means `Eval_AverageReturn` reaches 1000 before
iteration 100. Last-ten averages for stopped trials are left blank because
they are not the final ten iterations of a complete run.

| Batch size | Learning rate | Status | Logged iterations | First 1000 (zero-based) | Best return | Mean of final 10 | Final return |
|---:|---:|---|---:|---:|---:|---:|---:|
| 100 | 0.01 | Complete | 100 | Not reached | 84.60 | 45.51 | 84.60 |
| 100 | 0.03 | Complete | 100 | Not reached | 117.75 | 17.79 | 7.27 |
| 100 | 0.05 | Complete | 100 | Not reached | 29.14 | 19.73 | 21.15 |
| 100 | 0.1 | Complete | 100 | Not reached | 90.80 | 5.00 | 5.00 |
| 300 | 0.05 | Stopped early | 55 | Not reached | 964.00 | — | — |
| 400 | 0.05 | Stopped early | 52 | Not reached | 340.00 | — | — |
| 500 | 0.01 | Complete | 100 | 55 | 1000.00 | 157.95 | 80.00 |
| 500 | 0.03 | Complete | 100 | 72 | 1000.00 | 1000.00 | 1000.00 |
| 500 | 0.05 | Complete | 100 | 20 | 1000.00 | 3.00 | 3.00 |
| 500 | 0.06 | Stopped early | 42 | 25 | 1000.00 | — | — |
| 500 | 0.1 | Complete | 100 | Not reached | 103.25 | 5.00 | 5.00 |
| 1000 | 0.01 | Complete | 100 | 44 | 1000.00 | 682.75 | 1000.00 |
| 1000 | 0.03 | Complete | 100 | 61 | 1000.00 | 540.24 | 1000.00 |

## Selected command

Run from `hw2` in the `rob831` environment:

```bash
OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 python -u rob831/scripts/run_hw2.py \
  --env_name InvertedPendulum-v4 --ep_len 1000 --discount 0.92 \
  -n 100 -l 2 -s 64 -b 500 -lr 0.03 -rtg --seed 1 \
  --exp_name q2_b500_r0.03 2>&1 | tee outputs/q2_b500_r0.03.txt
```

Advantage standardization was enabled; neural-network baseline and video
logging were disabled. Evaluation batch size was the default 400. Each
iteration made one policy update. Training used GPU 0. CPU thread counts were
set to 1 to limit resource contention across concurrent trials. The interpreter
used was `/home/jianglan/miniconda3/envs/rob831/bin/python`.

## Exact commands for all trials

Each `.command.txt` contains the full command used; the adjacent `.txt` contains
combined stdout and stderr captured through `tee`. The last three refinement
trials were interrupted before their requested 100 iterations finished.

### q2_b100_r0.01 (complete)

```bash
OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 /home/jianglan/miniconda3/envs/rob831/bin/python -u rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 --ep_len 1000 --discount 0.92 -n 100 -l 2 -s 64 -b 100 -lr 0.01 -rtg --seed 1 --exp_name q2_b100_r0.01 2>&1 | tee outputs/q2_b100_r0.01.txt
```

### q2_b100_r0.03 (complete)

```bash
OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 /home/jianglan/miniconda3/envs/rob831/bin/python -u rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 --ep_len 1000 --discount 0.92 -n 100 -l 2 -s 64 -b 100 -lr 0.03 -rtg --seed 1 --exp_name q2_b100_r0.03 2>&1 | tee outputs/q2_b100_r0.03.txt
```

### q2_b100_r0.05 (complete)

```bash
OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 /home/jianglan/miniconda3/envs/rob831/bin/python -u rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 --ep_len 1000 --discount 0.92 -n 100 -l 2 -s 64 -b 100 -lr 0.05 -rtg --seed 1 --exp_name q2_b100_r0.05 2>&1 | tee outputs/q2_b100_r0.05.txt
```

### q2_b100_r0.1 (complete)

```bash
OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 /home/jianglan/miniconda3/envs/rob831/bin/python -u rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 --ep_len 1000 --discount 0.92 -n 100 -l 2 -s 64 -b 100 -lr 0.1 -rtg --seed 1 --exp_name q2_b100_r0.1 2>&1 | tee outputs/q2_b100_r0.1.txt
```

### q2_b300_r0.05 (stopped early)

```bash
OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 /home/jianglan/miniconda3/envs/rob831/bin/python -u rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 --ep_len 1000 --discount 0.92 -n 100 -l 2 -s 64 -b 300 -lr 0.05 -rtg --seed 1 --exp_name q2_b300_r0.05 2>&1 | tee outputs/q2_b300_r0.05.txt
```

### q2_b400_r0.05 (stopped early)

```bash
OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 /home/jianglan/miniconda3/envs/rob831/bin/python -u rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 --ep_len 1000 --discount 0.92 -n 100 -l 2 -s 64 -b 400 -lr 0.05 -rtg --seed 1 --exp_name q2_b400_r0.05 2>&1 | tee outputs/q2_b400_r0.05.txt
```

### q2_b500_r0.01 (complete)

```bash
OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 /home/jianglan/miniconda3/envs/rob831/bin/python -u rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 --ep_len 1000 --discount 0.92 -n 100 -l 2 -s 64 -b 500 -lr 0.01 -rtg --seed 1 --exp_name q2_b500_r0.01 2>&1 | tee outputs/q2_b500_r0.01.txt
```

### q2_b500_r0.03 (complete)

```bash
OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 /home/jianglan/miniconda3/envs/rob831/bin/python -u rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 --ep_len 1000 --discount 0.92 -n 100 -l 2 -s 64 -b 500 -lr 0.03 -rtg --seed 1 --exp_name q2_b500_r0.03 2>&1 | tee outputs/q2_b500_r0.03.txt
```

### q2_b500_r0.05 (complete)

```bash
OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 /home/jianglan/miniconda3/envs/rob831/bin/python -u rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 --ep_len 1000 --discount 0.92 -n 100 -l 2 -s 64 -b 500 -lr 0.05 -rtg --seed 1 --exp_name q2_b500_r0.05 2>&1 | tee outputs/q2_b500_r0.05.txt
```

### q2_b500_r0.06 (stopped early)

```bash
OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 /home/jianglan/miniconda3/envs/rob831/bin/python -u rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 --ep_len 1000 --discount 0.92 -n 100 -l 2 -s 64 -b 500 -lr 0.06 -rtg --seed 1 --exp_name q2_b500_r0.06 2>&1 | tee outputs/q2_b500_r0.06.txt
```

### q2_b500_r0.1 (complete)

```bash
OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 /home/jianglan/miniconda3/envs/rob831/bin/python -u rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 --ep_len 1000 --discount 0.92 -n 100 -l 2 -s 64 -b 500 -lr 0.1 -rtg --seed 1 --exp_name q2_b500_r0.1 2>&1 | tee outputs/q2_b500_r0.1.txt
```

### q2_b1000_r0.01 (complete)

```bash
OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 /home/jianglan/miniconda3/envs/rob831/bin/python -u rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 --ep_len 1000 --discount 0.92 -n 100 -l 2 -s 64 -b 1000 -lr 0.01 -rtg --seed 1 --exp_name q2_b1000_r0.01 2>&1 | tee outputs/q2_b1000_r0.01.txt
```

### q2_b1000_r0.03 (complete)

```bash
OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 /home/jianglan/miniconda3/envs/rob831/bin/python -u rob831/scripts/run_hw2.py --env_name InvertedPendulum-v4 --ep_len 1000 --discount 0.92 -n 100 -l 2 -s 64 -b 1000 -lr 0.03 -rtg --seed 1 --exp_name q2_b1000_r0.03 2>&1 | tee outputs/q2_b1000_r0.03.txt
```

