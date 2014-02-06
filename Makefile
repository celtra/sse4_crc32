NODE_GYP = /home/neo/.nvm/v0.8.26/lib/node_modules/npm/bin/node-gyp-bin/node-gyp
TAP = /home/neo/.npm/tap
TEST_FILES = test/*.test.js
BENCHMARK_FILES = benchmark/*.benchmark.js

all: test

build: clean configure compile

configure:
		$(NODE_GYP) configure

compile: configure
		$(NODE_GYP) build
		npm install .

debug: clean
		$(NODE_GYP) configure -d build

test: build
		$(TAP) $(TEST_FILES)

benchmark: build
		for f in $(BENCHMARK_FILES); do node $$f; done;

clean:
		$(NODE_GYP) clean


.PHONY: clean test build
