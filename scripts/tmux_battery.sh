#!/bin/bash

pmset -g batt | grep -o '[0-9]\+%'
