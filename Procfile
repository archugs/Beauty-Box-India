web: gunicorn --log-file - beautybox:app
init: python db_create.py
heroku ps:scale web=1
