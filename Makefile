.PHONY: run test

run:
	@lx.ts src/main.lx src/main.lx

test:
	@ls test/*.test.lx | xargs -I{} sh -c "echo {} && lx.ts {}"

dump:
	lx.ts src/main.lx test/stub/ch17.lx | xxd -r -p > /tmp/ch17.lxobj
