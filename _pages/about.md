---
permalink: /
title: ""
excerpt: ""
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

{% if site.google_scholar_stats_use_cdn %}
{% assign gsDataBaseUrl = "https://cdn.jsdelivr.net/gh/" | append: site.repository | append: "@" %}
{% else %}
{% assign gsDataBaseUrl = "https://raw.githubusercontent.com/" | append: site.repository | append: "/" %}
{% endif %}
{% assign url = gsDataBaseUrl | append: "google-scholar-stats/gs_data_shieldsio.json" %}

<span class='anchor' id='about-me'></span>

# Welcome to the World of Wenhao Yu

I am delighted to have you here! This webpage is my personal space where I share my notes, publications, news, and blogs. I hope you find what you're looking for!

## About Myself


I am currently pursuing a PhD in Computer Science and Engineering at **The Chinese University of Hong Kong (CUHK)**, supervised by [Prof. Irwin King](https://www.cse.cuhk.edu.hk/irwin.king/). Before this, I completed my Bachelor's Degree in Artificial Intelligence at **Beijing University of Aeronautics and Astronautics (BUAA, or Beihang University)**.

### My Research Interests

My research interests include **Graph Machine Learning**, **Large Language Models (Reasoning & Personalization)**, and various applications of AI, such as AI for Bioinformatics, Electronic Design Automation, and Architecture.

I love engaging in meaningful conversations about various aspects of **life**, **research**, and anything else that piques curiosity. Feel free to reach out if you'd like to discuss everyday experiences, exciting developments in research, or creative projects and hobbies.

Let's exchange ideas and explore the fascinating world around us!

<!-- I have published more than 100 papers at the top international AI conferences with total <a href='https://scholar.google.com/citations?user=L3dVMPsAAAAJ'>google scholar citations <strong><span id='total_cit'>260000+</span></strong></a> (You can also use google scholar badge <a href='https://scholar.google.com/citations?user=L3dVMPsAAAAJ'><img src="https://img.shields.io/endpoint?url={{ url | url_encode }}&logo=Google%20Scholar&labelColor=f6f6f6&color=9cf&style=flat&label=citations"></a>). -->


# 🔥 News
- *2025.05*: &nbsp;🎉🎉 Our paper titled "Probability-Entropy Calibration: An Elastic Indicator for Adaptive Fine-tuning" has been accepted by [ICML 2026](https://icml.cc/Conferences/2026)!
- *2025.01*: &nbsp;🎉🎉 Our paper titled "PerFit: Exploring Personalization Shifts in Representation Space of LLMs" has been accepted by [ICLR 2026](https://iclr.cc/Conferences/2026)!
- *2025.01*: &nbsp;🎉🎉 Our paper titled "Generative Archetype-Grounded Item Representations for Sequential Recommendation" has been accepted by [WWW 2026](https://www2026.thewebconf.org/)!
- *2024.12*: &nbsp;🎉🎉 Our paper titled "GDiffRetro: Retrosynthesis Prediction with Dual Graph Enhanced Molecular Representation and Diffusion Generation" has been accepted as an oral paper by [AAAI 2025](https://aaai.org/conference/aaai/aaai-25/)!

# 📝 Publications 

<div class='paper-box'><div class='paper-box-image'><div><div class="badge">ICML 2026</div><img src='images/ranktuner_fig1.png' alt="sym" width="100%"></div></div>
<div class='paper-box-text' markdown="1">

[Probability-Entropy Calibration: An Elastic Indicator for Adaptive Fine-tuning](https://arxiv.org/abs/2602.01745)

**Wenhao Yu**, Shaohang Wei, Jiahong Liu, Yifan Li, Minda Hu, Aiwei Liu, Hao Zhang, Irwin King

- RankTuner introduces a probability-entropy calibration signal, the Relative Rank Indicator, to reweight the fine-tuning objective, focusing updates on truly under-learned tokens. Experiments on multiple backbones show consistent improvements on mathematical reasoning benchmarks.
</div>
</div>

<div class='paper-box'><div class='paper-box-image'><div><div class="badge">ICLR 2026</div><img src='images/perfit_fig1.png' alt="sym" width="100%"></div></div>
<div class='paper-box-text' markdown="1">

[PerFit: Exploring Personalization Shifts in Representation Space of LLMs](https://openreview.net/forum?id=Lwn67fk9e1)

Jiahong Liu, **Wenhao Yu**, Quanyu Dai, Zhongyang Li, Jieming Zhu, Menglin Yang, Tat-Seng Chua, Irwin King

- PerFit uncovers key patterns of user-specific information in the representation space of LLMs, introducing a two-stage solution that achieves precise steering of LLM personalization with 92.3% fewer parameters than the state-of-the-art method.
</div>
</div>

- [Generative Archetype-Grounded Item Representations for Sequential Recommendation](https://github.com/AI-Santiago/GenAIR), Yifan Li, Jiahong Liu, Xinni Zhang, Hao Chen, Yankai Chen, **Wenhao Yu**, Jianting Chen, Irwin King, **WWW 2026**

- [Exploring Personalization Shifts in Representation Space of LLMs](https://openreview.net/forum?id=Lwn67fk9e1), Jiahong Liu, **Wenhao Yu**, Quanyu Dai, Zhongyang Li, Jieming Zhu, Menglin Yang, Tat-Seng Chua, Irwin King, **KnowFM @ ACL 2025**

- [GDiffRetro: Retrosynthesis Prediction with Dual Graph Enhanced Molecular Representation and Diffusion Generation](https://arxiv.org/abs/2501.08001), Shengyin Sun, **Wenhao Yu**, Yuxiang Ren, Weitao Du, Liwei Liu, Xuecang Zhang, Ying Hu, Chen Ma, **AAAI 2025 (Oral)**

# 📖 Educations
- *2024.09 - Present*, Ph.D. in Computer Science and Engineering, The Chinese University of Hong Kong (CUHK). Supervisor: [Prof. Irwin King](https://www.cse.cuhk.edu.hk/irwin.king/)
- *2020.09 - 2024.06*, B.Eng. in Artificial Intelligence, Beijing University of Aeronautics and Astronautics (BUAA / Beihang University)

<!-- # 🎖 Honors and Awards
- *2021.10* Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ornare aliquet ipsum, ac tempus justo dapibus sit amet. 
- *2021.09* Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ornare aliquet ipsum, ac tempus justo dapibus sit amet. 

# 💬 Invited Talks
- *2021.06*, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ornare aliquet ipsum, ac tempus justo dapibus sit amet. 
- *2021.03*, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ornare aliquet ipsum, ac tempus justo dapibus sit amet.  \| [\[video\]](https://github.com/)

# 💻 Internships
- *2019.05 - 2020.02*, [Lorem](https://github.com/), China.
-->

# 🗺️ Visitor Map
<script type='text/javascript' id='mapmyvisitors' src='https://mapmyvisitors.com/map.js?cl=313977&w=300&t=m&d=QJL5564OnLfbAoACTZYvXipaP9pJSzB9MMUTwBbYDI4&co=ffffff&ct=116e93&cmo=47e296&cmn=ff7676'></script>
