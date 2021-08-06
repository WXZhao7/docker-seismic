# docker-seismic

> 为方便创建地震学使用环境而创建的Docker镜像

[SeisMan](https://blog.seisman.info)博客以及在其基础上创建的[地震"学"](https://seismo-learn.org/)网站为地震学相关工作提供了基本的环境搭建教程, 这无疑方便了新手入门以及环境建立. 但依旧存在着一些痛点:

001. 新手入门时需要阅读的内容较多, 把握不住重点, 环境建设复杂
002. 个人硬件配置和操作系统带来的各种问题, 部分步骤难以复现
003. 环境崩溃后的恢复问题, 一旦环境出现致命问题修复或复现成本高
004. 环境的迁移和统一难以保证, 出现"这个步骤/代码能在我这里运行"的情况
而Docker在很大程度上解决了这些问题, 可以帮助新手跳过地震学科研环境的架构过程, 也可以帮助用户快速搭建一个时候的环境.

<del>本教程的安装遵循了[地震"学"](https://seismo-learn.org/)给出的[《文件管理》](https://seismo-learn.org/seismology101/best-practices/file-organization/)和[《软件安装》](https://seismo-learn.org/seismology101/best-practices/software-installation/), 但将所有的软件和数据放在home分区的做法仅适用于遵循[《配置操作系统》](https://seismo-learn.org/seismology101/computer/setup/)进行简单分区的用户.</del>

> 如自行指定了linux系统分区, 根据自己的文件系统规范进行合理安装即可, 鉴于docker的默认用户为root用户, 大部分软件都安装在`/opt`中

## 使用方法
0. 确定使用的硬件平台满足要求[Supported architectures](https://github.com/docker-library/official-images#architectures-other-than-amd64), 正确[安装docker](https://github.com/WXZhao7/docker-seismic/blob/main/README.md#安装Docker)
1. 拉取仓库, `main`分支不包含软件源码, `redundant`分支包含软件源码可加速构建镜像
2. 自行补充部分未开源软件包
3. 使用提供的构建脚本进行构建
4. 使用提供的运行脚本运行镜像
## 软件列表

| software | version | source |
| --- | --- | --- |
| SAC | v102.0 | [request link](http://ds.iris.edu/ds/nodes/dmc/forms/sac/) |
| fk | v3.3 | [Lupei Zhu Home](http://www.eas.slu.edu/People/LZhu/home.html) |
| Taup | v2.5.0 | [crotwell/TauP](https://github.com/crotwell/TauP/releases) |
| rdseed | v5.3.1 | [rdseedv5.3.1](http://ds.iris.edu/pub/programs/rdseedv5.3.1.tar.gz) |
| GMT4 | v4.5.18 | [GMT](https://www.generic-mapping-tools.org/) |
| GMT6 | v6.2.0 | [GMT](https://www.generic-mapping-tools.org/) |
| gCAP3D | v1.2 | [gCAP3D1, 2](http://www.eas.slu.edu/People/LZhu/downloads/gCAP3D1.2.tar) |
| CPS | v3.30(2021-07-09) | [request link](http://www.eas.slu.edu/eqc/eqc_cps/CPS/cpslisc.html) |
| SOD | v3.2.10 | [SOD](http://www.seis.sc.edu/sod/) |
| pssac | / | [Lupei Zhu Home](http://www.eas.slu.edu/People/LZhu/home.html) |
| pssac2 | / | [SeisMan](https://blog.seisman.info/pssac2-install/) |

## 安装Docker

中文基础教程:
[Docker-install](https://yeasy.gitbook.io/docker_practice/install)

官方详细教程:
[Install Docker Engine](https://docs.docker.com/engine/install/)

## 面临的问题

- [ ] SAC二进制文件的分发版权
- [ ] CPS源码的分发版权

## TODO列表

- [ ] 非root用户的使用
- [ ] build脚本
- [ ] run脚本改进
<!-- /* md-file-format-disable */ -->