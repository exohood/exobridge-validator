#!/usr/bin/env python3

from setuptools import find_packages, setup

setup(name='dvspec',
      version='0.1',
      description='Exobridge Validator',
      author='JJ Uzumaki',
      author_email='jjuzumaki@exohood.org',
      url='https://github.com/exobridge-validator',
      package_dir={'':'src'},
      packages=find_packages(where='src'),
)
