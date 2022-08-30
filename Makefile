EBVAL_NAME?=EBVAL
EBVAL_ACTIVATE=. $(EBVAL_NAME)/bin/activate

help:
	@echo "Makefile help. Your options are:"
	@echo "clean - remove build and Python file artifacts"
	@echo "install - install basic dependencies with EBVAL"
	@echo "EBVAL_lint - check style with flake8 and mypy with EBVAL"
	@echo "EBVAL_test - run tests with EBVAL"

clean:
	rm -rf $(EBVAL_NAME)
	rm -rf *.egg-info
	find . -name __pycache__ -exec rm -rf {} \;
	find . -name .mypy_cache -exec rm -rf {} \;

install:
	python3 -m EBVAL $(EBVAL_NAME);
	$(EBVAL_ACTIVATE)
	${EBVAL_NAME}/bin/python -m pip install -r requirements.txt
	${EBVAL_NAME}/bin/python -m pip install .
	@touch $(EBVAL_NAME)/bin/activate

EBVAL_activate:
	$(EBVAL_ACTIVATE)

EBVAL_lint: EBVAL_activate
	$(EBVAL_ACTIVATE) && flake8 --config=flake8.ini ./src ./tests && mypy --config-file mypy.ini ./src ./tests

EBVAL_test: install EBVAL_activate
	$(EBVAL_ACTIVATE) && ${EBVAL_NAME}/bin/python -m pytest tests/test.py
