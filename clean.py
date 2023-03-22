import os
from pathlib import PurePath

with open(PurePath(os.environ['HOME'], '.history.icd'), 'r+') as f:
    lines = f.readlines()
    f.seek(0)
    f.truncate()
    f.writelines(filter(lambda s: os.path.exists(s.strip()), lines))
