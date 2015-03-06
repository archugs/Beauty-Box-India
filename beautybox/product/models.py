from sqlalchemy import Column, Integer, String, Float, DateTime, Boolean, UniqueConstraint, ForeignKey
from sqlalchemy.orm import relationship

from beautybox import db

class ProductModel(db.Model):
	""" Stores all the products info """

	__tablename__ = "products"

	id = Column(Integer, primary_key=True)
	name = Column(String(100), index=True)
	description = Column(String(500))
	product_type = Column(String(20))
	price = Column(Float)
	quantity = Column(Float)
	quantity_units = Column(String(10))
	timestamp = Column(DateTime)
	# whether product is sample sized or regular sized
	sample = Column(Boolean)
	__table_args__ = (UniqueConstraint("name", name="uniq_products"),)

class ProductConcernsModel(db.Model):
	""" Stores all the skin/hair concerns that a product addresses or claims to solve """

	id = Column(Integer, primary_key=True)
	product_id = Column(Integer, ForeignKey("products.id"), index=True)
	product = relationship("ProductModel", backref="product_concerns")
	concerns = Column(String(30))

class ProductSubscriptionModel(db.Model):
	""" Stores which subscription plan type each product belongs to.
		A product can belong to more than one plan type.
	"""

	id = Column(Integer, primary_key=True)
	product_id = Column(Integer, ForeignKey("products.id"), index=True)
	product = relationship("ProductModel", backref="concerns")
	subscription_id = Column(Integer, ForeignKey("subscriptions.id"))
	subscription = relationship("SubscriptionModel")

