#!/bin/sh

SHARED_FOLDER=/shared
# check if shared folder exist
if [ -d $SHARED_FOLDER ]
then
    echo "$SHARED_FOLDER set."
else
    echo "Error: $SHARED_FOLDER must be set" 
    exit 1
fi

# always copy config.yaml and target.py from shared folder if exist
TARGET_FILE=/shared/target.py
TARGET_DEST=/rsyscall_fuzzer/controller/rscfuzzer/
if test -f "$TARGET_FILE"; then
    cp $TARGET_FILE $TARGET_DEST
    echo "$TARGET_FILE updated"
else
    echo "$TARGET_FILE dose not exist, use the default one"
fi

cd /rsyscall_fuzzer/controller/
echo $#
if [ $# -eq 0 ]
  then
    echo "No arguments supplied, run test..."
    /rsyscall_fuzzer/controller/main.py -c /test_config.yaml -d -e docker_test
    exit 0
else
    /rsyscall_fuzzer/controller/main.py $@
fi

