install:
	bundle install
up:
	docker-compose up -d
down:
	docker-compose stop

test:
	RACK_ENV=test bundle exec rspec spec/
migrate-test:
	RACK_ENV=test bundle exec rake db:drop_tables_and_replication_databases
	RACK_ENV=test bundle exec rake db:migrate
recreate-test-db:
	docker-compose stop test_db
	docker-compose rm -f test_db
	docker-compose up -d test_db
	make migrate-test
psql-test: cmd-exists-pgcli
	pgcli postgres://webhookdb:webhookdb@localhost:18066/webhookdb_test

message-render-html: env-MESSAGE
	@RACK_ENV=test bundle exec rake message:render[$(MESSAGE)] > message.html
	open message.html
	sleep 3
	rm message.html


VERSION := `cat lib/webhookdb/custom_integrations_demo.rb | grep 'VERSION =' | cut -d '"' -f2`
build:
ifeq ($(strip $(VERSION)),)
	echo "Could not parse VERSION"
else
	git tag $(VERSION)
	gem build webhookdb-custom-integrations-demo.gemspec
#	gem push appydays-$(VERSION).gem
#	git push origin $(VERSION)
endif

env-%:
	@if [ -z '${${*}}' ]; then echo 'ERROR: variable $* not set' && exit 1; fi

cmd-exists-%:
	@hash $(*) > /dev/null 2>&1 || \
		(echo "ERROR: '$(*)' must be installed and available on your PATH."; exit 1)
