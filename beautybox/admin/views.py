from flask import render_template, request, redirect, url_for, session
from flask.ext.classy import FlaskView, route

from beautybox import app
from beautybox.utils import requires_admin_login, admin_already_loggedin
from controller import Admin

class AdminView(FlaskView):

	@route("/admin/", methods=["GET", "POST"])
	@admin_already_loggedin
	def login(self):
		""" Admin login page """
		
		error = None
		if request.method == "POST":
			admin = Admin()
			if not admin.authentication(request.form["admin_id"], request.form["password"]):
				error = "Invalid admin credentials"
			else:
				session["admin"] = True
				return redirect(url_for('AdminView:dashboard'))
		return render_template("admin_login.html", error=error)

AdminView.register(app, "/")


