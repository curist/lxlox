.PHONY: main test

TARGET = src/main.lx
# TARGET = src/types.lx
# TARGET = src/compiler.lx
# TARGET = test/stub/ch25.lx
# TARGET = test/stub/sink.lx
# TARGET = test/stub/import.lx
# TARGET = test/stub/functions.lx

main:
	./clxo ./lx.o --debug $(TARGET) | xxd -r -p > /tmp/current.lxobj
	./clxo ./lx.o $(TARGET)

test:
	@ls test/*.test.lx | xargs -I{} sh -c "echo {} && lx.ts {}"

dump:
	./clxo ./lx.o --debug test/stub/ch17.lx | xxd -r -p > /tmp/ch17.lxobj &
	./clxo ./lx.o --debug test/stub/ch18.lx | xxd -r -p > /tmp/ch18.lxobj &
	./clxo ./lx.o --debug test/stub/ch19.lx | xxd -r -p > /tmp/ch19.lxobj &
	./clxo ./lx.o --debug test/stub/ch21.lx | xxd -r -p > /tmp/ch21.lxobj &
	./clxo ./lx.o --debug test/stub/ch22.lx | xxd -r -p > /tmp/ch22.lxobj &
	./clxo ./lx.o --debug test/stub/ch23.lx | xxd -r -p > /tmp/ch23.lxobj &
	./clxo ./lx.o --debug test/stub/ch23-1.lx | xxd -r -p > /tmp/ch23-1.lxobj &
	./clxo ./lx.o --debug test/stub/ch24.lx | xxd -r -p > /tmp/ch24.lxobj &
	./clxo ./lx.o --debug test/stub/ch25.lx | xxd -r -p > /tmp/ch25.lxobj &
	./clxo ./lx.o --debug test/stub/hashmap.lx | xxd -r -p > /tmp/hashmap.lxobj &
	./clxo ./lx.o --debug test/stub/array.lx | xxd -r -p > /tmp/array.lxobj &
	./clxo ./lx.o --debug test/stub/sink.lx | xxd -r -p > /tmp/sink.lxobj &

runall:
	./clxo /tmp/ch17.lxobj
	./clxo /tmp/ch18.lxobj
	./clxo /tmp/ch19.lxobj
	./clxo /tmp/ch21.lxobj
	./clxo /tmp/ch22.lxobj
	./clxo /tmp/ch23.lxobj
	./clxo /tmp/ch23-1.lxobj
	./clxo /tmp/ch24.lxobj
	./clxo /tmp/ch25.lxobj
	./clxo /tmp/hashmap.lxobj
	./clxo /tmp/array.lxobj
	./clxo /tmp/sink.lxobj


all: main test dump
