from flask import render_template, request, redirect, url_for, session
from flask.ext.classy import FlaskView, route

from beautybox import app
from beautybox.utils import requires_login, already_loggedin
from controller import User

class UserView(FlaskView):

	@route("/login/", methods=["GET", "POST"])
	@already_loggedin
	def login(self):
		""" Login page """

		error = None
		if request.method == "POST":
			user = User(request.form["email"])
			if not user.authentication(request.form["password"]):
				error = "Invalid login credentials"
			else:
				session["user"] = user
		return render_template("login.html", error=error)

	@route("/registration/", methods=["GET", "POST"])
	@already_loggedin
	def registration(self):
		""" New user registration page """

		if request.method == "POST":
			user = User(request.form["email"])
			user.register(email=register.form["email"],
				password=request.form["password"],
				name=request.form["name"],
				address=request.form["address"])
		return render_template("registration.html")

	@route("/subscription/", methods=["GET", "POST"])
	@requires_login
	def subscription(self):
		""" User subscription page """

		user = User(session.get("user"))
		if request.method == "POST":
			user.subscribe(request.form["plan_id"],
				request.form["duration"])
		return render_template("subscription.html", data=user.subscription)

	@route("/", methods=["GET", "POST"])
	@requires_login
	def home(self):
		if request.method == "POST":
			user = User(session.get("user"))
			if "add_to_wishlist" in request.form:
				user.add_To_wishlist(request.form["product_id"])
			elif "remove_from_wishlist" in request.form:
				user.remove_from_wishlist(request.form["product_id"])
		return render_template("home.html")

	@route("/profile/", methods=["GET", "POST"])
	@requires_login
	def profile(self):
		user = User(session.get("user"))
		if request.method == "POST":
			user.add_profile(age=request.form["age"],
				gender=request.form["gender"],
				skin_type=request.form["skin_type"],
				skin_tone=request.form["skin_tone"],
				skin_sensitivity=request.form["skin_sensitivity"],
				hair_type=request.form["hair_type"],
				skin_concerns=request.form["skin_concerns"],
				hair_concerns=request.form["hair_concerns"],
				fragrances=request.form["fragrances"])
		return render_template("profile.html", data=user)

	@route("/logout/", methods=["GET"])
	@requires_login
	def logout(self):
		""" Clear the session and logout the user """
		
		session.clear()
		return redirect(url_for('UserView:login'))
	
UserView.register(app, "/")
