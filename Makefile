build: Real/*.swift
	swiftc -O -whole-module-optimization Real/*.swift -o real
clean:
	rm -rf real
test: build
	./real
