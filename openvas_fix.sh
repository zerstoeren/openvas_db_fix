#!/bin/bash

echo stopping services... please wait!
service openvas-manager stop
service openvas-scanner stop
service greenbone-security-assistant stop

echo rebuilding manager db... please wait!

openvassd
openvasmd --rebuild

echo start service... please wait!

killall openvassd
service openvas-manager start
service openvas-scanner start
service greenbone-security-assistant start
