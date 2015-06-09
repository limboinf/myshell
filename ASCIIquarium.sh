#!/bin/bash
#Ubuntu终端水族馆--以sudo身份运行

sudo apt-get install libcurses-perl;
cd /tmp;
wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.4.tar.gz;
tar -zxvf Term-Animation-2.4.tar.gz;
cd Term-Animation-2.4/;
perl Makefile.PL &&  make &&   make test;
make install;
cd /tmp;
wget http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz;
tar -zxvf asciiquarium.tar.gz;
cd asciiquarium_1.1/;
cp asciiquarium /usr/local/bin;
chmod 0755 /usr/local/bin/asciiquarium;
asciiquarium

