#!/bin/bash

set -o nounset
set -e

cd "$(dirname "$0")"

./check_exercise.sh 1 1 \
  fiveRands \
  'tr " " "*" | bc' \
  8681089573064486461641871805074254223660

./check_exercise.sh 1 2 \
  randString3 \
  'tr -d "\\n" | shasum -a 256 | cut -d" " -f1' \
  9d475eb78d3e38085220ed6ebde9d8f7d26540bb1c8f9382479c3acd4c8c94a3

./check_exercise.sh 1 3 \
  '[fst $ randEven $ mkSeed 1, fst $ randOdd $ mkSeed 1, fst $ randTen $ mkSeed 1]' \
  'tr " " "*" | bc' \
  189908109902700

./check_exercise.sh 1 4 \
  'fst $ generalPair2 randLetter rand $ mkSeed 1' \
  'cat' \
  "('l' 282475249)"
