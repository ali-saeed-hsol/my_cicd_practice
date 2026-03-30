from flask import Flask
import datetime
import os

app = Flask(__name__)

@app.route('/')
def hello():
    now = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    return f"<h1>Hello from Docker!</h1><p>The current time is: {now}</p>"

if __name__ == "__main__":
    # We use 0.0.0.0 so the app is accessible outside the container
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)