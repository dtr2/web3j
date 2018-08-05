#!/bin/bash -xe
#run source generators (e.g for Tuples)
#set -euxo pipefail

VER=web3j-3.5.1

./gradlew distZ && rm -rf $VER && unzip -q console/build/distributions/$VER
echo '*' > $VER/.gitignore

CP=`echo */build/classes/java/main $VER/lib/* |sed -e 's/ /:/g'`
java -cp $CP org.web3j.codegen.TupleGenerator

