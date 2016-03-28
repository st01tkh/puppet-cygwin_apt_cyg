# cygwin_apt_cyg

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with cygwin_apt_cyg](#setup)
    * [What cygwin_apt_cyg affects](#what-cygwin_apt_cyg-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with cygwin_apt_cyg](#beginning-with-cygwin_apt_cyg)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Puppet module to setup apt-cyg for CygWin


## Module Description

apt-cyg for CygWin

## Setup

include cygwin_apt_cyg

### What cygwin_apt_cyg affects

* Creates /vendor directory if it does not exist
* Creates /vendor/apt-cyg directory if it does not exist
* Downloads apt-cyg into /vendor/apt-cyg/apt-cyg
* Makes apt-cyg executable
* Creates symlink(s) from /usr/local/bin/apt-cyg to /vendor/apt-cyg/apt-cyg


### Setup Requirements **OPTIONAL**

Puppet modules requiered: 
* voxpupuli-puppet-download_url
* puppetslab-stdlib


### Beginning with cygwin_apt_cyg


## Usage

Just do this:
include cygwin_apt_cyg


## Reference

## Limitations

## Development

## Release Notes/Contributors/Etc **Optional**
