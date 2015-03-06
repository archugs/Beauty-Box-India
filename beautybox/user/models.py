import werkzeug.security

from sqlalchemy import Column, Integer, String, DateTime, UniqueConstraint, ForeignKey, Enum
from sqlalchemy.orm import relationship

from beautybox import db
import beautybox.beauty.models
import beautybox.product.models
import beautybox.subscription.models

class UserModel(db.Model):
	""" Stores all the users login details """

	__tablename__ = "users"

	id = Column(Integer, primary_key=True)
	email = Column(String(100), index=True)
	password_hash = Column(String(32))
	name = Column(String(50))
	address = Column(String(500))
	timestamp = Column(DateTime)
	__table_args__ = (UniqueConstraint("email", name="uniq_users"),)

	@property
	def password(self):
		raise AttributeError("password is not a readable attribute")

	@password.setter
	def password(self, password):
		self.password_hash = werkzeug.security.generate_password_hash(password)

	def verify_password(self, password):
		""" Verify the user's password """

		return werkzeug.security.check_password_hash(self.password_hash, password)

	def save(self):
		db.session.add(self)

	@classmethod
	def get(cls, email):
		""" Gets a user object for given email """

		return cls.query.filter(cls.email == email).scalar()

class UserProfileModel(db.Model):
	""" Stores the users beauty profiles """

	__tablename__ = "users_profile"

	id = Column(Integer, primary_key=True)
	user_id = Column(Integer, ForeignKey("users.id"), index=True)
	user = relationship("UserModel", backref="profile")
	age = Column(Integer)
	gender = Column(Enum("M", "F", name="gender_types"))
	skin_type = Column(Enum("oily", "combination", "normal", "dry", name="skin_types"))
	skin_tone = Column(Enum("light", "fair", "medium", "olive", "brown", "black", name="skin_tones"))
	skin_sensitivity = Column(Enum("high", "medium", "low", name="skin_sensitivity"))
	hair_type = Column(Enum("oily", "normal", "dry", name="hair_types"))
	__table_args__ = (UniqueConstraint("user_id", name="uniq_usersprofile"),)

	def save(self):
		db.session.add(self)

	@classmethod
	def get(cls, user_id):
		return cls.query.filter(cls.user_id == user_id).scalar()
	
class UserSkinConcernsModel(db.Model):
	""" Stores the skin concerns of each user """

	__tablename__ = "users_skinconcerns"

	id = Column(Integer, primary_key=True)
	user_id = Column(Integer, ForeignKey("users.id"), index=True)
	user = relationship("UserModel", backref="skinconcerns")
	skin_concerns_id = Column(Integer, ForeignKey("beauty_concerns.id"))
	skin_concerns = relationship("BeautyConcernsModel")
	
	def save(self):
		db.session.add(self)
		
	@classmethod
	def delete(cls, user_id):
		cls.query.filter(cls.user_id == user_id).delete()

class UserHairConcernsModel(db.Model):
	""" Stores the hair concerns of each user """

	__tablename__ = "users_hairconcerns"

	id = Column(Integer, primary_key=True)
	user_id = Column(Integer, ForeignKey("users.id"), index=True)
	user = relationship("UserModel", backref="hairconcerns")
	hair_concerns_id = Column(Integer, ForeignKey("beauty_concerns.id"))
	hair_concerns = relationship("BeautyConcernsModel")	

	def save(self):
		db.session.add(self)
		
	@classmethod
	def delete(cls, user_id):
		cls.query.filter(cls.user_id == user_id).delete()

class UserFragrancesModel(db.Model):
	""" Stores the users preferences of fragrances/scents/perfumes """

	__tablename__ = "users_fragrances"

	id = Column(Integer, primary_key=True)
	user_id = Column(Integer, ForeignKey("users.id"), index=True)
	user = relationship("UserModel", backref="scents")
	fragrances_id = Column(Integer, ForeignKey("fragrances.id"))
	fragrances = relationship("FragrancesModel")
	
	def save(self):
		db.session.add(self)
		
	@classmethod
	def delete(cls, user_id):
		cls.query.filter(cls.user_id == user_id).delete()

class UserWishlistModel(db.Model):
	""" Stores the user's wishlist """

	___tablename__ = "users_wishlist"


	id = Column(Integer, primary_key=True)
	user_id = Column(Integer, ForeignKey("users.id"), index=True)
	user = relationship("UserModel", backref="wishlist")
	product_id = Column(Integer, ForeignKey("products.id"))
	product = relationship("ProductModel")

	def save(self):
		db.session.add(self)
		
	def delete(self):
		db.session.delete(self)

	@classmethod
	def get(cls, user_id, product_id):
		return cls.query.filter(cls.user_id == user_id,
			cls.product_id == product_id).scalar()

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

	def save(self):
		db.session.add(self)

def commit():
	db.session.commit()
