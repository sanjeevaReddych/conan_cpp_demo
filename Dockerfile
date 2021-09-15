FROM conanio/gcc7:1.34.0

USER root

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
       vim \
       nano \
       less \
       g++-arm-linux-gnueabihf \
       cmake

USER conan

RUN conan profile new default --detect
RUN conan profile update settings.compiler.libcxx=libstdc++11 default
RUN conan config set general.revisions_enabled=False
