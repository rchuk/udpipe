#!/bin/bash

if [ -z "$1" ]
  then
    echo "Server port must be provided as a first argument"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "Models folder must be provided as a second argument"
    exit 1
fi

python ./udpipe2_server.py "$1" uk uk-iu-ud-2.12-230717:uk_iu-ud-2.12-230717:uk:ukr "$2/uk_iu-ud-2.12-230717.model" uk_iu https://ufal.mff.cuni.cz/udpipe/2/models#universal_dependencies_212_models --preload_models uk
