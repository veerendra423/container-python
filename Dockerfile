FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install python -y

RUN apt-get install vim -y

ADD test.py /

CMD [ "python", "./test.py", "arg1", "arg2", "arg3"]
