<div align="center">

# Active Test-time Vision-Language Navigation

<h3><strong>Accepted to <a href='https://neurips.cc/' target='_blank'>NeurIPS 2025</a></strong></h3>

This repository is the official implementation of [**Active Test-time Vision-Language Navigation**](https://arxiv.org/pdf/2506.06630).

Project webpage: [https://kuai-lab.github.io/neurips2025atena/](https://kuai-lab.github.io/neurips2025atena/).
</div>

<p align="justify">
Vision-Language Navigation (VLN) policies trained on offline datasets often exhibit degraded task performance when deployed in unfamiliar navigation environments at test time, where agents are typically evaluated without access to external interaction or feedback. Entropy minimization has emerged as a practical solution for reducing prediction uncertainty at test time; however, it can suffer from accumulated errors, as agents may become overconfident in incorrect actions without sufficient contextual grounding. To tackle these challenges, we introduce ATENA (Active TEst-time Navigation Agent), a test-time active learning framework that enables a practical human-robot interaction via episodic feedback on uncertain navigation outcomes. In particular, ATENA learns to increase certainty in successful episodes and decrease it in failed ones, improving uncertainty calibration. Here, we propose mixture entropy optimization, where entropy is obtained from a combination of the action and pseudo-expert distributions—a hypothetical action distribution assuming the agent’s selected action to be optimal—controlling both prediction confidence and action preference. In addition, we propose a selfactive learning strategy that enables an agent to evaluate its navigation outcomes based on confident predictions. As a result, the agent stays actively engaged throughout all iterations, leading to well-grounded and adaptive decision-making. Extensive evaluations on challenging VLN benchmarks—REVERIE, R2R, and R2R-CE—demonstrate that ATENA successfully overcomes distributional shifts at test time, outperforming the compared baseline methods across various settings.
</p>


<div align="center">
    <img src="files/main_figure.png", width="1000">
</div>
</br>


## Requirements for ATENA_DUET

### Environments setting
Instructions copied from [VLN-DUET](https://github.com/cshizhe/VLN-DUET):


1. Install Matterport3D simulators: follow instructions [here](https://github.com/peteanderson80/Matterport3DSimulator). We use the latest version instead of v0.1.
```
export PYTHONPATH=Matterport3DSimulator/build:$PYTHONPATH
```

2. Install requirements:
```setup
conda create --name vlnduet python=3.8.5
conda activate vlnduet
pip install -r requirements.txt
```

### Data and Trained Weights

1. Download both the pretrained models and the REVERIE/R2R datasets from the provided [Dropbox](https://www.dropbox.com/sh/u3lhng7t2gq36td/AABAIdFnJxhhCg2ItpAhMtUBa?dl=0) link, and place them in the `ATENA_DUET/datasets` directory. 

2. Download pretrained lxmert
```
mkdir -p datasets/pretrained 
wget https://nlp.cs.unc.edu/data/model_LXRT.pth -P datasets/pretrained
```

### Evaluation
Use the fine-tuned model provided by VLN-DUET. For ATENA evaluation, there is no need for any additional pretraining or fine-tuning.

```bash
# for REVERIE/R2R
cd ATENA_DUET/map_nav_src
bash scripts/run_reverie_atena.sh   # (or run_r2r_atena.sh)
```
<br>


## Requirements for ATENA_ETPNav

### Environments setting
Please follow the **environment setups** from [ETPNav](https://github.com/MarSaKi/ETPNav).

### Scenes: Matterport3D

Instructions copied from [VLN-CE](https://github.com/jacobkrantz/VLN-CE):

Matterport3D (MP3D) scene reconstructions are used. The official Matterport3D download script (`download_mp.py`) can be accessed by following the instructions on their [project webpage](https://niessner.github.io/Matterport/). The scene data can then be downloaded:

```bash
# requires running with python 2.7
python download_mp.py --task habitat -o ATENA_ETPNav/data/scene_datasets/mp3d/
```

Extract such that it has the form `scene_datasets/mp3d/{scene}/{scene}.glb`. There should be 90 scenes. Place the `scene_datasets` folder in `data/`.

### Data and Trained Weights

* Waypoint Predictor for R2R-CE, `data/wp_pred/check_cwp_bestdist_hfov90` [[link]](https://drive.google.com/file/d/1goXbgLP2om9LsEQZ5XvB0UpGK4A5SGJC/view?usp=sharing).
* Dataset and fine-tuned model for R2R-CE [[link]](https://drive.google.com/file/d/1MWR_Cf4m9HEl_3z8a5VfZeyUWIUTfIYr/view?usp=share_link).

### Evaluation
Use the fine-tuned model provided by ETPNav. For ATENA evaluation, there is no need for any additional pretraining or fine-tuning.

```bash
# for R2R-CE
cd ATENA_ETPNav/
CUDA_VISIBLE_DEVICES=0 bash run_r2r/main.bash eval 2333  # evaluation
```

## Citation

```bibtex
@article{ko2025active,
  title={Active Test-time Vision-Language Navigation},
  author={Ko, Heeju and Kim, Sungjune and Oh, Gyeongrok and Yoon, Jeongyoon and Lee, Honglak and Jang, Sujin and Kim, Seungryong and Kim, Sangpil},
  journal={arXiv preprint arXiv:2506.06630},
  year={2025}
}
```
