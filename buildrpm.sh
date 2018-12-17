#!/usr/bin/env bash
DIR_BASE=$(cd ${BASH_SOURCE[0]%/*} && pwd)
set -e

builddir=$(rpm --eval %{_builddir})
rpmdir=$(rpm --eval %{_rpmdir})
sourcedir=$(rpm --eval %{_sourcedir})
specdir=$(rpm --eval %{_specdir})
srcrpmdir=$(rpm --eval %{_srcrpmdir})

mkdir -p ${builddir} ${rpmdir} ${sourcedir} ${specdir} ${srcrpmdir}

cd ${sourcedir}
cp -af ${DIR_BASE}/daemontools-0.76.tar.gz .
cp -af ${DIR_BASE}/daemontools-error.h.patch .
cp -af ${DIR_BASE}/daemontools.conf .
cp -af ${DIR_BASE}/daemontools.service .
cp -af ${DIR_BASE}/svscanboot .
cd - > /dev/null

cd ${specdir}
cp -af ${DIR_BASE}/daemontools.spec .
cd - > /dev/null

rpmbuild -ba --clean ${specdir}/daemontools.spec

