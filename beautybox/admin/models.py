import werkzeug.security

from sqlalchemy import Column, Integer, String, UniqueConstraint

from beautybox import db

class AdminModel(db.Model):
	""" Stores all the admin login details """

	__tablename__ = "admins"

	id = Column(Integer, primary_key=True)
	admin_id = Column(String(100), index=True)
	password_hash = Column(String(160))
	__table_args__ = (UniqueConstraint("admin_id", name="uniq_admins"),)
	
	@property
	def password(self):
		raise AttributeError("password is not a readable attribute")

	@password.setter
	def password(self, password):
		self.password_hash = werkzeug.security.generate_password_hash(password)

	def verify_password(self, password):
		""" Verify the admins's password """

		return werkzeug.security.check_password_hash(self.password_hash, password)

	def save(self):
		db.session.add(self)

	@classmethod
	def get(cls, admin_id):
		""" Gets a user object for given email """

		return cls.query.filter(cls.admin_id == admin_id).scalar()


