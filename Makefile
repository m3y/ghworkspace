list:
	@poetry run pip list

check_format:
	@poetry run black --check .

check_isort:
	@poetry run isort -c .

fmt:
	@poetry run sh -c "isort . ; black ."

lint:
	@poetry run mypy --ignore-missing-imports --no-site-package --follow-imports=skip ./ghworkspace

repl:
	@poetry run ptipython

build:
	@poetry build

test:
	@poetry run sh -c "date +%s | xargs -I{} python -m pytest -v --cov=ghworkspace/ --cov-branch --randomly-seed={}"

publish:
	@poetry publish

test-publish:
	@poetry publish -r testpypi

clean:
	@rm -rf dist

.PHONY: build check_format check_isort clean fmt lint list publish repl test test-publish
