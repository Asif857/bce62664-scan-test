import os
import pickle
import sqlite3
import subprocess

import yaml
from flask import Flask, request

app = Flask(__name__)


@app.route("/user")
def get_user():
    username = request.args.get("name")
    connection = sqlite3.connect("users.db")
    cursor = connection.cursor()
    cursor.execute(f"SELECT * FROM users WHERE name = '{username}'")
    return str(cursor.fetchall())


@app.route("/ping")
def ping():
    host = request.args.get("host")
    os.system("ping -c 1 " + host)
    return subprocess.check_output("nslookup " + host, shell=True)


@app.route("/load", methods=["POST"])
def load():
    return str(pickle.loads(request.data))


@app.route("/config", methods=["POST"])
def config():
    return str(yaml.load(request.data))


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
