#!/bin/bash

# Checking if there are updates

# Apply Updates
yum -y upgrade
yum -y update
yum -y clean all

# Run OpenScap

yum install -y openscap openscap-utils scap-security-guide

# Running openscap profile

oscap xccdf eval --remediate --profile xccdf_org.ssgproject.content_profile_pci-dss --fetch-remote-resources  /usr/share/xml/scap/ssg/content/ssg-centos7-ds.xml

# Cleaning up openscap

yum -y autoremove openscap openscap-utils scap-security-guide
