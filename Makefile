# Makefile
  
SHELL := /bin/bash

DOCKER_NAME ?= uCore-RV-64-Base
DIR := workplace

clean:
	rm -rf ${DIR}

docker:
	docker pull nzpznk/oslab-c-env
	docker run -it --name ${DOCKER_NAME} ${DOCKER_IMAGE_NAME} /bin/bash


# for local ubuntu with zsh shell SHELL, need root for sudo 
ubuntu_setenv:
	cd ${HOME} && sudo wget https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.08/riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14.tar.gz
	cd ${HOME} && sudo tar xzf riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14.tar.gz
	cd ${HOME} && sudo mv riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14 riscv64-unknown-elf-gcc
	cd ${HOME} && sudo git clone https://github.com/os-lecture/toolchain-riscv64-linux-musl-cross.git riscv64-linux-musl-cross
	#cd ${HOME} && sudo wget -O riscv64-linux-musl-cross.tgz https://cloud.tsinghua.edu.cn/f/11646b3c420d4055ba20/?dl=1
	#cd ${HOME} && sudo tar xzf riscv64-linux-musl-cross.tgz
	#sudo echo export PATH=\"\$$HOME/riscv64-unknown-elf-gcc/bin:\$$PATH\" >>  ~/.bashrc
	#sudo echo export PATH=\"\$$HOME/riscv64-linux-musl-cross/bin:\$$PATH\" >> ~/.bashrc
	#source ~/.bashrc  
	sudo ln -s $$HOME/riscv64-unknown-elf-gcc/bin/* /usr/bin/
	sudo ln -s $$HOME/riscv64-linux-musl-cross/bin/* /usr/bin/
	sudo apt install -y cmake
	sudo apt update -y
	sudo apt upgrade -y
	sudo apt install -y autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev \
		      gawk build-essential bison flex texinfo gperf libtool patchutils bc \
		      zlib1g-dev libexpat-dev pkg-config  libglib2.0-dev libpixman-1-dev git tmux python3 ninja-build
	cd ${HOME} && sudo wget https://download.qemu.org/qemu-7.0.0.tar.xz
	cd ${HOME} && sudo tar xJf qemu-7.0.0.tar.xz
	cd ${HOME}/qemu-7.0.0 && sudo ./configure --target-list=riscv64-softmmu,riscv64-linux-user
	cd ${HOME}/qemu-7.0.0 && sudo make -j$$(nproc)
	cd ${HOME}/qemu-7.0.0 && sudo make install
	sudo echo export PATH=\"\$${HOME}/qemu-7.0.0:\$$PATH\" >> ~/.bashrc
	sudo echo export PATH=\"\$${HOME}/qemu-7.0.0/riscv64-softmmu:\$$PATH\" >> ~/.bashrc
	sudo echo export PATH=\"\$${HOME}/qemu-7.0.0/riscv64-linux-user:\$$PATH\" >> ~/.bashrc
	source ~/.bashrc
	qemu-system-riscv64 --version
	qemu-riscv64 --version


# for github codespaces ubuntu with zsh SHELL, need root for sudo
codespaces_setenv:	
	cd ${HOME} && sudo wget https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.08/riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14.tar.gz
	cd ${HOME} && sudo tar xzf riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14.tar.gz
	cd ${HOME} && sudo mv riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14 riscv64-unknown-elf-gcc
	cd ${HOME} && sudo git clone https://github.com/os-lecture/toolchain-riscv64-linux-musl-cross.git riscv64-linux-musl-cross
	#cd ${HOME} && sudo wget -O riscv64-linux-musl-cross.tgz https://cloud.tsinghua.edu.cn/f/11646b3c420d4055ba20/?dl=1
	#cd ${HOME} && sudo tar xzf riscv64-linux-musl-cross.tgz
	#sudo echo export PATH=\"\$$HOME/riscv64-unknown-elf-gcc/bin:\$$PATH\" >>  ~/.bashrc
	#sudo echo export PATH=\"\$$HOME/riscv64-linux-musl-cross/bin:\$$PATH\" >> ~/.bashrc
	#source ~/.bashrc  
	sudo ln -s $$HOME/riscv64-unknown-elf-gcc/bin/* /usr/bin/
	sudo ln -s $$HOME/riscv64-linux-musl-cross/bin/* /usr/bin/
	sudo apt install -y cmake
	sudo apt update -y
	sudo apt upgrade -y
	sudo apt install -y autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev \
		      gawk build-essential bison flex texinfo gperf libtool patchutils bc \
		      zlib1g-dev libexpat-dev pkg-config  libglib2.0-dev libpixman-1-dev git tmux python3 ninja-build
	cd ${HOME} && sudo wget https://download.qemu.org/qemu-7.0.0.tar.xz
	cd ${HOME} && sudo tar xJf qemu-7.0.0.tar.xz
	cd ${HOME}/qemu-7.0.0 && sudo ./configure --target-list=riscv64-softmmu,riscv64-linux-user
	cd ${HOME}/qemu-7.0.0 && sudo make -j$$(nproc)
	cd ${HOME}/qemu-7.0.0 && sudo make install
	sudo echo export PATH=\"\$${HOME}/qemu-7.0.0:\$$PATH\" >> ~/.bashrc
	sudo echo export PATH=\"\$${HOME}/qemu-7.0.0/riscv64-softmmu:\$$PATH\" >> ~/.bashrc
	sudo echo export PATH=\"\$${HOME}/qemu-7.0.0/riscv64-linux-user:\$$PATH\" >> ~/.bashrc
	source ~/.bashrc
	qemu-system-riscv64 --version
	qemu-riscv64 --version
