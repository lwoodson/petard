#!/bin/bash
waitforservices
exec rspec /qa/test.rspec
