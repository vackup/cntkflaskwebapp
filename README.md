# cntkflaskwebapp

Docker container that runs a flaskwebapp that evaluates a restnet 150 model using CNTK. Based on https://github.com/Azure/ACS-Deployment-Tutorial

This container now uses the "tiangolo/uwsgi-nginx-flask:python3.6" image (https://github.com/tiangolo/uwsgi-nginx-flask-docker). Docker image with uWSGI and Nginx for Flask applications in Python running in a single container. Optionally with Alpine Linux.

Download the model, rename it to ResNet_152.model and copy it to the app folder. 
- Version used in this app: https://1drv.ms/u/s!AkSFtNKJBDmNhpxqehFXBCMFSvnU-Q 
- New verions: https://www.cntk.ai/Models/CNTK_Pretrained/ResNet152_ImageNet_CNTK.model

As I'm pretty new with docker, to init the model call http://yourserver/loadmodel (i'm trying to figure out how to load it the app inits, any help is appreciated). Then you can start testing it calling the score method (POST to http://youserver/score)
