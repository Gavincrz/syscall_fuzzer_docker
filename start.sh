#!/bin/sh

SHARED_FOLDER=/shared
# check if shared folder exist
[ -d $SHARED_FOLDER ] && echo "$SHARED_FOLDER set." || echo "Error: $SHARED_FOLDER must be set" && exit 1

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

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, run test..."
    /rsyscall_fuzzer/controller/main.py -c /test_config.yaml -e docker_test
    exit 0
else
    /rsyscall_fuzzer/controller/main.py $@
fi

