---
title: "Support Vector Machine"
draft: false
typora-root-url: ..\..\static
weight: 6
---

# 支持向量机(SVM)

{{% attachments style="info" sort="desc" title="The Slides" /%}}

## 引言

### 回顾

- 线性判别函数的基本概念 
- Fisher线性判别函数 
- 感知准则函数 
- 最小平方误差准则函数 
- 多类问题

### 简介

**支持向量机**(Support Vector Machine)是基于统计学习理论(Statistical Learning Theory, SLT)发展起来的一种新的机器学习的方法。直接掀起了统计学习在2000前后的发展高潮。 

统计学习理论主要创立者是**Vladimir N. Vapnik**。

- 线性支持向量机：对于**线性可分**样本集如何找出最优分类超平面 
- 非线性支持向量机：SVM如何推广？

## （基准）SVM

SVM从**线性可分**情况下的最优分类面发展而来。

最优分类面就是要求分类线不但能将两类**正确分开**(训练错误率为 0 ), 且使**分类间隔**最大。 SVM考虑寻找一个满足分类要求的超平面, 并且使训练集里的**点距离分类面**尽可能的远, 也就是寻找一个分类面使它两侧的空白区域(**Margin**)最大。

**要点**:

- 定义一种**距离**, 每个分类面都能够衡量出该性能指标; 
- 最优分类面在该性能指标上**最优**。

<img src="/images/6-SVM.assets/image-20221108113532165.png" alt="image-20221108113532165" style="zoom: 50%;" />

**定义**：

- 样本集 $\left\{x_n, t_n\right\}, n=1,2, \ldots, N, x_n \in \mathcal{R}^d ; t_n \in\{-1,1\}$

- 线性模型：分类器定义为 $y(x)=w^T x+b$, 可学习。

- 线性可分的定义:
  $$
  t_n=\left\{\begin{array}{ll}
  1, & y\left(x_n\right)>0 \text { if } x_n \in w_1 \\
  -1, & y\left(x_n\right)<0 \text { if } x_n \in w_2
  \end{array} \Rightarrow \quad t_n y\left(x_n\right)>0\right.
  $$
  
- 最优超平面定义的**分类决策函数**可以表示为：

$$
f(\mathbf{x})=\operatorname{sgn}(\mathbf{w} \cdot \mathbf{x}+b)
$$

<img src="/images/6-SVM.assets/image-20221108113754435.png" alt="image-20221108113754435" style="zoom:50%;" />

样本集任意一点 $x_n$ 到分类面(满足 $t_n y\left(x_n\right)>0$ ) 的距离为 $\frac{|g(x)|}{\|w\|}$, 即: $\frac{t_n y\left(x_n\right)}{\|w\|}=\frac{t_n\left(w^T x_n+b\right)}{\|w\|}$
$$
\begin{gathered}
x=x_p+r \frac{w}{\|w\|} \\
v^T\left(x_p+r \frac{w}{\|w\|}\right)+\omega_0
\end{gathered}
$$
优化 $w$ 利 $b$ 使 Margin最大 $\arg \max _{w, b}\left\{\frac{1}{\|w\|} \min _n\left[t_n\left(\boldsymbol{w}^T x_n+\boldsymbol{b}\right)\right]\right\}$

> 直接求解较复杂

由于有无数等价解: $w \rightarrow k w, b \rightarrow k b$

那么可以确定尺度：对于离超平面**最近的点** $t_n\left(w^T x_n+b\right)=1$ ，那么对于**所有点**满足 $t_n\left(w^T x_n+b\right) \geq 1$

> 思想：对于决策超平面的标准（规范化）表示 Canonical Representation

问题转化为最大化 $\|w\|^{-1}$, 等价于
$$
\arg \min _{w, b} \frac{1}{2}\|w\|^2 \quad s.t. \quad t_n\left(w^T x_n+b\right) \geq 1
$$

> 这是一个凸二次规划问题——要么无解，要么唯一解。

### KKT条件

#### 拉格朗日函数

$$
L(w, \alpha, \beta)=f(w)+\sum_{i=1}^n \alpha_i g_i(w)+\sum_{i=1}^i \beta_i h_i(w)
$$

#### 对偶问题

原问题 $\min _w f(w)$ 转化为: $\min _w \theta_P(w)=\min _w \max _{\alpha, \beta ; \alpha_i \geq 0} L(w, \alpha, \beta)$ ，记为 $p^*$ 

> $p^*$问题**等价**于原始问题，这一点可以从$L(w, \alpha, \beta)$的结构看出：$\max _{\alpha, \beta ; \alpha_i \geq 0} L(w, \alpha, \beta)$的含义和带约束的原问题是相同的

直接求解不容易，进而转向另一个问题 $\theta_D(\boldsymbol{\alpha}, \boldsymbol{\beta})=\min _w L(w, \alpha, \beta)$ 。

先固定 $\alpha, \beta$, 求拉格朗日函数关于 $w$ 的**最小值**, 之后再求 $\theta_D(\alpha, \beta)$ 的**最大值,** 即：
$$
\max _{\alpha, \beta ; \alpha_i \geq 0} \theta_D(\boldsymbol{\alpha}, \boldsymbol{\beta})=\max _{\alpha, \beta ; \alpha_i \geq 0} \min _w L(w, \alpha, \beta)
$$
此问题为原问题的**对偶问题**，记为 $d^*$ 。

对偶问题和原问题的关系：

$\boldsymbol{d}^*=\max _{\alpha, \beta ; \alpha_i \geq 0} \min _w L(w, \alpha, \boldsymbol{\beta}) \leq \min _w \max _{\alpha, \beta ; \alpha_i \geq 0} L(w, \alpha, \beta)=p^*$

#### 拉格朗日对偶性

$$
\boldsymbol{d}^*=\max _{\alpha, \boldsymbol{\beta} ; \boldsymbol{\alpha}_i \geq 0} \min _{\boldsymbol{w}} L(w, \boldsymbol{\alpha}, \boldsymbol{\beta}) \leq \min _{\boldsymbol{w}} \max _{\alpha, \boldsymbol{\beta} ; \boldsymbol{\alpha}_i \geq 0} L(w, \boldsymbol{\alpha}, \boldsymbol{\beta})=p^*
$$
> 这种性质被称为**弱对偶性**

证明：
$$
\begin{gathered}
D(\alpha, \beta)=\min _x L(x, \alpha, \beta) \leq L(x, \alpha, \beta) \leq \max _{\alpha, \beta, \beta_i \geq 0} L(x, \alpha, \beta)=f(x) \\
d^*=\max _{\alpha, \beta ; \beta_i \geq 0} D(\alpha, \beta) \leq \min _x f(x)=p^*
\end{gathered}
$$
对偶间隔： $p^*-d^*$

在**强对偶成立**（对偶间隔为0）的情况下, 可以通过求解对偶问题来得到原始问题的解 (SVM利用强对偶求解) ;

（凸优化下的Slater条件）假设 $f$ 和 $g$ 都是凸函数, h是仿射的 (Affine, 线性函数的一般形式), 且对于所有的i, $g_i(w)<$ 0 , 那么一定**存在** $w^*, \alpha^*, \beta^*$, 使 $w^*$ 是原问题的解， $\alpha^*, \beta^*$ 是对偶问题的解。

> 凸优化下如果满足slater条件，那么最优解等价于满足KKT条件的解

即 $d^*=\boldsymbol{p}^*=\boldsymbol{L}\left(\boldsymbol{w}^*, \boldsymbol{\alpha}^*, \boldsymbol{\beta}^*\right)$, 且 $w^*, \alpha^*, \beta^*$ 满足KKT条件。

> [KKT、Slater、最优性三者的关系](https://zhuanlan.zhihu.com/p/469930026)

#### KKT条件

KKT(Karush-Kuhn-Tucker)条件
$$
\begin{gathered}
\frac{\partial}{\partial w_i} L\left(w^*, \alpha^*, \beta^*\right)=0, i=1, \ldots, n \\
\frac{\partial}{\partial \beta_i} L\left(w^*, \alpha^*, \beta^*\right)=0, i=1, \ldots, l \\
\alpha_i^* g_i\left(w^*\right)=0, i=1, \ldots, k \\
g_i\left(w^*\right) \leq 0, i=1, \ldots, k \\
\alpha_i^* \geq 0, i=1, \ldots, k
\end{gathered}
$$
(凸优化下）如果 $w^*, \alpha^*, \beta^*$ 满足 KKT 条件，那么它们就是原问题和对偶问题的**解**。

**互补条件**含义：如果 $\alpha^*>0$, 那么 $g_i\left(\boldsymbol{w}^*\right)=\mathbf{0}$, 即 $w$ 处于可行域的边界上, 是起作用的(Active)约束。

---

回到SVM

不等式约束下的优化问题, 可以用**拉格朗日乘子法**求解极值:
$$
\begin{gathered}
\min _{w, b} \max _a L(w, b, a) \\
L(w, b, a)=\frac{1}{2}\|w\|^2-\sum_{n=1}^N a_n\left\{t_n\left(w^T x_n+b\right)-1\right\}, a_n \geq 0
\end{gathered}
$$
其中, $L(w, b, a)$ 为**拉格朗日泛函**， $a_n$ 为对每一个样本引入的**拉格朗日系数**。

上述最小、最大问题, 最优解在**鞍点处**求得。

<img src="/images/6-SVM.assets/image-20221108115302812.png" alt="image-20221108115302812" style="zoom: 67%;" />

最优解处**偏导数**为零:
$$
\begin{gathered}
\frac{\partial L(w, b, a)}{\partial w}=w-\sum_{n=1}^N a_n t_n x_n=0 \\
\frac{\partial L(w, b, a)}{\partial b}=\sum_{n=1}^N a_n t_n=0
\end{gathered}
$$
代入 $L$ 拉格朗日泛函，消去w和$b$ ，得到对偶问题():
$$
\begin{array}{cc}
\underset{\alpha}{max}\quad\tilde{L}(\boldsymbol{a})=\sum_{n=1}^N a_n-\frac{1}{2} \sum_{n=1}^N \sum_{m=1}^N a_n a_m t_n t_m x_n{ }^T x_m &  \\
\text { s.t. } a_n \geq 0, n=1, \ldots, N, \sum_{n=1}^N a_n t_n=0 &
\end{array}
$$
通过**对偶问题的解** $a_n^*, n=1,2, \ldots, N$, 可以求解出**原问题的解**:
$$
w^*=\sum_{n=1}^N a_n^* t_n x_n
$$
即: 最优平面的权值向量等于训练样本以一定的系数**加权**后进行**线性组合**。

下面考虑如何求解$b$

KKT条件:
$$
\begin{aligned}
&a_n \geq 0 \\
&t_n y\left(x_n\right)-1 \geq 0 \\
&a_n\left\{t_n y\left(x_n\right)-1\right\}=0
\end{aligned}
$$
其中支持向量是那些**Active约束下**的不等式对应的**样本点**:
$$
t_n\left(w^T x+b\right)=1, a_n>0
$$
可以根据已经求得的 $w^*$, 用**支持向量**求解 $\mathrm{b}^*$

非支持向量：
$$
\begin{aligned}
&t_n\left(w^T x+b\right)>1, a_n=0 \\
&y(x)=\sum_{n=1}^N a_n t_n x^T x_n+b \\
&b=\frac{1}{N_s} \sum_{n \in S}\left(t_n-\sum_{m \in S} a_m t_m x_n^T x_m\right)
\end{aligned}
$$

> 超平面法向量($\omega$)是支持向量的**线性组合** 
>
> 由于最优超平面的解($\omega,b$)完全由支持向量决定，这种方法被称为支持向量机。

<img src="/images/6-SVM.assets/image-20221108143843247.png" alt="image-20221108143843247" style="zoom:50%;" />

测试时: $f(\mathbf{x})=\operatorname{sgn}\left(\boldsymbol{w}^* \boldsymbol{x}+\boldsymbol{b}^*\right)$

## 软间隔SVM

基准SVM处理**噪声**和**离群点**的问题

- 如何处理**线性不可分**？ 
- 求解最优分类面的时间代价大，还可能导致**受噪声**影响,泛化性能差。

因此，对于分布有交集的数据需要有一定范围内的“**错分**”，又有较大分界区域的**广义最优分类面**。

<img src="/images/6-SVM.assets/image-20221108144656976.png" alt="image-20221108144656976" style="zoom:50%;" />

这种处理方式也被视为是从**硬间隔**(Hard Margin)向**软间隔** (Soft Margin)的转变。

**硬间隔**
$$
\begin{aligned}
&\min _{w, b} \frac{1}{\|w\|^2} \\
&\text { s.t. } t_n\left(w^T x_n+b\right) \geq 1, n=1, \ldots, N
\end{aligned}
$$
<img src="/images/6-SVM.assets/image-20221108145459376.png" alt="image-20221108145459376" style="zoom:50%;" />

**软间隔**
$$
\begin{aligned}
&\min _{w, b, \xi} \frac{1}{\|w\|^2} +\mathcal{C} \sum_{n=1}^N \xi_n \\
&\text { s.t. } t_n\left(w^{\boldsymbol{T}} x_n+\boldsymbol{b}\right) \geq 1-\xi_n, n=1, \ldots, N \\
&\xi_n \geq 0
\end{aligned}
$$
<img src="/images/6-SVM.assets/image-20221108145520981.png" alt="image-20221108145520981" style="zoom:50%;" />

利用拉格朗日乘子法求解:
$$
\min _{w, b, \xi} \max _a L(w, b, \xi, a, \gamma)=\frac{1}{2}\|w\|^2+C \sum_{n=1}^N \xi_n-\sum_{n=1}^N a_n\left\{t_n y\left(x_n\right)-1+\xi_n\right\}-\sum_{n=1}^N \gamma_n \xi_n
$$
$$
a_n \geq 0 ; \gamma_n \geq 0
$$
同样地, 对 $\mathrm{L}$ 求导优化 $w, b,\left\{\xi_n\right\}$

KKT条件:
$$
\begin{aligned}
&a_n \geq 0 \\
&t_n y\left(x_n\right)-1+\xi_n \geq 0 \\
&a_n\left(t_n y\left(x_n\right)-1+\xi_n\right)=0 \\
&\gamma_n \geq 0 \\
&\xi_n \geq 0 \\
&\gamma_n \xi_n=0
\end{aligned}
$$
令L关于$\omega,b,\xi_n$的导数等于0：
$$
&\frac{\partial L}{\partial w}=0 \Rightarrow w=\sum_{n=1}^N a_n t_n x_n \\
&\frac{\partial L}{\partial b}=0 \Rightarrow \sum_{n=1}^N a_n t_n=0 \\
&\frac{\partial L}{\partial \xi_n}=0 \Rightarrow a_n=C-\gamma_n \\

$$
代入 $L$ 化简得到**对偶优化**问题 (max) :
$\tilde{L}(a)=\sum_{n=1}^N a_n-\frac{1}{2} \sum_{n=1}^N \sum_{m=1}^N a_n a_m t_n t_m x_{n}{ }^T x_m$

得到广义最优分类面的**对偶形式**：
$$
\max _a \sum_{n=1}^N a_n-\frac{1}{2} \sum_{n=1}^N \sum_{m=1}^N a_n a_m t_n t_m x_n{ }^T x_m \\
\text { s.t. } \sum_{n=1}^N a_n t_n=0 \\
0 \leq a_n \leq C, n=1,2, \ldots, N
$$
那么原问题中的**解向量**满足:
$$
w^*=\sum_{n=1}^N a_n^* t_n x_n
$$
代入 $\operatorname{sgn}\left(w^{\boldsymbol{T}} x+b\right)$, 得到对于**新样本**
$$
\begin{aligned}
&y(x)=\sum_{n=1}^N a_n t_n x^T x_n+b \\
&b=\frac{1}{N_{\mathcal{M}}} \sum_{n \in \mathcal{M}}\left(t_n-\sum_{m \in S} a_m t_m x_n{ }^T x_m\right)
\end{aligned}
$$
<img src="/images/6-SVM.assets/image-20221108151205045.png" alt="image-20221108151205045" style="zoom: 50%;" />


根据KTT条件，式:
$$
\min _{w, b, \xi} \max _a L(w, b, \xi, a, \gamma)=\frac{1}{2}\|w\|^2+C \sum_{n=1}^N \xi_n-\sum_{n=1}^N a_n\left\{t_n y\left(x_n\right)-1+\xi_n\right\}-\sum_{n=1}^N \gamma_n \xi_n
$$
在**鞍点**满足以下两个条件:

1. $a_n\left\{t_n\left[\boldsymbol{w}^{\boldsymbol{T}} \boldsymbol{x}_{\boldsymbol{n}}+b\right]-1+\xi_n\right\}=0 \quad$
2.  $\gamma_n \xi_n=\left(C-a_n\right) \xi_n=0 \quad$ 

**分析**：多数的 $a_n=0$, 只有使得 $t_n\left[\boldsymbol{w}^T \boldsymbol{x}_n+b\right]- 1+\xi_n=\mathbf{0}$ 的样本，才会使得 $a_n>0$ 。这些样本分为两类，决定着**支持向量**：

1. **分类正确**但处于**分界面上**的样本, $0<$ $a_n<C, \quad \xi_n=0$
2. **分类错误**的样本 $a_n=C, \xi_n>0$ 。

从上式可见, 只有对拉格朗日乘子达到**上界** $a_n=C$ 的样本才有 $\xi_n>\mathbf{0}$, 它们是被错分的样本, 其余样本对应的 $\xi_n=0$ 

## 非线性SVM

### 引入

对于**非线性可分**的数据样本，可能通过适当的**函数变换**，将其在**高维空间**中转化为**线性可分**。

**依据**：如果原始空间是**有限维**，一定存在一个这样的高维空间使得**样本可分** 

**非线性支持向量机**的思路是：把样本x映射到某个高维特征空间 𝝓(𝒙) ，并在其中使用**线性分类器**。

#### 例子

<img src="/images/6-SVM.assets/image-20221108152651850.png" alt="image-20221108152651850" style="zoom:50%;" />

<img src="/images/6-SVM.assets/image-20221108152714874.png" alt="image-20221108152714874" style="zoom: 33%;" />

XOR问题（**二维空间**中最简单的**非线性**问题）

**问题**：

二维样本集 𝒙 = (𝒙𝟏, 𝒙𝟐) 第一类(0, 0)和 (1, 1)，第二类(1, 0)和 (0, 1) 

<img src="/images/6-SVM.assets/image-20221108153039028.png" alt="image-20221108153039028" style="zoom:50%;" />

**思路**：

通过映射函数𝝓𝒙 = (𝒙𝟏, 𝒙𝟐, 𝒙𝟏𝒙𝟐)

<img src="/images/6-SVM.assets/image-20221108153025763.png" alt="image-20221108153025763" style="zoom:50%;" />

将其变为可分情形

<img src="/images/6-SVM.assets/image-20221108153152535.png" alt="image-20221108153152535" style="zoom:50%;" />

---

### 推导

利用一个固定的**非线性映射** $\phi(x)$ 将数据映射到特征空间学习的**线性分类器等价于**基于原始数据学习的**非线性分类器**。
$$
y(x)=w^T x+b \Rightarrow y(x)=w^T \phi(x)+b
$$
决策时
$$
\begin{gathered}
y(x)=\sum_{n=1}^N a_n t_n x^T x_n+b \Rightarrow y(x)=\sum_{n=1}^N a_n t_n \phi(x)^T \phi\left(x_n\right)+b \\
\qquad k\left(x, x_n\right)=\phi(x)^T \phi\left(x_n\right) \quad \text{核函数}
\end{gathered}
$$
不论 $\phi(x)$ 所生成的变换空间的维数有多高、具体形式如何, **高维特征空间**里的**内积**都可以在原空间通过函数$k\left(x, x_n\right)$ 计算得到。避免高维空间运算。

<img src="/images/6-SVM.assets/image-20221108154647130.png" alt="image-20221108154647130" style="zoom:50%;" />

<img src="/images/6-SVM.assets/image-20221108154707409.png" alt="image-20221108154707409" style="zoom: 33%;" />

根据问题和数据的不同，选择带有不同的**核函数**。

一些常用的核函数:

- 线性核： $\quad k\left(x_1, x_2\right)=x_1^T x_2$
- 多项式核： $k\left(x_1, x_2\right)=\left(<x_1, x_2>+R\right)^d \quad$ 如何判断一个函数是
- 高斯核: $k\left(x_1, x_2\right)=\exp \left\{-\frac{\left\|x_1-x_2\right\|^2}{2 \sigma^2}\right\} \quad$ 否可以作为核函数?
- Sigmoid核: $k\left(x_1, x_2\right)=\tanh \left(\beta_0 x_1^T x_2+\beta_1\right)$

> Mercer定理：
> $\mathbb{R}^n \times \mathbb{R}^n \rightarrow \mathbb{R}$ 上的映射 $k$ 是一个**有效核函数**(也称Mercer核函数)当且仅当
> 对于**任何训练样本**其相应的**核函数矩阵**是**对称**、**半正定**的, 即对于任何平方可积函数 $\boldsymbol{g}(\boldsymbol{x})$ 有 $\iint k(x, y) g(x) g(y) d x d y \geq 0$ 。

### 工具

LibSVM: http://www.csie.ntu.edu.tw/~cjlin/libsvm/

<img src="/images/6-SVM.assets/image-20221108155445076.png" alt="image-20221108155445076" style="zoom:50%;" />

## VC维

VC维用于衡量**假设空间的复杂度**，为机器学习提供了坚实的理论基础。

VC维是SLT（统计学习理论）中衡量函数集性能的指标

**定义**： 对于一个**指示函数**(即只有0和1两种取值的函数)**集**，如果**存在**h个样本能够被函数集里的函数按照**所有可能**的$2^h$种（标签）形式分开，则称函数集能够把h个样本**打散**，**函数集**的**VC维**就是**能够打散的最大样本数目**。

例如，（存在）二维平面上大小为3的示例集可以**被直线打散**，但（任何）大小为4的示例集**不能被直线打散**。因此二维平面上**线性划分**构成的假设空间的**VC维为3**。

<img src="/images/6-SVM.assets/image-20221108160133375.png" alt="image-20221108160133375" style="zoom:50%;" />

> 注意**存在**、**任意**等概念：
>
> 对于样本数量为h的样本集合，**只要找出一个**，其上**任意**的标签形式都可以被**函数集**分开，就可以称h为这个函数集的**VC维**

一般而言, $V C$ 维反映了**函数集**的**学习能力**, <u>$V C$ 维越大则学习机器越复杂</u>, 学习的**内容量**就越大。

目前**没有通用的**关于任意函数集 $\mathrm{VC}$ 维计算的**理论**，只对一些特殊的函数集知道其VC维。

- 在 $n$ 维实数空间中**线性分类器**和**线性实函数**的 $\mathrm{VC}$ 维是$n+1$
- 而 $f(x, a)=\sin (a x)$ 的 $\mathrm{VC}$ 维则为**无穷大**

如何用理论和试验的方法计算其VC维是当前SLT中一个待研究的问题。
