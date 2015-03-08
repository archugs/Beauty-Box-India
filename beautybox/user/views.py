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
				session["user"] = request.form["email"]
				return redirect(url_for('UserView:profile'))
		return render_template("login.html", error=error)

	@route("/registration/", methods=["GET", "POST"])
	@already_loggedin
	def registration(self):
		""" New user registration page """

		error = None
		if request.method == "POST":
			if request.form["password"] != request.form["confirm_password"]:
				error = "Passwords don't match. Please try again."
			else:
				user = User(request.form["email"])
				user.register(email=request.form["email"],
					password=request.form["password"],
					name=request.form["name"],
					address=request.form["address"])
				session["user"] = request.form["email"]
				return redirect(url_for('UserView:profile'))
		return render_template("registration.html", error=error)

	@route("/subscription/", methods=["GET", "POST"])
	@requires_login
	def subscription(self):
		""" User subscription page """

		message = None
		user = User(session.get("user"))
		if request.method == "POST":
			user.subscribe(request.form["plan_type"],
				request.form["duration"])
			message = "You have been successfully subscribed to our monthly beauty box.\nYou will receive your first beauty box at the beginning of next month."
		data = user.get_subscription()
		return render_template("subscription.html", data=data, message=message)

	@route("/products/", methods=["GET", "POST"])
	@requires_login
	def products(self):
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
				skin_concerns=request.form.getlist("skin_concerns"),
				hair_concerns=request.form.getlist("hair_concerns"),
				fragrances=request.form.getlist("fragrances"),
				preferences=request.form.getlist("preferences"))
			return redirect(url_for('UserView:subscription'))
		data = user.get_profile()
		return render_template("profile.html", data=data)

	@route("/logout/", methods=["GET"])
	@requires_login
	def logout(self):
		""" Clear the session and logout the user """
		
		session.clear()
		return redirect(url_for('UserView:login'))
	
UserView.register(app, "/")
