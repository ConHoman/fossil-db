from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return  "Fossil collection coming soon"

if __name__ == "__main__":
    app.run(debug=True)
