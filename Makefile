.PHONY: run test

run:
	@# can't parse src/main.lx yet :)
	@lx.ts src/main.lx --debug test/stub/ch17.lx

test:
	@ls test/*.test.lx | xargs -I{} sh -c "echo {} && lx.ts {}"

dump:
	lx.ts src/main.lx test/stub/ch17.lx | xxd -r -p > /tmp/ch17.lxobj &
	lx.ts src/main.lx test/stub/ch18.lx | xxd -r -p > /tmp/ch18.lxobj &
	lx.ts src/main.lx test/stub/ch19.lx | xxd -r -p > /tmp/ch19.lxobj &
