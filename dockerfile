
FROM ubuntu:16.04
##LABEL key="value"

RUN mkdir /code
WORKDIR /code
ADD . /code/
ADD etc /etc

RUN apt-get update
RUN apt-get install -y --no-install-recommends software-properties-common
RUN add-apt-repository ppa:jonathonf/python-3.6

RUN apt-get update && apt-get install -y --no-install-recommends \
        openmpi-bin \
        python3.6 \ 
        python3.6-dev \ 
        python3-setuptools \
        python3-pip \
        supervisor \
        nginx && \
    rm /etc/nginx/sites-enabled/default && \
    cp /code/nginx/app /etc/nginx/sites-available/ && \
    ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/ 

# update pip
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel

RUN pip install https://cntk.ai/PythonWheel/CPU-Only/cntk-2.5.1-cp36-cp36m-linux_x86_64.whl && \
    pip install -r /code/requirements.txt

EXPOSE 88
CMD ["supervisord", "-c", "/etc/supervisord.conf"]