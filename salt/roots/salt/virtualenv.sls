### for shapely
libgeos-dev:
  pkg.installed

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