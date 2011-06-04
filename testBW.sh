#!/bin/bash
snap() {
  sed -n 's/eth0: *\([0-9]\+\) .*/\1/p' /proc/net/dev
}

calculKBRate() {
  [ -n "$1" ] && sleep $1 || read
  echo $(date '+%Y%m%d-%H%M%S') $((($(snap) - $snapBegin) / 1024 / ($(date +%s) - $debutTime)))
}

wget -o /dev/null -O /dev/null http://debian.advalem.net/debian-cd/current/amd64/iso-dvd/debian-6.0.1a-amd64-DVD-1.iso &
wget -o /dev/null -O /dev/null http://debian.ens-cachan.fr/ftp/debian-cd/current/amd64/iso-dvd/debian-6.0.1a-amd64-DVD-1.iso &
wget -o /dev/null -O /dev/null http://debian.med.univ-tours.fr/debian-cd/current/amd64/iso-dvd/debian-503-amd64-DVD-1.iso &
wget -o /dev/null -O /dev/null http://debian.mines.inpl-nancy.fr/debian-cd/current/amd64/iso-dvd/debian-6.0.1a-amd64-DVD-1.iso &
wget -o /dev/null -O /dev/null http://debian.mirror.inra.fr/debian-cd/current/amd64/iso-dvd/debian-503-amd64-DVD-1.iso &
wget -o /dev/null -O /dev/null http://mirror.cict.fr/debian-cd/current/amd64/iso-dvd/debian-6.0.1a-amd64-DVD-1.iso &
wget -o /dev/null -O /dev/null http://mirror.linuxmint-fr.net/linuxmint.com/stable/9/linuxmint-9-kde-dvd-i386.iso &
wget -o /dev/null -O /dev/null http://ftp.cica.es/debian-cd/current/amd64/iso-dvd/debian-6.0.1a-amd64-DVD-1.iso &
wget -o /dev/null -O /dev/null http://ftp.gva.es/mirror/debian-cd/current/amd64/iso-dvd/debian-6.0.1a-amd64-DVD-1.iso &
wget -o /dev/null -O /dev/null http://ftp.udc.es/debian-cd/current/amd64/iso-dvd/debian-6.0.1a-amd64-DVD-1.iso &
wget -o /dev/null -O /dev/null http://ftp5.gwdg.de/pub/linux/debian/debian-cd/current/amd64/iso-dvd/debian-6.0.1a-amd64-DVD-1.iso &
wget -o /dev/null -O /dev/null http://ftp.de.debian.org/debian-cd/current/amd64/iso-dvd/debian-6.0.1a-amd64-DVD-1.iso &
wget -o /dev/null -O /dev/null http://ftp.halifax.rwth-aachen.de/debian-cd/current/amd64/iso-dvd/debian-6.0.1a-amd64-DVD-1.iso &
wget -o /dev/null -O /dev/null http://vesta.informatik.rwth-aachen.de/ftp/pub/comp/Linux/debian-cd/current/amd64/iso-dvd/debian-6.0.1a-amd64-DVD-1.iso &
wget -o /dev/null -O /dev/null http://ftp.informatik.uni-frankfurt.de/debian-cd/current/amd64/iso-dvd/debian-6.0.1a-amd64-DVD-1.iso &
wget -o /dev/null -O /dev/null http://ftp-stud.hs-esslingen.de/debian-cd/current/amd64/iso-dvd/debian-6.0.1a-amd64-DVD-1.iso &
wget -o /dev/null -O /dev/null http://ftp.uni-bayreuth.de/debian-cd/current/amd64/iso-dvd/debian-6.0.1a-amd64-DVD-1.iso &
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
for i in {1..17}; do kill %$i; done
#sleep 5; jobs

