import datetime

import models
from beautybox.user.models import UserModel
from beautybox.product.models import ProductModel

class Admin:

	def authentication(self, admin_id, password):
		""" Authenticates the login of admin """

		admin = models.AdminModel.get(admin_id)
		if admin:
			return admin.verify_password(password)
		else:
			return False

	def generate_beauty_boxes(self):
		""" Generates monthly beauty boxes for all subscribed users personalized to their profile. """

		self.users = self.get_current_users()
		self.products = ProductModel.get_all()
		for user in users:
			self.filter_products_for_user(user)

	def get_current_users(self):
		""" Fetches the list of users who are currently enrolled in subscription plan """

		current_users = []
		duration = {"1": 30,
					"3": 90,
					"6": 180,
					"12": 360}
		for user in UserModel.get_all():
			if user.subscription.timestamp + datetime.timedelta(days=duration[user.subscription.duration]) > datetime.datetime.now():
				current_users.append(user)
		return current_users

	def filter_products_for_user(self, user):
		""" Filters the products that are suitable fo r the user """

		for product in products:
			if user.profile.age >= product.profile.age:
				if (user.profile.gender == product.profile.gender) or 

	def check_age_group(user, product):
		""" Certain products can be used only by certain age groups.
			Check whether product is suitable for the age of user.
		"""

		return user.profile.age >= product.profile.age
	
	def check_gender(user, product):
		""" Certain products can be used only either by men or women.
			Check whether product is suitable for gender of user.
		"""

		return (user.profile.gender == product.profile.gender) or (product.profile.gender == "unisex")

	def check_skin_type(user, product):
		""" Check whether the product is suitable for the skin type of the user. """

		return (user.profile.skin_type == product.profile.skin_type) or (product.profile.skin_type == "all")

	def check_skin_tone(user, product):
		""" Check whether the product is suitable for the skin tone of the user. """

		return (user.profile.skin_tone == product.profile.skin_tone) or (product.profile.skin_tone == "all")

	def check_skin_sensitivity(user, product):
		""" Check whether the product is suitable for the user's sensitive skin. """

		return user.profile.skin_sensitivity == product.profile.skin_sensitivity

	def check_hair_type(user, product):
		""" Check whether the product is suitable for the user's hair type. """

		return user.profile.hair_type == product.profile.hair_type



