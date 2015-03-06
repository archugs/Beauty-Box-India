DB = {
	"host": "localhost",
	"db": "beautybox",
	"username": "postgres",
	"password": "postgres"
}

SQLALCHEMY_DATABASE_URI = 'postgresql://{username}:{password}@localhost/{database}'.format(
	username = DB['username'],
	password = DB['password'],
	database = DB['db'])

