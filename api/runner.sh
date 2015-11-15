#!/bin/bash
waitforservices
exec ruby /app/app.rb
