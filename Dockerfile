FROM hernanzaldivar/cntkflaskwebappbase:394

#debugger
#EXPOSE 5678
#RUN pip3 install ptvsd==3.0.0

# Add demo app
COPY ./app /app
WORKDIR /app

RUN apt-get update

## update pip
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel

# install requirements
RUN pip install -r /app/requirements.txt

ENV LISTEN_PORT=88
EXPOSE 88
