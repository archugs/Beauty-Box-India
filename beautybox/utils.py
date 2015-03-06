from flask import session
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
			return redirect(url_for('UserView:home'))
		return f(*args, **kwargs)
	return decorated_function
	
