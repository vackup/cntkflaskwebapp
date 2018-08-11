FROM ubuntu:16.04
LABEL maintainer="Hernan Zaldivar test"
LABEL credits="Based on the tutorial from Mathew Salvaris"

RUN mkdir /code
WORKDIR /code
ADD . /code/
ADD etc /etc

#RUN mkdir /app
#ADD entry.sh /app/
#RUN chmod +x /app/entry.sh

RUN apt-get update 

RUN apt-get install -y --no-install-recommends \
        openmpi-bin \
        python \
        python-dev \ 
        python-setuptools \
        python-pip \
        supervisor \
        nginx && \
    rm /etc/nginx/sites-enabled/default && \
    cp /code/nginx/app /etc/nginx/sites-available/ && \
    ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/ && \
    #pip install --upgrade pip && \
    pip install https://cntk.ai/PythonWheel/CPU-Only/cntk-2.0-cp27-cp27mu-linux_x86_64.whl && \
    pip install -r /code/requirements.txt

#RUN pip install azure-storage


EXPOSE 88
CMD ["supervisord", "-c", "/etc/supervisord.conf"]