### for shapely and basemap
libgeos-dev:
  pkg.installed


### for basemap
libgeos_shared_object:
  file.symlink:
    - name: /usr/lib/libgeos.so
    - target: libgeos-3.4.2.so
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: libgeos-dev


### for lxml
libxml2-dev:
  pkg.installed

libxslt-dev:
  pkg.installed

zlib1g-dev:
  pkg.installed


### for matplotlib
libfreetype6-dev:
  pkg:
    - installed

pkg-config:
  pkg:
    - installed


virtualenv:
  pip.installed:
    - require:
      - pkg: python-pip

base_virtualenv:
  virtualenv.managed:
    - name: /home/vagrant/env/
    - user: vagrant
    - no_chown: True
    - cwd: /home/vagrant/
    - system_site_packages: False
    - requirements: /vagrant/requirements.txt
    - verbose: True
    - require:
      - pip: virtualenv


basemap:
  pip.installed:
    - name: basemap==1.0.7
    - user: vagrant
    - cwd: /home/vagrant/
    - bin_env: /home/vagrant/env/
    - allow_external: basemap
    - allow_unverified: basemap
    - verbose: True
    - require:
      - virtualenv: base_virtualenv
      - pkg: libgeos-dev
      - file: libgeos_shared_object
