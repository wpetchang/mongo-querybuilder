.PHONY: docs

init:
	pip install -r requirements.txt

test:
	py.test tests

coverage:
	py.test --verbose --cov-report term --cov=rcquerybuilder tests

publish:
	python setup.py register
	python setup.py sdist upload
	python setup.py bdist_egg --plat-name universal upload
	rm -fr build dist .egg rcquerybuilder.egg-info

publish-sign:
	python setup.py register
	python setup.py sdist upload --sign --identity 8826CCF8
	python setup.py bdist_egg --plat-name universal upload --sign --identity 8826CCF8
	rm -fr build dist .egg rcquerybuilder.egg-info

clean:
	rm -fr build dist .egg rcquerybuilder.egg-info

docs:
	sphinx-apidoc -f -o docs rcquerybuilder
	cd docs && make html
	@echo "\033[95m\n\nBuild successful! View the docs homepage at docs/_build/html/index.html.\n\033[0m"
