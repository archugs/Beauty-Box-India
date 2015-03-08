import os, sys, logging
from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy

tmpl_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), '../templates')
static_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), '../static')

app = Flask(__name__, template_folder=tmpl_dir, static_folder=static_dir)
app.config.from_object('beautybox.configurations')

app.logger.addHandler(logging.StreamHandler(sys.stdout))
app.logger.setLevel(logging.ERROR)
db = SQLAlchemy(app)

# Import the views
import beautybox.user.views
import beautybox.admin.views

if __name__ == "__main__":
	app.debug = True
	port = int(os.environ.get("PORT", 5000))
	app.run(port=port)


