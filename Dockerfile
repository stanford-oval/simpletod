FROM nvidia/cuda:10.2-runtime-ubuntu18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
            git \
            ssh \
            build-essential \
            locales \
            ca-certificates \
            curl \
            unzip \
            vim \
            wget \
            tmux \
            screen \
            pciutils \
            python3 python3-pip python3-wheel python3-setuptools swig python3-dev

# Default to utf-8 encodings in python
# Can verify in container with:
# python -c 'import locale; print(locale.getpreferredencoding(False))'
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


RUN pip3 install torch
#RUN pip3 install faiss-gpu
RUN pip3 install tensorboard nltk numpy tqdm
RUN pip3 install sacrebleu transformers
RUN pip3 install gsutil
RUN pip3 install ipdb
RUN pip3 install spacy
RUN pip3 install transformers
RUN pip3 install boto3
RUN pip3 install tqdm
RUN pip3 install awscli
RUN python3 -m spacy download --user en_core_web_sm
RUN pip3 install tensorboardX

COPY . /opt/simpletod
WORKDIR /opt/simpletod

CMD bash
