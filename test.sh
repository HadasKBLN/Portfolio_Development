#!/bin/bash

isTestsPassed=$(cat testResult.txt | grep "12 passed")
if [[ -z "$isTestsPassed" ]]; then
    echo 'failaree'
    exit 1
else
    echo '=========== E2E Test Finish with Success =============='
fi
