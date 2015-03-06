import werkzeug.security

from sqlalchemy import Column, Integer, String, DateTime, UniqueConstraint, ForeignKey
from sqlalchemy.orm import relationship

from beautybox import db

class UserModel(db.Model):
	""" Stores all the users login details """

	__tablename__ = "users"

	id = Column(Integer, primary_key=True)
	email = Column(String(100), index=True)
	password_hash = Column(String(32))
	name = Column(String(50))
	timestamp = Column(DateTime)
	__table_args__ = (UniqueConstraint("email", name="uniq_users"),)

	@property
	def password(self):
		raise AttributeError("password is not a readable attribute")

	@password.setter
	def password(self, password):
		self.password_hash = werkzeug.security.generate_password_hash(password)

	def verify_password(self, password):
		return werkzeug.security.check_password_hash(self.password_hash, password)

class UserProfileModel(db.Model):
	""" Stores the users beauty profiles """

	__tablename__ = "users_profile"

	id = Column(Integer, primary_key=True)
	user_id = Column(Integer, ForeignKey("users.id"), index=True)
	user = relationship("UserModel", backref="profile")
	age = Column(Integer)
	gender = Column(Enum("M", "F", name="gender_types"))
	skin_type = Column(Enum("oily", "combination", "normal", "dry"))
	skin_tone = Column(Enum("light", "fair", "medium", "olive", "brown", "black"))
	skin_sensitivity = Column(Enum("high", "medium", "low"))
	hair_type = Column(Enum("oily", "normal", "dry"))
	__table_args__ = (UniqueConstraint("user_id", name="uniq_usersprofile"),)
	
class UserSkinConcernsModel(db.Model):
	""" Stores the skin concerns of each user """

	__tablename__ = "users_skinconcerns"

	id = Column(Integer, primary_key=True)
	user_id = Column(Integer, ForeignKey("users.id"), index=True)
	user = relationship("UserModel", backref="skinconcerns")
	skin_concerns_id = Column(Integer, ForeignKey("beauty_concerns.id"))
	skin_concerns = relationship("BeautyConcernsModel")

class UserHairConcernsModel(db.Model):
	""" Stores the hair concerns of each user """

	__tablename__ = "users_hairconcerns"

	id = Column(Integer, primary_key=True)
	user_id = Column(Integer, ForeignKey("users.id"), index=True)
	user = relationship("UserModel", backref="hairconcerns")
	hair_concerns_id = Column(Integer, ForeignKey("beauty_concerns.id"))
	hair_concerns = relationship("BeautyConcernsModel")

class UserFragrancesModel(db.Model):
	""" Stores the users preferences of fragrances/scents/perfumes """

	__tablename__ = "users_fragrances"

	id = Column(Integer, primary_key=True)
	user_id = Column(Integer, ForeignKey("users.id"), index=True)
	user = relationship("UserModel", backref="scents")
	fragrances_id = Column(Integer, ForeignKey("fragrances.id"))
	fragrances = relationship("FragrancesModel")

class UserWishlistModel(db.Model):
	""" Stores the user's wishlist """

	___tablename__ = "users_wishlist"


	id = Column(Integer, primary_key=True)
	user_id = Column(Integer, ForeignKey("users.id"), index=True)
	user = relationship("UserModel", backref="wishlist")
	product_id = Column(Integer, ForeignKey("products.id"))
	product = relationship("ProductModel")

class UserSubscriptionModel(db.Model):
	""" Stores the subscription plan that the user has opted for """

	___tablename__ = "users_subscription"


	id = Column(Integer, primary_key=True)
	user_id = Column(Integer, ForeignKey("users.id"), index=True)
	user = relationship("UserModel", backref="subscription")
	subscription_id = Column(Integer, ForeignKey("subscriptions.id"))
	subscription = relationship("SubscriptionModel")
	# duration is in months
	duration = Column(Integer)
	timestamp = Column(DateTime)

