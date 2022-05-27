#!/bin/bash

vi /usr/local/opnsense/version/core

if [ ICCN in core ]
then
    echo "Already there!!"
else
    echo "Please change!!!"
