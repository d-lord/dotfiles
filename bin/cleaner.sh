#!/bin/bash
# offer to `git rm` ghostly submodules
# (I'm not sure how this happened or whether this is the best solution)

# do-while loops don't exist in bash
output=$(git submodule update --init --recursive 2>&1)
while [[ "$?" == 1 ]]; do
    submod=$(echo "$output" | sed -E "s/.* for path '(.*)'/\1/")
    echo "$submod"
    read -e -p "Delete this? " goahead
    if [[ "$goahead" == "y" ]]; then
	git rm --cached "$submod"
    fi
    output=$(git submodule update --init --recursive 2>&1)
done
