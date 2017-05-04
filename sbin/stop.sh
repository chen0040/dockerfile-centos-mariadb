#!/bin/bash

ps -wef | grep mysql | grep -v grep | awk '{print $2}' | xargs kill -9

