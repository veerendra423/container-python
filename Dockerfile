#Download base image ubuntu 18.04

FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update && apt-get install -y apt-utils && apt-get install -y curl

#ADD dra_img / 

#ADD r1202_16.onnx /

ADD time.sh /

RUN ./time.sh && apt-get install python3 -y && apt-get install python3-pip -y 

RUN apt-get install libjpeg-dev zlib1g-dev -y 

RUN pip3 install Pillow

ADD Ambarella_Toolchain_CNNGen_2.1.9_20200428.tar.xz /

RUN sed -e s/sudo//g -i /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04 && export MYTEST=/usr/local && sed -i '6s/^/ANSWER=y\n/' /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04 && sed -i '7s/^/TOOLCHAIN=$MYTEST\n/' /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04 && sed -i '8s/^/CAFFE_ANS=y\n/' /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04 && sed -i '9s/^/TF_ANS=y\n/' /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04 && sed -i '10s/^/ONNX_ANS=y\n/' /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04

#ANSWER
RUN sed '29s/.*/#read ANSWER/' /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04 >> /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04-updated && mv /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04-updated /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04
#TOOLCHAIN
RUN sed '40s/.*/ANSWER=$TOOLCHAIN/' /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04 >> /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04-updated && mv /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04-updated /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04
#44ANSWER
RUN sed '49s/.*/ANSWER=y/' /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04 >> /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04-updated && mv /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04-updated /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04
#CAFFE_ANS
RUN sed '62s/.*/#read CAFFE_ANS/' /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04 >> /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04-updated && mv /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04-updated /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04
#TF_ANS
RUN sed '71s/.*/#read TF_ANS/' /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04 >> /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04-updated && mv /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04-updated /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04
#ONNX_ANS
RUN sed '81s/.*/#read ONNX_ANS/' /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04 >> /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04-updated && mv /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04-updated /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ubuntuToolChain-2.1.9-20200428.ubuntu-18.04

RUN chown -R root:root /Ambarella_Toolchain_CNNGen_2.1.9_20200428 && cd /Ambarella_Toolchain_CNNGen_2.1.9_20200428/Ubuntu-18.04/ && chmod +x ubuntuToolChain-2.1.9-20200428.ubuntu-18.04 && bash ubuntuToolChain-2.1.9-20200428.ubuntu-18.04 
RUN pip3 install scikit-image==0.17.2 && pip3 install numpy==1.18.5 
RUN cd /

ADD start.sh /

RUN chmod +x /start.sh

#RUN ./start.sh

