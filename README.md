# recipe-app-api

## Comands

docker-compose up

docker-compose run --rm app sh -c "python manage.py test"

docker-compose run --rm app sh -c "python manage.py runserver"

docker-compose run --rm app sh -c "python manage.py migrate"

http://127.0.0.1:8000/api/recipe/home/
