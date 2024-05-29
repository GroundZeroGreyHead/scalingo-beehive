migrate:
	@docker-compose exec beehive_api bundle exec rake db:migrate

reset-dev:
	@docker-compose exec beehive_api bundle exec rake db:environment:set RAILS_ENV=development db:drop db:create db:migrate db:seed

seed:
	@docker-compose exec beehive_api bundle exec rake db:seed

rollback:
	@docker-compose exec beehive_api bundle exec rake db:rollback STEP=1  # Rollback one migration step

status:
	@docker-compose exec beehive_api bundle exec rake db:migrate:status   # Check migration status

## Testing
test: reset-dev
	@docker-compose exec beehive_api bundle exec rspec

rspec: 
	@$(MAKE) test

down:
	@docker-compose down

teardown:
	@docker-compose down --remove-orphans --volumes
	
run:
	@docker-compose up --build
