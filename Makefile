.PHONY: main test

# TARGET = src/main.lx
# TARGET = src/types.lx
# TARGET = test/stub/ch25.lx
TARGET = test/stub/sink.lx
# TARGET = test/stub/import.lx
# TARGET = test/stub/functions.lx

main:
	lx.ts src/main.lx --debug $(TARGET) | xxd -r -p > /tmp/current.lxobj
	lx.ts src/main.lx $(TARGET)

test:
	@ls test/*.test.lx | xargs -I{} sh -c "echo {} && lx.ts {}"

dump:
	lx.ts src/main.lx --debug test/stub/ch17.lx | xxd -r -p > /tmp/ch17.lxobj &
	lx.ts src/main.lx --debug test/stub/ch18.lx | xxd -r -p > /tmp/ch18.lxobj &
	lx.ts src/main.lx --debug test/stub/ch19.lx | xxd -r -p > /tmp/ch19.lxobj &
	lx.ts src/main.lx --debug test/stub/ch21.lx | xxd -r -p > /tmp/ch21.lxobj &
	lx.ts src/main.lx --debug test/stub/ch22.lx | xxd -r -p > /tmp/ch22.lxobj &
	lx.ts src/main.lx --debug test/stub/ch23.lx | xxd -r -p > /tmp/ch23.lxobj &
	lx.ts src/main.lx --debug test/stub/ch23-1.lx | xxd -r -p > /tmp/ch23-1.lxobj &
	lx.ts src/main.lx --debug test/stub/ch24.lx | xxd -r -p > /tmp/ch24.lxobj &
	lx.ts src/main.lx --debug test/stub/ch25.lx | xxd -r -p > /tmp/ch25.lxobj &
	lx.ts src/main.lx --debug test/stub/hashmap.lx | xxd -r -p > /tmp/hashmap.lxobj &
	lx.ts src/main.lx --debug test/stub/array.lx | xxd -r -p > /tmp/array.lxobj &
	lx.ts src/main.lx --debug test/stub/sink.lx | xxd -r -p > /tmp/sink.lxobj &

runall:
	../clox/out/clox /tmp/ch17.lxobj
	../clox/out/clox /tmp/ch18.lxobj
	../clox/out/clox /tmp/ch19.lxobj
	../clox/out/clox /tmp/ch21.lxobj
	../clox/out/clox /tmp/ch22.lxobj
	../clox/out/clox /tmp/ch23.lxobj
	../clox/out/clox /tmp/ch23-1.lxobj
	../clox/out/clox /tmp/ch24.lxobj
	../clox/out/clox /tmp/ch25.lxobj
	../clox/out/clox /tmp/hashmap.lxobj
	../clox/out/clox /tmp/array.lxobj
	../clox/out/clox /tmp/sink.lxobj


all: main test dump
