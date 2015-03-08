import datetime, random

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
		""" Generates monthly beauty boxes for all subscribed users personalized to their.profile[0]. """

		self.users = self.get_current_users()
		self.products = ProductModel.get_all()
		self.beauty_boxes = []
		for user in self.users:
			products = self.filter_products_for_user(user)
			products = self.filter_products_by_plan(user, products)
			beauty_box = self.create_beauty_box(user, products)
			self.beauty_boxes.append({"user": user, "products": beauty_box})
		return self.beauty_boxes

	def get_current_users(self):
		""" Fetches the list of users who are currently enrolled in subscription plan """

		current_users = []
		duration = {1: 30,
					3: 90,
					6: 180,
					12: 360}
		for user in UserModel.get_all():
			if user.subscription[0].timestamp + datetime.timedelta(days=duration[user.subscription[0].duration]) > datetime.datetime.now():
				current_users.append(user)
		return current_users

	def filter_products_for_user(self, user):
		""" Filters the products that are suitable fo r the user """

		filtered_products = []
		for product in self.products:
			if self.check_age_group(user, product) and self.check_gender(user, product):
				if product.product_type == "skincare" or product.product_type == "makeup":
					if self.check_product_preferences(user, product) and self.check_skin_type(user, product) and self.check_skin_tone(user, product) and self.check_skin_sensitivity(user, product) and self.check_skin_concerns(user, product):
						filtered_products.append(product)
				elif product.product_type == "haircare":
					if self.check_product_preferences(user, product) and self.check_hair_type(user, product) and self.check_hair_concerns(user, product):
						filtered_products.append(product)
				elif product.product_type == "fragrance":
					if self.check_product_preferences(user, product) and self.check_fragrance_preferences(user, product):
						filtered_products.append(product)
		return filtered_products

	def filter_products_by_plan(self, user, products):
		""" Filters the products according to user's subscription plan """

		filtered_products = []
		for product in products:
			for plan in product.subscriptions:
				if plan.subscription_id == user.subscription[0].subscription_id:
					filtered_products.append(product)
		return filtered_products

	def create_beauty_box(self, user, products):
		""" Creates a random beauty box for the user """

		random.shuffle(products)
		return products[:4]

	def check_age_group(self, user, product):
		""" Certain products can be used only by certain age groups.
			Check whether product is suitable for the age of user.
		"""

		return user.profile[0].age >= product.profile[0].age
	
	def check_gender(self, user, product):
		""" Certain products can be used only either by men or women.
			Check whether product is suitable for gender of user.
		"""

		return (user.profile[0].gender == product.profile[0].gender) or (product.profile[0].gender == "unisex")

	def check_skin_type(self, user, product):
		""" Check whether the product is suitable for the skin type of the user. """

		return (user.profile[0].skin_type == product.profile[0].skin_type) or (product.profile[0].skin_type == "all")

	def check_skin_tone(self, user, product):
		""" Check whether the product is suitable for the skin tone of the user. """

		return (user.profile[0].skin_tone == product.profile[0].skin_tone) or (product.profile[0].skin_tone == "all")

	def check_skin_sensitivity(self, user, product):
		""" Check whether the product is suitable for the user's sensitive skin. """

		return product.profile[0].skin_sensitivity == "low" or user.profile[0].skin_sensitivity == product.profile[0].skin_sensitivity

	def check_hair_type(self, user, product):
		""" Check whether the product is suitable for the user's hair type. """

		return user.profile[0].hair_type == product.profile[0].hair_type or product.profile[0].hair_type == "all"

	def check_skin_concerns(self, user, product):
		""" Check whether product matches the skin concerns of the user """

		skin_concerns = []
		for concern in product.product_concerns:
			skin_concerns.append(concern.concerns_id)
		for concern in user.skinconcerns:
			if concern.skin_concerns_id in skin_concerns:
				return True
		return False

	def check_hair_concerns(self, user, product):
		""" Check whether a hair product matches the hair concerns of the user """

		hair_concerns = []
		for concern in product.product_concerns:
			hair_concerns.append(concern.concerns_id)
		for concern in user.hairconcerns:
			if concern.hair_concerns_id in hair_concerns:
				return True
		return False

	def check_fragrance_preferences(self, user, product):
		""" Check whether a perfume/body spray/mist matches the fragrance preferences of the user """

		for fragrance in user.fragrances:
			if fragrance.fragrances_id == product.fragrance_id:
				return True
		return False
	
	def check_product_preferences(self, user, product):
		""" Check whether a product type matches the preferences of the user """

		for record in user.preferences:
			if record.preference == product.product_type:
				return True
		return False

