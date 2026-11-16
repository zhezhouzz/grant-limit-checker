ROCQ := env -u ROCQPATH rocq compile -Q formal GrantLimit
DUNE := opam exec -- dune
FORMAL_FILES := formal/Model.v formal/Rules2026.v formal/Checker.v formal/Soundness.v formal/Extraction.v

.PHONY: formal kernel web verify build dev clean

formal:
	@for file in $(FORMAL_FILES); do \
		timeout 50 $(ROCQ) $$file || exit $$?; \
	done

kernel: formal
	$(DUNE) build kernel/kernel_bridge.bc.js
	mkdir -p web/public
	cp -f _build/default/kernel/kernel_bridge.bc.js web/public/kernel.js

web:
	npm --prefix web run build

verify: kernel
	@if rg -n '\b(Admitted|admit)\b' formal; then echo "Unfinished Rocq proof found"; exit 1; fi
	node tests/kernel-smoke.cjs
	npm --prefix web run check

build: kernel web

dev: kernel
	npm --prefix web run dev

clean:
	$(DUNE) clean
	rm -f web/public/kernel.js
	rm -rf web/dist
