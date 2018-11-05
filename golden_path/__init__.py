from flask import Flask, jsonify
app = Flask('golden_path')

@app.route('/')
def hello():
    return jsonify({ "hello": "world" })