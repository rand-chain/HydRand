#!/bin/bash

# change to aws directory
cd "$(dirname "$0")"
rm -f hydrand-base.zip
rm -f hydrand.zip

# change to directory in which the hydrand.py folder is
cd ../../..

pwd

rm -rf hydrand/logs/*

zip -X -r -9 hydrand/evaluation/aws/hydrand-base.zip -r hydrand/lib     --include '*.py' '*.so'
zip -X -r -9 hydrand/evaluation/aws/hydrand-base.zip -r hydrand/config  --exclude hydrand/config/network/**\*
zip -X -r -9 hydrand/evaluation/aws/hydrand-base.zip -r \
    hydrand/hydrand/ed25519     \
    hydrand/hydrand/ed25519_ref \
    --include '*.py' '*.txt'

# zip -X -r -9 hydrand/evaluation/aws/hydrand.zip hydrand/logs
zip -X -r -9 hydrand/evaluation/aws/hydrand.zip hydrand/config/network
zip -X -r -9 hydrand/evaluation/aws/hydrand.zip hydrand/hydrand/*.py
# zip -X -r -9 hydrand/evaluation/aws/hydrand.zip hydrand/testing