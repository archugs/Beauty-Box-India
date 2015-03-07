import os
from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy

tmpl_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), '../templates')
static_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), '../static')

app = Flask(__name__, template_folder=tmpl_dir, static_folder=static_dir)
app.config.from_object('beautybox.configurations')

db = SQLAlchemy(app)

# Import the views
import beautybox.user.views
import beautybox.admin.views

