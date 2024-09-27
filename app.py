from flask import Flask, jsonify

app = Flask(__name__)

# Server-side counter
counter = 0

@app.route('/increment', methods=['POST'])
def increment_counter():
    global counter
    counter += 1
    return jsonify({"message": "Counter incremented"}), 200

@app.route('/counter', methods=['GET'])
def get_counter():
    global counter
    return jsonify({"counter": counter}), 200

@app.route('/')
def index():
    return app.send_static_file('index.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
