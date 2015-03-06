import datetime

import models

class User:

	def __init__(self, user_email):
		self.user = models.UserModel.get(user_email)

	def authentication(self, password):
		""" Authenticates the login of user """

		if self.user:
			return self.user.verify_password(password)
		else:
			return False

	def register(self, **params):
		""" New user sign-up """

		new_user = models.UserModel(email=params["email"],
			password=params["password"],
			name=params["name"],
			address=params["address"],
			timestamp=datetime.datetime.now())
		new_user.save()
		models.commit()

	def subscribe(self, subscription_plan_id, duration):
		""" A user subscribes for a plan """

		new_subscription = models.UserSubscriptionModel(user=self.user,
			subscription_id=self.subscription_id,
			duration=duration,
			timestamp=datetime.datetime.now())
		new_subscription.save()
		models.commit()

	def add_profile(self, **params):
		""" A user creates/edits his/her beauty profile """

		beauty_profile = models.UserProfileModel.get(self.user.id)
		if beauty_profile:
			self.update_profile(beauty_profile, **params)
			models.UserSkinConcernsModel.delete(self.user.id)
			models.UserHairConcernsModel.delete(self.user.id)
			models.UserFragrancesModel.delete(self.user.id)
		else:
			self.create_profile(**params)

		# A user can have one or many skin concerns
		for concern_id in params["skin_concerns"]:
			skin_concern = models.UserSkinConcernsModel(user=self.user,
				skin_concerns_id = concern_id)
			skin_concern.save()

		# A user can have one or more hair concerns
		for concern_id in params["hair_concerns"]:
			hair_concern = models.UserHairConcernsModel(user=self.user,
				hair_concerns_id = concern_id)
		
		hair_concern.save()

		# A user can have one or more fragrance preferences
		for fragrance_id in params["fragrances"]:
			fragrance = models.UserFragrancesModel(user=self.user,
				fragrances_id = fragrance_id)
			fragrance.save()

		models.commit()

	def update_profile(self, **params):
		""" Updates the user's beauty profile """

		beauty_profile.age = params["age"]
		beauty_profile.gender = params["gender"]
		beauty_profile.skin_type = params["skin_type"]
		beauty_profile.skin_tone = params["skin_tone"]
		beauty_profile.skin_sensitivity = params["skin_sensitivity"]
		beauty_profile.hair_type = params["hair_type"]

	def create_profile(self, **params):
		""" Creates the beauty profile for a new user """

		beauty_profile = models.UserProfileModel(user=self.user,
			age=params["age"],
			gender=params["gender"],
			skin_type=params["skin_type"],
			skin_tone=params["skin_tone"],
			skin_sensitivity=params["skin_sensitivity"],
			hair_type=params["hair_type"])
		
		beauty_profile.save()
		
	def add_to_wishlist(self, product_id):
		""" Add a product to the user's wishlist """

		wishlist_item = UserWishlistModel(user=self.user,
			product_id=product_id)
		wishlist_item.save()
		models.commit()

	def remove_from_wishlist(self, product_id):
		""" Remove a product from the user's wishlist """

		wishlist_item = UserWishlistModel.get(self.user.id, product_id)
		if wishlist_item:
			wishlist_item.delete()

