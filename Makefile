build: Real/*.swift
	swiftc -O Real/*.swift -o real
clean:
	rm -rf real
test: build
	./real