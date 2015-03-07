from flask import session, redirect, url_for
from functools import wraps

def requires_login(f):
	@wraps(f)
	def decorated_function(*args, **kwargs):
		if not session.get('user'):
			return redirect(url_for('UserView:login'))
		return f(*args, **kwargs)
	return decorated_function
	
def already_loggedin(f):
	@wraps(f)
	def decorated_function(*args, **kwargs):
		if session.get('user'):
			return redirect(url_for('UserView:profile'))
		return f(*args, **kwargs)
	return decorated_function
	
def requires_admin_login(f):
	@wraps(f)
	def decorated_function(*args, **kwargs):
		if not session.get('admin'):
			return redirect(url_for('AdminView:login'))
		return f(*args, **kwargs)
	return decorated_function

def admin_already_loggedin(f):
	@wraps(f)
	def decorated_function(*args, **kwargs):
		if session.get('admin'):
			return redirect(url_for('AdminView:dashboard'))
		return f(*args, **kwargs)
	return decorated_function
	
