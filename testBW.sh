#!/bin/bash
snap() {
  sed -n 's/ eth0: *\([0-9]\+\) .*/\1/p' /proc/net/dev
}

calculKBRate() {
  [ -n "$1" ] && sleep $1 || read
  echo $(date '+%Y%m%d-%H%M%S') $((($(snap) - $snapBegin) / 1024 / ($(date +%s) - $debutTime)))
}

for serveur in debian.advalem.net debian.ens-cachan.fr debian.mines.inpl-nancy.fr mirror.cict.fr ftp.cica.es ftp.udc.es ftp.de.debian.org ftp.halifax.rwth-aachen.de ftp.informatik.uni-frankfurt.de ftp-stud.hs-esslingen.de ftp.uni-bayreuth.de; do
  wget -o /dev/null -O /dev/null 'http://'$serveur'/debian-cd/current/amd64/iso-dvd/debian-6.0.1a-amd64-DVD-1.iso' &
done

sleep 20
#jobs
snapBegin=$(snap)
debutTime=$(date +%s)
[ "$1" != "predef" ] && calculKBRate $1 || {
  $(calculKBRate 10)
  $(calculKBRate 10)
  $(calculKBRate 10)
  $(calculKBRate 30)
  $(calculKBRate 30)
  $(calculKBRate 30)
}
for i in {1..11}; do kill %$i; done
#sleep 5; jobs

