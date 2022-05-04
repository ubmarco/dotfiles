"""
Pylintrc init hook in a separate file.

Enables multi-line code.
"""
import os
import sys


last_arg = sys.argv[-1]
if os.path.isdir(last_arg):
    sys.path.append(last_arg)
elif os.path.isfile(last_arg):
    base_dir = os.path.dirname(last_arg)
    sys.path.append(base_dir)
else:
    # do nothing, user might have called --help
    pass
