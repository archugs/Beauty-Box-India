from sqlalchemy import Column, Integer, String, Float, DateTime, Boolean, UniqueConstraint, ForeignKey, Enum
from sqlalchemy.orm import relationship

from beautybox import db

class ProductModel(db.Model):
	""" Stores all the products info """

	__tablename__ = "products"

	id = Column(Integer, primary_key=True)
	name = Column(String(100), index=True)
	description = Column(String(500))
	product_type = Column(Enum("makeup", "skincare", "haircare", "fragrance", name="products_types"))
	product_category = Column(String(20))
	price = Column(Float)
	quantity = Column(Float)
	quantity_units = Column(String(10))
	timestamp = Column(DateTime)
	# whether product is sample sized or regular sized
	sample = Column(Boolean)
	__table_args__ = (UniqueConstraint("name", name="uniq_products"),)

	@classmethod
	def get_all(cls):
		""" Fetches list of all the products """
		return cls.query.all()

class ProductsProfileModel(db.Model):
	""" Stores the product characteristics """

	__tablename__ = "products_profile"

	id = Column(Integer, primary_key=True)
	product_id = Column(Integer, ForeignKey("products.id"), index=True)
	product = relationship("ProductModel", backref="profile")
	# for which age group the product is suitable
	age = Column(Integer)
	# for which gender is the product suitable
	gender = Column(Enum("M", "F", "unisex", name="product_gender_types"))
	skin_type = Column(Enum("oily", "combination", "normal", "dry", "all", name="product_skin_types"))
	skin_tone = Column(Enum("light", "fair", "medium", "olive", "brown", "black", "all", name="product_skin_tones"))
	skin_sensitivity = Column(Enum("high", "medium", "low", name="product_skin_sensitivity"))
	hair_type = Column(Enum("oily", "normal", "dry", "all", name="product_hair_types"))
	fragrance_id = Column(Integer, ForeignKey("fragrances.id"))
	fragrance = relationship("FragrancesModel")
	__table_args__ = (UniqueConstraint("product_id", name="uniq_productprofile"),)

class ProductConcernsModel(db.Model):
	""" Stores all the skin/hair concerns that a product addresses or claims to solve """

	__tablename__ = "products_concerns"

	id = Column(Integer, primary_key=True)
	product_id = Column(Integer, ForeignKey("products.id"), index=True)
	product = relationship("ProductModel", backref="product_concerns")
	concerns_id = Column(Integer, ForeignKey("beauty_concerns.id"))
	concerns = relationship("BeautyConcernsModel")

class ProductSubscriptionModel(db.Model):
	""" Stores which subscription plan type each product belongs to.
		A product can belong to more than one plan type.
	"""

	__tablename__ = "products_subscription"

	id = Column(Integer, primary_key=True)
	product_id = Column(Integer, ForeignKey("products.id"), index=True)
	product = relationship("ProductModel", backref="subscriptions")
	subscription_id = Column(Integer, ForeignKey("subscriptions.id"))
	subscription = relationship("SubscriptionModel")

	@classmethod
	def get_by_subscription_plan(cls, plan_id):
		""" Get the list of all products belonging to a specific subscription plan """

		return cls.query.filter(cls.subscription_id == plan_id).all()


