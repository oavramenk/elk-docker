#!/bin/bash

readonly basedir=/opt/beats
readonly metricbeat_version=metricbeat-8.2.0-linux-x86_64

curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/${metricbeat_version}.tar.gz
mkdir -p ${basedir} && tar xzvf ${metricbeat_version}.tar.gz -C ${basedir}

# Copy configuration file for metricbeat
cp additional/config/metricbeat.yml ${basedir}/${metricbeat_version}

# setup Kibana dashboards and start metricbeat
cd ${basedir}/${metricbeat_version}
./metricbeat setup -e
./metricbeat -e