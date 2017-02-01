
# Install a system package required by our library
yum check-update
yum install \
    make \
    mercurial \
    automake \
    gcc \
    gcc-c++ \
    SDL2-devel \
    SDL2_ttf-devel \
    SDL2_mixer-devel \
    SDL2* \
    libsdl2* \
    libSDL2* \
    khrplatform-devel \
    mesa-libGLES \
    mesa-libGLES-devel \
    gstreamer-plugins-good \
    gstreamer \
    gstreamer-python \
    mtdev-devel \
    python-devel \
    python-pip

# Compile wheels
for PYBIN in /opt/python/*/bin; do
    "${PYBIN}/pip" install --upgrade cython nose
    "${PYBIN}/pip" wheel /io/ -w wheelhouse/
done

# Bundle external shared libraries into the wheels
for whl in wheelhouse/*.whl; do
    auditwheel repair "$whl" -w /io/wheelhouse/
done

# Install packages and test
for PYBIN in /opt/python/*/bin/; do
    "${PYBIN}/pip" install . --no-index -f /io/wheelhouse
    (cd "$HOME"; "${PYBIN}/nosetests" kivy)
done
