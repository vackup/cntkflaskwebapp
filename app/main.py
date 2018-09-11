from flask import Flask, request
import cntk
from driver import *
import time

app = Flask(__name__)


@app.route('/score', methods = ['POST'])
def scoreRRS():
    """ Endpoint for scoring
    """
    if request.headers['Content-Type'] != 'application/json':
        return Response(json.dumps({}), status= 415, mimetype ='application/json')
    input = request.json['input']
    start = time.time()
    response = run(input)
    end = time.time() - start
    dict = {}
    dict['result'] = response
    return json.dumps(dict)


@app.route("/")
def healthy():
    return "Healthy: call /loadmodel to load model manually"


# CNTK Version
@app.route('/version', methods = ['GET'])
def version_request():
    return cntk.__version__

@app.route('/loadmodel', methods = ['GET'])
def load_model():
    loadTimeMsg = init()
    return loadTimeMsg


if __name__ == "__main__":
    init()
    app.run(host='0.0.0.0') # Ignore, Development server