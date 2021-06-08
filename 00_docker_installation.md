# Docker installation

This course will have a mixture of lecture-style, hands-on and discussion parts.
Please install Docker on your Linux, MacOS or Windows machine in advance, if you want to follow the hands-on parts yourself.

While this is not mandatory (as we will also do a demo of the exercises) we would highly advise you to prepare Docker on your machine, especially if you already intend to try out containers for one of your scientific projects.
By installing Docker in advance, you will have two things at the end of the course: (1) a fully working container build environment (that will also be able to build Singularity container images!), as well as (2) hands-on experience in specifying, building, and running Docker container images (and a good idea on how to do that with Singularity).

## Instructions

For Linux install Docker CE,

* https://docs.docker.com/engine/install/#server

(To receive updates to your Docker installation, please setup and install Docker CE via the Docker package repository for your Linux distribution as described for e.g. Ubuntu here: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)

For MacOS install Docker desktop,

* https://docs.docker.com/docker-for-mac/install/#install-and-run-docker-desktop-on-mac

For Windows also install Docker desktop,

* https://docs.docker.com/docker-for-windows/install/#install-docker-desktop-on-windows

(Consider **not** to choose the WSL2-backend during the installation, but to go for the default Hyper-V backend. WSL2 is a bit more complex to setup and can also be added at a later point.)

Please note, there won't be time to discuss problems with installing Docker during the beginning of the course.
Please also note, you will need administrator privileges on your machine to successfully install Docker.
Contact your computer's administrator if you don't have the appropriate rights on your computer.

Also, during the hands-on part of the course it is helpful to have a text editor suitable for coding available.
This could be a terminal application such as "vim" or a GUI tool such as "VS Code" (https://code.visualstudio.com/Download).

## Questions

> Why is Docker used for this course, if on the big machines I have only seen Singularity to be available?

Containers are a very helpful technology that simplifies the deployment (and portability) aspect associated with any software.
The Singularity image build and Singularity container run functionality is only available on Linux systems, though.
Docker container images, on the other hand, work across Linux, MacOS and Windows machines.
Furthermore, they can be converted into Singularity container images very easily.
As there is often also no way of building Singularity container images directly on the machines where they will be used (at least in practice!) we during our daily work almost exclusively use scientific workflows in which a container image is specified in Docker and then converted to a Singularity image, which can then be used on a workstation that only has Singularity available.
How to do this, will also be part of the course.
