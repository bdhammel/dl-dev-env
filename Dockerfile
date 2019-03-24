FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

MAINTAINER Ben

ENV TZ=US
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt install -y \
        software-properties-common \
        x11-apps \
        vim-gtk \
        wget \
        curl \
        htop \
        tmux \
        protobuf-compiler \
        git

# Install Python3.6
RUN add-apt-repository ppa:jonathonf/python-3.6 && apt-get update && \
    apt install -y python3.6-dev python3-tk python3-distutils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 0 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.6 0

RUN curl https://bootstrap.pypa.io/get-pip.py | python3

# Install core python packages
RUN pip --no-cache-dir install \
        Cython \
        Pillow \
        pygments \
        six \
        sphinx \
        wheel \
        numpy \
        scipy \
        scikit-learn \
        matplotlib \
        flake8 \
        pytest \
        ipython

# Install Deep Learning environment
RUN pip --no-cache-dir install \
        https://download.pytorch.org/whl/cu100/torch-1.0.1.post2-cp36-cp36m-linux_x86_64.whl \
        torchvision \ 
        tensorflow \
        keras

# Expose Ports for TensorBoard (6006), Ipython (8888)
EXPOSE 6006 8888

WORKDIR "/root"
CMD ["/bin/bash"]

# Set up environment
RUN cd ~ && git clone https://github.com/bdhammel/dotfiles.git && "./dotfiles/makesymlinks.sh"
RUN bash -c 'vim -T dumb -n -i NONE -es -S <(echo -e "silent! PluginInstall qall!")'
RUN echo 'export PS1="\[\e[38;5;33m\](DOCKER) \[\e[38;5;64m\]\W\e[00m\] $ "' >> ~/.bashrc
