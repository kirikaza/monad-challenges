#!/bin/bash

set -o nounset
set -e

cd "$(dirname "$0")"

./check_exercise.sh 1 1 \
  'product fiveRands' \
  'cat' \
  8681089573064486461641871805074254223660

./check_exercise.sh 1 2 \
  randString3 \
  'tr -d "\"\\n" | shasum -a 256 | cut -d" " -f1' \
  9d475eb78d3e38085220ed6ebde9d8f7d26540bb1c8f9382479c3acd4c8c94a3

./check_exercise.sh 1 3 \
  '(fst $ randEven $ mkSeed 1) * (fst $ randOdd $ mkSeed 1) * (fst $ randTen $ mkSeed 1)' \
  'cat' \
  189908109902700

./check_exercise.sh 1 4 \
  'fst $ generalPair2 randLetter rand $ mkSeed 1' \
  'cat' \
  "('l',282475249)"

./check_exercise.sh 1 5 \
  'fst $ repRandom (replicate 3 randLetter) $ mkSeed 1' \
  'tr -d "\"\\n" | shasum -a 256 | cut -d" " -f1' \
  9d475eb78d3e38085220ed6ebde9d8f7d26540bb1c8f9382479c3acd4c8c94a3

./check_exercise.sh 1 6 \
  ':t mkGen' \
  'tr -d "\\n" | xxd -ps | tr "a-f" "A-F"' \
  6D6B47656E203A3A2061202D3E2047656E2061

./check_exercise.sh 2 1 \
  ':i Maybe' \
  'cut -d- -f1 | tr -d "\\t" | sed "s/ $//" | tr -d "\\n" | xxd -ps -c 256 | tr "a-f" "A-F"' \
  64617461204D617962652061203D204E6F7468696E67207C204A7573742061

./check_exercise.sh 2 3 \
'queryGreek greekDataA "alpha"
queryGreek greekDataA "beta"
queryGreek greekDataA "gamma"
queryGreek greekDataA "delta"
queryGreek greekDataA "zeta"
queryGreek greekDataB "rho"
queryGreek greekDataB "phi"
queryGreek greekDataB "chi"
queryGreek greekDataB "psi"
queryGreek greekDataB "omega"' \
  cat \
'Just 2.0
Nothing
Just 3.3333333333333335
Nothing
Nothing
Nothing
Just 0.24528301886792453
Just 9.095238095238095
Nothing
Just 24.0'

