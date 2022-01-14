FROM python:3.8

RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    && apt-get -y install git iproute2 procps lsb-release gdb\
    && apt-get install -y sudo wget curl vim

RUN cd /tmp \
    && git clone https://github.com/atcoder/ac-library.git \
    && git clone https://github.com/gghatano/atcoder-env-cpp

RUN pip3.8 install atcoder-tools

RUN mkdir -p /root/.atcodertools/template 
RUN mkdir -p /root/atcoder-workspace

RUN echo 'asub="atcoder-tools submit -f -u"'
RUN echo 'alias atest="g++ -Wfatal-errors --std=c++17 -I /tmp/ac-library main.cpp ; atcoder-tools test"' >> /root/.bashrc

RUN echo 'alias agen="atcoder-tools gen --without-login --template /root/.atcodertools/template/template.cpp"' >> /root/.bashrc
RUN echo 'alias agenlogin="atcoder-tools gen --template /root/.atcodertools/template/template.cpp"' >> /root/.bashrc
RUN echo 'alias asub="atcoder-tools submit -u"' >> /root/.bashrc

RUN cat /tmp/atcoder-env-cpp/template.cpp > /root/.atcodertools/template/template.cpp
RUN cat /tmp/atcoder-env-cpp/algorithm.cpp > /root/atcoder-workspace/algorithm.cpp

CMD ["/bin/bash"]
