# Setup database (create, migrate and seed)
setup: db-create migrate seed

# Create database
db-create:
	@docker-compose exec beehive_api bundle exec rake db:create

# Migrate database
migrate:
	@docker-compose exec beehive_api bundle exec rake db:migrate

# Reset database (drop, create, migrate, seed)
reset-db:
	@docker-compose exec beehive_api bundle exec rake db:drop db:create db:migrate
# Reset development environment (drop, create, migrate, seed)

prepare_test:
	@docker-compose exec beehive_api bundle exec rake db:environment:set RAILS_ENV=test db:drop db:create db:migrate

# Seed database
seed:
	@docker-compose exec beehive_api bundle exec rake db:seed

# Rollback one migration step
rollback:
	@docker-compose exec beehive_api bundle exec rake db:rollback STEP=1

# Check migration status
migration-status:
	@docker-compose exec beehive_api bundle exec rake db:migrate:status

# Run tests (includes resetting dev environment)
test: prepare_test
	@docker-compose exec beehive_api bundle exec rspec

# Alias for test target
rspec:
	@$(MAKE) test

# Stop containers and services
down:
	@docker-compose down

# Stop containers and services, removing volumes and orphaned networks
teardown:
	@docker-compose down --volumes --remove-orphans

# Build and start containers (same as docker-compose up --build)
run:
	@docker-compose up --build
