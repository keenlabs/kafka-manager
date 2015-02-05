# Needed because there is a directory `test`
.PHONY: test

GITHUB_URL=https://github.com/keenlabs/kafka-manager # XXX: get this from the environment instead

default: compile

compile:
	sbt -no-colors compile

test: compile
	#sbt scalastyle
	#sbt -no-colors test
	#mkdir test-output
	#mv target/test-reports/* test-output

dist:
	sbt -no-colors universal:package-zip-tarball
	canopy artifact dist target/universal/*.tgz $(GITHUB_URL) $(GIT_COMMIT) $(GIT_BRANCH)

clean:
	rm -rf target
	rm -rf dist
	rm -rf test-output
