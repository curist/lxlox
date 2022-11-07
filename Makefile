.PHONY: run test

# can't parse src/main.lx yet :)
TARGET = test/stub/ch23.lx

run:
	lx.ts src/main.lx $(TARGET)
	lx.ts src/main.lx --debug $(TARGET)

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

all: run test dump
