import sys
import os
from os.path import join, dirname


version = 0.0.1
file, folder, name, license = sys.argv
cp /io/travis/setup.py.tmpl sdl2_wheel/setup.py

libs = [p for p in os.listdir(folder) if '.so' in p]
print('dirname:', dirname(file))
print(os.listdir(dirname(file)))
print('folder:', folder)
print(os.listdir(folder))
with open(join(dirname(file), 'setup.py.tmpl')) as f:
    with open(join(folder, 'setup.py', 'w')) as s:
        s.write(
            f.read().format(
                libs,
                name,
                version,
                license,
                name
            )
        )
print('dirname:', dirname(file))
print(os.listdir(dirname(file)))
print('folder:', folder)
print(os.listdir(folder))
