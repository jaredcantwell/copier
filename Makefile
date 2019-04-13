all: PHONY

help:
	@echo "clean - remove build/python artifacts"
	@echo "test - run tests quickly"
	@echo "flake - check style with flake8"
	@echo "coverage - generate an HTML report of the coverage"
	@echo "install - install for development"
	@echo "publish - publish a new version"

clean: clean-build clean-pyc

clean-build:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf pip-wheel-metadata

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -rf {} +
	find . -name '.pytest_cache' -exec rm -rf {} +

test:
	pytest -x copier tests

flake:
	flake8 --config=setup.cfg copier tests

coverage:
	pytest --cov-report html --cov copier copier tests

install:
	pip install -e .
	pip install -r requirements-dev.txt

publish:
	pip install twine wheel
	python publish.py
