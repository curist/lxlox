.PHONY: run test

# can't parse src/main.lx yet :)
TARGET = test/stub/ch19.lx

run:
	lx.ts src/main.lx $(TARGET)
	lx.ts src/main.lx --debug $(TARGET)

test:
	@ls test/*.test.lx | xargs -I{} sh -c "echo {} && lx.ts {}"

dump:
	lx.ts src/main.lx --debug test/stub/ch17.lx | xxd -r -p > /tmp/ch17.lxobj &
	lx.ts src/main.lx --debug test/stub/ch18.lx | xxd -r -p > /tmp/ch18.lxobj &
	lx.ts src/main.lx --debug test/stub/ch19.lx | xxd -r -p > /tmp/ch19.lxobj &

all: run test dump
