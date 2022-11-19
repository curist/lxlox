.PHONY: main test

TARGET = src/main.lx
# TARGET = src/types.lx
# TARGET = src/compiler.lx
# TARGET = test/stub/ch25.lx
# TARGET = test/stub/sink.lx
# TARGET = test/stub/import.lx
# TARGET = test/stub/functions.lx

main:
	lx compile --debug $(TARGET) | xxd -r -p > /tmp/current.lxobj
	lx compile $(TARGET)

test:
	@ls test/*.test.lx | xargs -I{} sh -c "echo {} && lx.ts {}"

dump:
	lx compile --debug test/stub/ch17.lx | xxd -r -p > /tmp/ch17.lxobj &
	lx compile --debug test/stub/ch18.lx | xxd -r -p > /tmp/ch18.lxobj &
	lx compile --debug test/stub/ch19.lx | xxd -r -p > /tmp/ch19.lxobj &
	lx compile --debug test/stub/ch21.lx | xxd -r -p > /tmp/ch21.lxobj &
	lx compile --debug test/stub/ch22.lx | xxd -r -p > /tmp/ch22.lxobj &
	lx compile --debug test/stub/ch23.lx | xxd -r -p > /tmp/ch23.lxobj &
	lx compile --debug test/stub/ch23-1.lx | xxd -r -p > /tmp/ch23-1.lxobj &
	lx compile --debug test/stub/ch24.lx | xxd -r -p > /tmp/ch24.lxobj &
	lx compile --debug test/stub/ch25.lx | xxd -r -p > /tmp/ch25.lxobj &
	lx compile --debug test/stub/hashmap.lx | xxd -r -p > /tmp/hashmap.lxobj &
	lx compile --debug test/stub/array.lx | xxd -r -p > /tmp/array.lxobj &
	lx compile --debug test/stub/sink.lx | xxd -r -p > /tmp/sink.lxobj &

runall:
	lx run /tmp/ch17.lxobj
	lx run /tmp/ch18.lxobj
	lx run /tmp/ch19.lxobj
	lx run /tmp/ch21.lxobj
	lx run /tmp/ch22.lxobj
	lx run /tmp/ch23.lxobj
	lx run /tmp/ch23-1.lxobj
	lx run /tmp/ch24.lxobj
	lx run /tmp/ch25.lxobj
	lx run /tmp/hashmap.lxobj
	lx run /tmp/array.lxobj
	lx run /tmp/sink.lxobj


all: main test dump
