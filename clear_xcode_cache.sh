#!/usr/bin/env bash

ddd() {
    #Save the starting dir
    startingDir=$PWD

    #Go to the derivedData
    cd ~/Library/Developer/Xcode/DerivedData

    #Sometimes, 1 file remains, so loop until no files remain
    numRemainingFiles=1
    while [ $numRemainingFiles -gt 0 ]; do
        #Delete the files, recursively
        rm -rf *

        #Update file count
        numRemainingFiles=`ls | wc -l`
    done

    echo Done

    #Go back to starting dir
    cd $startingDir
}

# source: http://stackoverflow.com/a/27977848/1163166
