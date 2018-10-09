#!/bin/bash

# es-index-clear

LAST_DATA=`date +%Y.%m.%d -d "7 days ago"`

curl -XDELETE "192.168.1.100:9200/*-${LAST_DATA}"
