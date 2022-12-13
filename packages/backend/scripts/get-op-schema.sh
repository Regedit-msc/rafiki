#!/bin/bash

## https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
OUTDIR=$( cd -P "$( dirname "$SOURCE" )/../src/openapi" >/dev/null 2>&1 && pwd )

curl -o "$OUTDIR/resource-server.yaml" https://raw.githubusercontent.com/interledger/open-payments/ae0e924a56fe9f12834f65da109a1042760c1605/openapi/resource-server.yaml
curl -o "$OUTDIR/schemas.yaml" https://raw.githubusercontent.com/interledger/open-payments/ae0e924a56fe9f12834f65da109a1042760c1605/openapi/schemas.yaml