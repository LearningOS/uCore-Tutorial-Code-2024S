# Makefile
  
SHELL := /bin/bash

DOCKER_NAME ?= uCore-RV-64-Base
DIR := workplace

run: test

test: test1 test2

lab1: test3

lab2: test4

lab3: test5

lab4: test6 test7

lab5: test8


test1:
	git fetch
	git checkout ch1
	make run

test2:
	git fetch
	git checkout ch2
	make test BASE=1
	
test3:
	git fetch
	git checkout ch3
	make test BASE=1
	
test4:
	git fetch
	git checkout ch4
	make test BASE=1
	
test5:
	git fetch
	git checkout ch5
	make test BASE=1

test6:
	git fetch
	git checkout ch6
	make test BASE=1
	
test7:
	git fetch
	git checkout ch7
	make test BASE=1
	
test8:
	git fetch
	git checkout ch8 
	make test BASE=1

clean:
	rm -rf ${DIR}

docker:
	docker pull nzpznk/oslab-c-env
	docker run -it --name ${DOCKER_NAME} ${DOCKER_IMAGE_NAME} /bin/bash


setclassroom: setclassroom1 setclassroom2 setclassroom3 setclassroom4 setclassroom5 setclassroom6 setclassroom7 setclassroom8

setclassroom1:
	git checkout ch1
	git clone https://github.com/uCore-RV-64/uCore-RV-64-conf.git cr-scripts
	#git checkout master -- scripts/classroom.yml
	#git checkout master -- scripts/autograding0.json
	mkdir -p .github/workflows
	mkdir -p .github/classroom
	touch .github/.keep
	cp cr-scripts/classroom.yml .github/workflows/classroom.yml
	cp cr-scripts/autograding0.json .github/classroom/autograding.json
	git add .github/.keep
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml
	#git commit -m"update classroom.yml .keep for classroom CI test"
	#git push

setclassroom2:
	git checkout ch2
	git clone https://github.com/uCore-RV-64/uCore-RV-64-conf.git cr-scripts
	mkdir -p .github/workflows
	mkdir -p .github/classroom
	touch .github/.keep
	cp cr-scripts/classroom.yml .github/workflows/classroom.yml
	cp cr-scripts/autograding1.json .github/classroom/autograding.json
	git add .github/.keep
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml

setclassroom3:
	git checkout ch3
	git clone https://github.com/uCore-RV-64/uCore-RV-64-conf.git cr-scripts
	mkdir -p .github/workflows
	mkdir -p .github/classroom
	touch .github/.keep
	cp cr-scripts/classroom.yml .github/workflows/classroom.yml
	cp cr-scripts/autograding1.json .github/classroom/autograding.json
	git add .github/.keep
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml
	
setclassroom4:
	git checkout ch4
	git clone https://github.com/uCore-RV-64/uCore-RV-64-conf.git cr-scripts
	mkdir -p .github/workflows
	mkdir -p .github/classroom
	touch .github/.keep
	cp cr-scripts/classroom.yml .github/workflows/classroom.yml
	cp cr-scripts/autograding1.json .github/classroom/autograding.json
	git add .github/.keep
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml

setclassroom5:
	git checkout ch5
	git clone https://github.com/uCore-RV-64/uCore-RV-64-conf.git cr-scripts
	mkdir -p .github/workflows
	mkdir -p .github/classroom
	touch .github/.keep
	cp cr-scripts/classroom.yml .github/workflows/classroom.yml
	cp cr-scripts/autograding1.json .github/classroom/autograding.json
	git add .github/.keep
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml

setclassroom6:
	git checkout ch6
	git clone https://github.com/uCore-RV-64/uCore-RV-64-conf.git cr-scripts
	mkdir -p .github/workflows
	mkdir -p .github/classroom
	touch .github/.keep
	cp cr-scripts/classroom.yml .github/workflows/classroom.yml
	cp cr-scripts/autograding1.json .github/classroom/autograding.json
	git add .github/.keep
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml

setclassroom7:
	git checkout ch7
	git clone https://github.com/uCore-RV-64/uCore-RV-64-conf.git cr-scripts
	mkdir -p .github/workflows
	mkdir -p .github/classroom
	touch .github/.keep
	cp cr-scripts/classroom.yml .github/workflows/classroom.yml
	cp cr-scripts/autograding1.json .github/classroom/autograding.json
	git add .github/.keep
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml

setclassroom8:
	git checkout ch8
	git clone https://github.com/uCore-RV-64/uCore-RV-64-conf.git cr-scripts
	mkdir -p .github/workflows
	mkdir -p .github/classroom
	touch .github/.keep
	cp cr-scripts/classroom.yml .github/workflows/classroom.yml
	cp cr-scripts/autograding1.json .github/classroom/autograding.json
	git add .github/.keep
	git add .github/classroom/autograding.json
	git add .github/workflows/classroom.yml

# for local ubuntu with zsh shell SHELL, need root for sudo 
ubuntu_setenv:
	cd ${HOME} && sudo wget https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.08/riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14.tar.gz
	cd ${HOME} && sudo tar xzf riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14.tar.gz
	cd ${HOME} && sudo mv riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14 riscv64-unknown-elf-gcc
	cd ${HOME} && sudo wget -O riscv64-linux-musl-cross.tgz https://cloud.tsinghua.edu.cn/f/b07bac9bcfa14f1dae66/?dl=1
	cd ${HOME} && sudo tar xzf riscv64-linux-musl-cross.tgz
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
		      zlib1g-dev libexpat-dev pkg-config  libglib2.0-dev libpixman-1-dev git tmux python3
	cd ${HOME} && sudo wget https://download.qemu.org/qemu-5.0.0.tar.xz
	cd ${HOME} && sudo tar xJf qemu-5.0.0.tar.xz
	cd ${HOME}/qemu-5.0.0 && sudo ./configure --target-list=riscv64-softmmu,riscv64-linux-user
	cd ${HOME}/qemu-5.0.0 && sudo make -j$$(nproc)
	cd ${HOME}/qemu-5.0.0 && sudo make install
	sudo echo export PATH=\"\$${HOME}/qemu-5.0.0:\$$PATH\" >> ~/.bashrc
	sudo echo export PATH=\"\$${HOME}/qemu-5.0.0/riscv64-softmmu:\$$PATH\" >> ~/.bashrc
	sudo echo export PATH=\"\$${HOME}/qemu-5.0.0/riscv64-linux-user:\$$PATH\" >> ~/.bashrc
	source ~/.bashrc
	qemu-system-riscv64 --version
	qemu-riscv64 --version


# for github codespaces ubuntu with zsh SHELL, need root for sudo
codespaces_setenv:	
	cd ${HOME} && sudo wget https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.08/riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14.tar.gz
	cd ${HOME} && sudo tar xzf riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14.tar.gz
	cd ${HOME} && sudo mv riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14 riscv64-unknown-elf-gcc
	cd ${HOME} && sudo wget -O riscv64-linux-musl-cross.tgz https://cloud.tsinghua.edu.cn/f/b07bac9bcfa14f1dae66/?dl=1
	cd ${HOME} && sudo tar xzf riscv64-linux-musl-cross.tgz
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
		      zlib1g-dev libexpat-dev pkg-config  libglib2.0-dev libpixman-1-dev git tmux python3
	cd ${HOME} && sudo wget https://download.qemu.org/qemu-5.0.0.tar.xz
	cd ${HOME} && sudo tar xJf qemu-5.0.0.tar.xz
	cd ${HOME}/qemu-5.0.0 && sudo ./configure --target-list=riscv64-softmmu,riscv64-linux-user
	cd ${HOME}/qemu-5.0.0 && sudo make -j$$(nproc)
	cd ${HOME}/qemu-5.0.0 && sudo make install
	sudo echo export PATH=\"\$${HOME}/qemu-5.0.0:\$$PATH\" >> ~/.bashrc
	sudo echo export PATH=\"\$${HOME}/qemu-5.0.0/riscv64-softmmu:\$$PATH\" >> ~/.bashrc
	sudo echo export PATH=\"\$${HOME}/qemu-5.0.0/riscv64-linux-user:\$$PATH\" >> ~/.bashrc
	source ~/.bashrc
	qemu-system-riscv64 --version
	qemu-riscv64 --version
