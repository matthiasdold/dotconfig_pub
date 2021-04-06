#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# author: Matthias Dold
# date: 20210405

from powerline.theme import requires_segment_info
from powerline.segments import Segment, with_docstring


@requires_segment_info
def node_virtualenv(pl, segment_info, ignore_venv=False, ignored_names=("venv", ".venv")):
	'''
        Basically a copy of /usr/lib/python3.9/site-packages/powerline/segments/common/env.py "virtualenv"

        Return the name of the current node env
	:param list ignored_names:
		Names of venvs to ignore. Will then get the name of the venv by ascending to the parent directory
	:param bool ignore_venv:
		Whether to ignore virtual environments. Default is False.
	'''
	if not ignore_venv:
		for candidate in reversed(segment_info['environ'].get('NODE_VIRTUAL_ENV', '').split("/")):
			if candidate and candidate not in ignored_names:
				return ' ' + candidate
				# return candidate
	return None

@requires_segment_info
def python_venv(pl, segment_info, ignore_venv=False, ignored_names=("venv", ".venv")):
	'''
        Basically a copy of /usr/lib/python3.9/site-packages/powerline/segments/common/env.py "virtualenv"
        Extending for python glyp

        Return the name of the current node env
	:param list ignored_names:
		Names of venvs to ignore. Will then get the name of the venv by ascending to the parent directory
	:param bool ignore_venv:
		Whether to ignore virtual environments. Default is False.
	'''
	if not ignore_venv:
		for candidate in reversed(segment_info['environ'].get('VIRTUAL_ENV', '').split("/")):
			if candidate and candidate not in ignored_names:
				return ' ' + candidate
	if not ignore_conda:
		for candidate in reversed(segment_info['environ'].get('CONDA_DEFAULT_ENV', '').split("/")):
			if candidate and candidate not in ignored_names:
				return ' ' + candidate
	return None


