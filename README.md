daemontools-rpm - A tools for building daemontools rpm package
==============================================================

[![Build Status][travis-badge]][travis-url]
[![packagecloud][packagecloud-badge]][packagecloud-url]

This is a fork of [kteru/daemontools-rpm][kteru] adding support for [dockerized
rpmbuild][docker-rpmbuild]. Pre-built packages for CentOS 7 are available at
[packagecloud][packagecloud-url].

[kteru]: https://github.com/kteru/daemontools-rpm
[docker-rpmbuild]: https://hub.docker.com/r/rpmbuild/centos7/
[travis-badge]: https://travis-ci.org/snsinfu/daemontools-rpm.svg?branch=master
[travis-url]: https://travis-ci.org/snsinfu/daemontools-rpm
[packagecloud-badge]: https://img.shields.io/badge/rpm-packagecloud.io-844fec.svg
[packagecloud-url]: https://packagecloud.io/sinfu/daemontools

To install daemontools package from packagecloud:

```sh
sudo curl -o /etc/yum.repos.d/daemontools.repo "https://packagecloud.io/install/repositories/sinfu/daemontools/config_file.repo?os=el&dist=7"
sudo yum update
sudo yum install daemontools
```

Or using Ansible:

```yaml
- yum_repository:
    name: daemontools
    description: daemontools
    baseurl: https://packagecloud.io/sinfu/daemontools/el/$releasever/$basearch
    gpgkey: https://packagecloud.io/sinfu/daemontools/gpgkey
    repo_gpgcheck: yes
    gpgcheck: no

- yum:
    name: daemontools
    state: present
```

Supported distribution
----------------------

- RHEL/CentOS 7.x x86_64
- RHEL/CentOS 6.x x86_64/i386
- RHEL/CentOS 5.x x86_64/i386
- CentOS 4.x x86_64/i386

How to use
----------

### Common

Clone daemontools-rpm

```
$ git clone https://github.com/kteru/daemontools-rpm.git
```

Get source code

```
$ cd /path/to/daemontools-rpm
$ wget http://cr.yp.to/daemontools/daemontools-0.76.tar.gz
```

### RHEL/CentOS 7.x

Install requirements

```
$ sudo yum -y install rpm-build redhat-rpm-config make gcc
```

Build/Install rpm

```
$ cd /path/to/daemontools-rpm
$ ./buildrpm.sh
$ sudo rpm -ivh /path/to/daemontools-<VER>-<REL>.<DIST>.<ARCH>.rpm
```

Launch

```
# systemctl enable daemontools.service
# systemctl start daemontools.service
```

### RHEL/CentOS 6.x

Install requirements

```
$ sudo yum -y install rpm-build redhat-rpm-config make gcc
```

Build/Install rpm

```
$ cd /path/to/daemontools-rpm
$ ./buildrpm.sh
$ sudo rpm -ivh /path/to/daemontools-<VER>-<REL>.<DIST>.<ARCH>.rpm
```

Launch

```
# initctl start daemontools
```

### RHEL/CentOS 5.x / CentOS 4.x

Install requirements

```
# yum -y install rpm-build redhat-rpm-config make gcc
```

Build/Install rpm

```
# cd /path/to/daemontools-rpm
# ./buildrpm.sh
# rpm -ivh /path/to/daemontools-<VER>-<REL>.<DIST>.<ARCH>.rpm
```

Launch

```
# /usr/bin/svscanboot &
# jobs
[1]+  Running                 /usr/bin/svscanboot &
# disown %1
```

