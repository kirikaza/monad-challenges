#!/bin/bash

set -o nounset
set -e

cd "$(dirname "$0")"

set_number="$1"
test "$set_number" -gt 0

exercise_number="$2"
test "$exercise_number" -gt 0

haskell_expr="$3"
test -n "$haskell_expr"

bash_trans="$4"
test -n "$bash_trans"

answer="$5"
test -n "$answer"

set_name="Set$set_number"

set_file="src/Set$set_number.hs"
test -f "$set_file"

haskell_result=$(
  stack exec ghci -- "$set_file" <<< "$haskell_expr" |
    sed -n "s/^[*]$set_name> //p" |
      grep -Fxv 'Leaving GHCi.'
)

simplified_result=$()

result=$(
  eval "$bash_trans" <<< "$haskell_result"
)

echo >&2 -n "Exercise $set_number.$exercise_number is "
if [ "$answer" = "$result" ] ; then
  echo >&2 "correct"
  exit 0
else
  echo >&2 -e "incorrect:\n\tright answer is\n\t\t$answer\n\tbut actual result is\n\t\t$result"
  exit 1
fi
