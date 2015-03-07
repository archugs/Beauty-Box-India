from sqlalchemy import Column, Integer, String, Enum, UniqueConstraint, ForeignKey
from sqlalchemy.orm import relationship

from beautybox import db

class BeautyQuestionsModel(db.Model):
	""" Stores the list of beauty profile questions """

	__tablename__ = "beauty_questions"

	id = Column(Integer, primary_key=True)
	question = Column(String(300))
	# whether answer is a multiple choice or single choice or a text value
	answer_type = Column(Enum("multiple", "single", "value", name="answer_types"))

	@classmethod
	def get_all(cls):
		return cls.query.order_by(cls.id).all()

class BeautyQuestionChoicesModel(db.Model):
	""" Stores the list of all choices/options for each beauty question """

	__tablename__ = "beauty_questions_choices"

	id = Column(Integer, primary_key=True)
	question_id = Column(Integer, ForeignKey("beauty_questions.id"), index=True)
	question = relationship("BeautyQuestionsModel", backref="choices")
	choice = Column(String(100))

class BeautyConcernsModel(db.Model):
	""" Stores the list of all beauty concerns """

	__tablename__ = "beauty_concerns"

	id = Column(Integer, primary_key=True)
	concern_type = Column(Enum("skin", "hair", name="concern_types"))
	concern = Column(String(50))

class FragrancesModel(db.Model):
	""" Stores the list of all fragrance/scents types """

	__tablename__ = "fragrances"

	id = Column(Integer, primary_key=True)
	fragrance = Column(String(30))

