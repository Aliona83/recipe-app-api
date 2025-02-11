# recipe-app-api

## Commands
docker compose up

docker compose run --rm app sh #  This will open a shell inside the app container.

docker-compose run --rm app sh -c "python manage.py test"

docker compose run --rm app sh -c "python manage.py runserver 0.0.0.0:8000"


docker-compose run --rm app sh -c "python manage.py migrate"

echo 'export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

 docker build -t aliona658/recipe-app-api .


http://127.0.0.1:8000/api/recipe/recipe-list/
