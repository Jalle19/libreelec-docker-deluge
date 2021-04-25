# Change log

### 4.0.0
  - base the image on ubuntu:20.04
  - update Deluge to 2.0.3

### 3.0.1
  - fix a deprecation notice in the Dockerfile

### 3.0.0
  - base the image on ubuntu:bionic instead of Alpine Linux which keeps breaking all the time

### 2.0.1
  - fix "empty continuation line" Docker warnings

### 2.0.0
  - add support for ARM too, unify the build system to be the same regardless of architecture
  - base the image on alpine:3.8 instead of alpine:edge, fixes recent build failures
  - download the Deluge source code over HTTPS

### 1.1.2
  - fix invalid state handling which could lead to lost torrent state after a reboot

### 1.1.1
  - actually update version.txt so the Docker container gets tagged correctly

### 1.1.0
  - updated Deluge to 1.3.15
  - use alpine/edge as base to fix some dependency issues 

### 1.0.2
  - initial release
