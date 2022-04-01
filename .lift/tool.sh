#!/usr/bin/env bash
function run() {
    for i in $(git ls-files | grep -v lift) ; do
        if ! jq $i >/dev/null 2>/dev/null ; then
            echo "[ { \"type\" : \"bad json\", \"file\" : \"$i\", \"line\": 1,                      \"message\" : \"JSON is many things, but it is not this.\",                      \"details_url\": null } ]"
            exit 0
        fi
    done
    echo "[ ]" ; exit 0
}

[[ "$3" = "version" ]] && echo "1"
[[ "$3" = "applicable" ]] && echo "true"
[[ "$3" = "run" ]] && run
[[ -z "$3" ]] && echo '{ "version" : 1, "name" : "json-verifier" }'
