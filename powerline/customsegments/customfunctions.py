#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# author: Matthias Dold
# date: 20210405
import os

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


# ==============================================================================
# Making a short user name
# ==============================================================================

try:
    import psutil

    # psutil-2.0.0: psutil.Process.username is unbound method
    if callable(psutil.Process.username):
        def _get_user():
            return psutil.Process(os.getpid()).username()
    # pre psutil-2.0.0: psutil.Process.username has type property
    else:
        def _get_user():
            return psutil.Process(os.getpid()).username
except ImportError:
    try:
        import pwd
    except ImportError:
        from getpass import getuser as _get_user
    else:
        try:
            from os import geteuid as getuid
        except ImportError:
            from os import getuid

        def _get_user():
            return pwd.getpwuid(getuid()).pw_name


username = False
# os.geteuid is not available on windows
_geteuid = getattr(os, 'geteuid', lambda: 1)


@requires_segment_info
def user_short(pl, segment_info, hide_user=None, hide_domain=False):
    '''
Basically a copy of /usr/lib/python3.9/site-packages/powerline/segments/common/env.py "user"
but shortening the user to initals

    :param str hide_user:
            Omit showing segment for users with names equal to this string.
    :param bool hide_domain:
            Drop domain component if it exists in a username (delimited by '@').

    Highlights the user with the ``superuser`` if the effective user ID is 0.

    Highlight groups used: ``superuser`` or ``user``. It is recommended to define all highlight groups.
    '''
    global username
    if (
            segment_info['environ'].get('_POWERLINE_RUNNING_SHELL_TESTS')
            == 'ee5bcdc6-b749-11e7-9456-50465d597777'
    ):
        return 'user'
    if username is False:
        username = _get_user()
    if username is None:
        pl.warn('Failed to get username')
        return None
    if username == hide_user:
        return None
    if hide_domain:
        try:
            username = username[:username.index('@')]
        except ValueError:
            pass
    euid = _geteuid()
    return [{
            'contents': username[:1] + '',
            'highlight_groups': ['user'] if euid != 0 else ['superuser', 'user'],
            }]
