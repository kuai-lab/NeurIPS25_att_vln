<<<<<<< HEAD
# nerips25_att_vln
=======
# Active Test-time Vision-Language Navigation

This repository contains the official implementation of **Active Test-time Vision-Language Navigation (ATENA)**, 
a framework designed to improve navigation robustness and adaptability under unseen test-time environments.

![framework](files/main_figure.png)


## ⚙️ Requirements

Please follow the **environment setup and dataset preparation steps** from the original [VLN-DUET repository](https://github.com/cshizhe/VLN-DUET).

That includes:
- Installing the **Matterport3D Simulator** (latest version, not v0.1)
- Creating the same **conda environment**
- Downloading the **datasets and pretrained models** as described in the VLN-DUET instructions


## 🚀 Test-time Adaptation & Evaluation


```bash
cd map_nav_src
bash scripts/run_reverie_atena.sh   # (or run_r2r_atena.sh)



```bibtex
@article{ko2025atvln,
  title   = {Active Test-time Vision-Language Navigation},
  author  = {Ko, Heeju and Kim, Sungjune and Oh, Gyeongrok and Yoon, Jeongyoon and Lee, Honglak and Jang, Sujin and Kim, Seungryong and Kim, Sangpil},
  journal = {arXiv preprint arXiv:2506.06630},
  year    = {2025}
}
>>>>>>> 8d78ab1 (Initial ATENA commit)
