## Setup

You can run this code on your own machine or on Google Colab.

1. **Local option:** If you choose to run locally, you will need to install MuJoCo and some Python packages; see [installation.md](../hw1/installation.md) from homework 1 for instructions. If you completed this installation for homework 1, you do not need to repeat it.
2. **Colab:** The first few sections of the notebook will install all required dependencies. You can try out the Colab option by clicking the badge below:

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/LeCAR-Lab/16831-S25-HW/blob/main/hw2/rob831/scripts/run_hw2.ipynb)

Local Install: Might need to install the swig tool
```bash
sudo apt-get update
sudo apt-get install -y swig g++ python3-dev

pip install -r requirements.txt
```

## Complete the code

The following files have blanks to be filled with your solutions from homework 1. The relevant sections are marked with "TODO: get this from hw1".

- [infrastructure/rl_trainer.py](rob831/infrastructure/rl_trainer.py)
- [infrastructure/utils.py](rob831/infrastructure/utils.py)
- [infrastructure/pytorch_util.py](rob831/infrastructure/pytorch_util.py)
- [infrastructure/replay_buffer.py](rob831/infrastructure/replay_buffer.py)
- [policies/MLP_policy.py](rob831/policies/MLP_policy.py)

You will then need to complete the following new files for homework 2. The relevant sections are marked with "TODO".
- [agents/pg_agent.py](rob831/agents/pg_agent.py)
- [policies/MLP_policy.py](rob831/policies/MLP_policy.py)

You will also want to look through [scripts/run_hw2.py](rob831/scripts/run_hw2.py) (if running locally) or [scripts/run_hw2.ipynb](rob831/scripts/run_hw2.ipynb) (if running on Colab), though you will not need to edit this files beyond changing runtime arguments in the Colab notebook.

You will be running your policy gradients implementation in five experiments total, investigating the effects of design decisions like reward-to-go estimators, neural network baselines and generalized advantage estimation for variance reduction, and advantage normalization. See the assignment PDF for more details.

## Section 5 plots

The one-time scripts embed the evaluation returns directly and do not read logs.
Run from `hw2` in the `rob831` environment:

```bash
python plots/plot_hw2_q1.py
python plots/plot_hw2_q2.py
```

- `plots/q1_sb.svg` and `plots/q1_lb.svg`: separate small- and large-batch CartPole comparisons (also saved as PNGs).
- `plots/q2_inverted_pendulum.png`: batch 500, learning rate 0.03, seed 1;
  first reaches 1000 at iteration 72, and all final ten evaluations return 1000.

Both figures also have SVG copies and use the font family and sizes from
`hw1/plots/plot_dagger.py`. All curves are unsmoothed.

Experiment 2 output logs and exact commands are in `outputs/`. See
[the experiment summary](outputs/q2_experiment_summary.md) for the approximate
search range, completed and stopped trials, and full configurations.
