#!/bin/zsh

here="${${(%):-%x}:A:h}"

# getvar <name> | Read a value from info.plist
getvar() {
    local v="$1"
    /usr/libexec/PlistBuddy -c "Print :$v" info.plist
}

export alfred_workflow_bundleid=$( getvar "bundleid" )
export alfred_workflow_version=$( getvar "version" )
export alfred_workflow_name=$( getvar "name" )
export alfred_debug=1

export alfred_workflow_cache="${HOME}/Library/Caches/com.runningwithcrayons.Alfred/Workflow Data/${alfred_workflow_bundleid}"
export alfred_workflow_data="${HOME}/Library/Application Support/Alfred/Workflow Data/${alfred_workflow_bundleid}"

mkdir -p "${alfred_workflow_data}"
mkdir -p "${alfred_workflow_cache}"

exec "${here}/firefox" serve

