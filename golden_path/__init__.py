from flask import Flask, jsonify
from roivant import Config

app = Flask(__name__)
@app.route('/')
def hello():
    config = Config("/opt/roivant/config.ini")
    return jsonify({ config["general"]["greeting"]: "world" })
