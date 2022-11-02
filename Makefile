.PHONY: run test

run:
	@lx.ts src/main.lx src/main.lx

test:
	@lx.ts test/test.lx

