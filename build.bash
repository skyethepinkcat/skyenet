#!/bin/bash

buildruby=$(readlink -f build.rb)


for e in $(find . -name "*.erb");do
  cd $(dirname $e)
  e=$(basename $e)
  $buildruby $(basename $e) > $(cut -f 1 -d '.' <(echo $e)).html
done
