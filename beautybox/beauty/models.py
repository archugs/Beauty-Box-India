from sqlalchemy import Column, Integer, String, UniqueConstraint

from beautybox import db

class BeautyConcernsModel(db.Model):
	""" Stores the list of all beauty concerns """

	__tablename__ = "beauty_concerns"

	id = Column(Integer, primary_key=True)
	concern_type = Column(Enum("skin", "hair", name="concern_types"))
	concern = Column(String(30))

class FragrancesModel(db.Model):
	""" Stores the list of all fragrance/scents types """

	__tablename__ = "fragrances"

	id = Column(Integer, primary_key=True)
	fragrance = Column(String(30))

