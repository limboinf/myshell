#!/bin/bash

type sz >/dev/null 2>&1 || (wget https://ohse.de/uwe/releases/lrzsz-0.12.20.tar.gz && tar -xzvf lrzsz-0.12.20.tar.gz && cd lrzsz-0.12.20 && ./configure && make && make install && ln -s /usr/local/bin/lrz /usr/bin/rz && ln -s /usr/local/bin/lsz /usr/bin/sz && cd - && echo "install lrzsz successful!")
