build:
	docker-compose build

bundle:
	docker-compose run --rm web bundle install

dbsetup:
	docker-compose run --rm web bundle exec rails db:setup

server:
	docker-compose run --rm --service-ports web

console:
	docker-compose run --rm web bundle exec rails console

sidekiq:
	docker-compose run --rm --service-ports sidekiq

rubocop:
	docker-compose run --rm web bundle exec rubocop

bash:
	docker-compose run --rm web bash
