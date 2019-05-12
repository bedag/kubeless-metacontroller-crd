#!/bin/sh

ROOT="${1:-.}"
DEST="${2}"

for castfile in $(find "${ROOT}" -iname '*.cast')
do
  BASE64=$(base64 "${castfile}" | tr -d '\n')
  RESULT="data:text/plain;base64, ${BASE64}"
  NAME=$(basename "${castfile}")
  sed -i -e "s|src=\"[^\"]*${NAME}\"|src=\"${RESULT}\"|g" ${DEST}
done
