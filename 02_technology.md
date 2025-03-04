# What is a container?

## High-level conceptual perspective

* isolated runtime environment for "applications" including their dependencies but not, unlike VMs, the kernel
* simplifies "application" development, and deployment, and strongly improves "application" portability

## Brief historical perspective

Containers are not a new technology.
They were born as a unix system developer tool already during the 1980s.

* chroot (1979/82) <— birth
* FreeBSD jail (2000) <— usability
* LXC (2008) <— popularity
* **Docker (2013) <— community**
* **Singularity (2015) <— science and containerized high-performance computing! also: shared machines**
* Docker rootless (2020) <- Docker for shared machines; but: e.g. GPUs possible?
* Apptainer (2021) joins the Linux Foundation <- align containerized high-performance computing and cloud technology developments

(see e.g. [here](https://en.wikipedia.org/wiki/OS-level_virtualization) and [there](https://www.section.io/engineering-education/history-of-container-technology/) and [many more](https://www.google.com/search?q=history+of+container+technology))

## Technical perspective

The core concept about "what is a container?" from a user perspective is the "shared Linux kernel" and "contained software environment" aspect.

* user processes
* Linux kernel w/ file system
* hardware layer

<img src="./container-concept.png" width="50%">

**References**

* https://www.linuxfordevices.com/tutorials/linux/linux-kernel
* https://www.linux.com/training-tutorials/linux-filesystem-explained/
* https://www.hpcwire.com/2017/11/01/sc17-singularity-preps-version-3-0-nears-1m-containers-served-daily/

## Hands-on part (5 minutes)

To illustrate this, let's pull the `alpine:latest` and `ubuntu:22.04` Linux base images.

On a Linux (or MacOS machine) you can directly have a look at your host system's kernel version,

```
$ uname -a
Linux morpheus 5.8.0-50-generic #56~20.04.1-Ubuntu SMP Mon Apr 12 21:46:35 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
```

the host system's file system structure,

```
$ ls -l /
lrwxrwxrwx   1 root root          7 Okt 30  2020 bin -> usr/bin
drwxr-xr-x   4 root root       4096 Jun  4 06:30 boot
drwxrwxr-x   2 root root       4096 Okt 30  2020 cdrom
drwxr-xr-x  20 root root       4600 Mai 12 09:57 dev
drwxr-xr-x 133 root root      12288 Jun  4 06:30 etc
drwxr-xr-x   3 root root       4096 Okt 30  2020 home
lrwxrwxrwx   1 root root          7 Okt 30  2020 lib -> usr/lib
lrwxrwxrwx   1 root root          9 Okt 30  2020 lib32 -> usr/lib32
lrwxrwxrwx   1 root root          9 Okt 30  2020 lib64 -> usr/lib64
lrwxrwxrwx   1 root root         10 Okt 30  2020 libx32 -> usr/libx32
drwx------   2 root root      16384 Okt 30  2020 lost+found
drwxr-xr-x   2 root root       4096 Jul 31  2020 media
drwxr-xr-x   2 root root       4096 Jul 31  2020 mnt
drwxr-xr-x   3 root root       4096 Nov  3  2020 opt
dr-xr-xr-x 327 root root          0 Apr 20 22:31 proc
drwx------   5 root root       4096 Mai 16 14:46 root
drwxr-xr-x  42 root root       1320 Jun  6 17:27 run
lrwxrwxrwx   1 root root          8 Okt 30  2020 sbin -> usr/sbin
dr-xr-xr-x  13 root root          0 Apr 20 22:31 sys
drwxrwxrwt  18 root root       4096 Jun  6 17:27 tmp
drwxr-xr-x  14 root root       4096 Jul 31  2020 usr
drwxr-xr-x  14 root root       4096 Jul 31  2020 var
```
and e.g. host system's user directory contents,

```
$ ls /home
khoeflich
```

Now, download the Alpine base image from Dockerhub,

```
$ docker pull alpine:latest
```

start an interactive Bash session in the container,

```
$ docker run -it --rm alpine:latest /bin/sh
```

and familiarize yourself with the visible software environment,

```
root@131fa759eb1b:/# ls -l /
root@131fa759eb1b:/# ls /home
root@131fa759eb1b:/# cat /etc/os-release
root@131fa759eb1b:/# uname -a
```

Do this also for the `ubuntu:22.04` image and your host system! What is different, what is the same?

Please note, Docker desktop on MacOS and Windows is shipped with a Linux virtual machine, that runs in the background and provides you with Docker functionality.
What do you expect to find for the respective `uname` commands?

Especially on Windows, you can't natively run a Unix-like command such as `uname` in your host system's PowerShell.
Can you still demonstrate the core concept of "shared Linux kernel" and "contained software environment" on a Windows machine? If so, how?
