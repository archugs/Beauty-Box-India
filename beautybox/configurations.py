import os

DB = {
	"host": "localhost",
	"db": "beautybox",
	"username": "postgres",
	"password": "postgres"
}

'''
SQLALCHEMY_DATABASE_URI = 'postgresql://{username}:{password}@localhost:5432/{database}'.format(
	username = DB['username'],
	password = DB['password'],
	database = DB['db'])
'''

SQLALCHEMY_DATABASE_URI = os.environ['DATABASE_URL']

SECRET_KEY = 'SOMERANDOMSECRETKEY'

