.PHONY: run test

run:
	@lx.ts src/main.lx src/main.lx

test:
	@ls test/*.test.lx | xargs -I{} sh -c "echo {} && lx.ts {}"

