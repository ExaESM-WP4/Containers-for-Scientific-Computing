# What is a container?

## Conceptual perspective

## Brief historical perspective

## Technical perspective

## Hands-on part

Let's pull the `alpine:latest` and `Ubuntu:21.04` Linux base images to illustrate the above concepts.

On a Linux machine you can directly have a look at your host system's kernel version,

```
$ uname -a
Linux morpheus 5.8.0-50-generic #56~20.04.1-Ubuntu SMP Mon Apr 12 21:46:35 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
```

file system structure,

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
and e.g. user directory contents,

```
$ ls /home
khoeflich
```

Now, download one of the above Linux base images from Dockerhub,

```
$ docker pull ubuntu:21.04
```

start an interactive Bash session in the container,

```
$ docker run -it --rm ubuntu:21.04 bash
```

and familiarize yourself with the available software environment,

```
$ docker run -it --rm ubuntu:21.04 bash
root@131fa759eb1b:/# ls -l /
root@131fa759eb1b:/# ls /home
root@131fa759eb1b:/# cat /etc/os-release
```

Do this also for the Alpine Linux base images! What is different, what is the same?

Please note, Docker desktop on MacOS and Windows is shipped with a Linux virtual machine, that runs in the background and provides you with full Docker functionality.
Especially at Windows PowerShell, however, you can't natively run a command such as `uname`.
Can you still demonstrate the core concept of "shared Linux kernel" and "unique software environment" for a Windows machine? If so, how?

## Key points

## Next topic

The (scientific) container life cycle perspective.

