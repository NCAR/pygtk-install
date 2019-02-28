FROM ubuntu:latest 

RUN apt-get update --fix-missing && \
    apt-get install -y software-properties-common wget bzip2 ca-certificates curl git gcc g++ kmod pkg-config automake libtool && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install python-dev graphviz libgraphviz-dev libcairo2-dev python2.7 python-pip -y && \
    pip install numpy pygraphviz sphinx pyOpenSSL && \
    apt-get install python-gtk2-dev -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN echo "Checking Python package imports" && \
    python -c "import cairo, gtk, gobject"


RUN cd /opt && git clone https://github.com/cylc/cylc.git && cd cylc/bin && ./cylc check-software