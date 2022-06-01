#!/bin/bash

readonly basedir=/opt/beats

curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-8.2.0-linux-x86_64.tar.gz
mkdir -p ${basedir} && tar xzvf metricbeat-8.2.0-linux-x86_64.tar.gz -C ${basedir}/metricbeat

# Copy configuration file for metricbeat
cp additional/config/metricbeat.yml ${basedir}/metricbeat

# setup Kibana dashboards and start metricbeat
metricbeat setup -e
${basedir}/metricbeat/metricbeat -e