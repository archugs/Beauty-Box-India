from sqlalchemy import Column, Integer, String, UniqueConstraint

from beautybox import db

class SubscriptionModel(db.Model):
	""" Stores all the types of subscription plans """

	__tablename__ = "subscriptions"

	id = Column(Integer, primary_key=True)
	name = Column(String(20))
	description = Column(String(500))
	__table_args__ = (UniqueConstraint("name", name="uniq_subscription"),)

