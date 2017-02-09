basePath ?= $(PWD)
db ?= taskfitdb
user ?= taskfit
pass ?= pass1234
tag ?=
xml ?=
TAGS = $(shell grep -r tagDatabase $(basePath	)/../src/main/resources/ | sort -u | sed -e 's/.*tag=//' -e 's/\/>//')

default: help

help:
			@echo "Usage:"
			@echo "make updateToTag tag=<available tag>"
			@echo "  Updates the database to the changeSet with the specified tag"
			@echo "  available tag:" $(TAGS)
			@echo
			@echo "make validate xml=<available xml>"
			@echo "  Checks changelog for errors"

updateToTag:
			@echo "  updateToTag: " $(tag)
			java -jar ./liquibase.jar --driver=org.postgresql.Driver --classpath=./postgresql-9.4.1212.jre6.jar \
			--url jdbc:postgresql://localhost:5432/$(db) --username=$(user) --password=$(pass) --logLevel=DEBUG \
			--defaultsFile=$(basePath)./src/main/resources/liquibase/liquibase.properties updateToTag $(tag)

validate:
			@echo "  validate: " $(changeSet)
			java -jar ./lib/liquibase.jar --driver=org.postgresql.Driver --classpath=./lib/postgresql-9.4.1212.jre6.jar \
			--url jdbc:postgresql://localhost:5432/$(db) --username=$(user) --password=$(pass) --logLevel=DEBUG \
			--changeLogFile=$(xml) validate

dbrestart:
	make -C /Users/macintoshhd/devel/docker/docker-postgresql rm
	make -C /Users/macintoshhd/devel/docker/docker-postgresql run
