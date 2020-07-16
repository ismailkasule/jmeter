#!/bin/bash
#
rootPath=$1
testFile=$2
host=$3

T_DIR=.

# Reporting dir: start fresh
R_DIR=./report
rm -rf ./report
mkdir -p ./report

rm -f ./test-plan.jtl ./jmeter.log

./run.sh /jmeter/jmeter -Dlog_level.jmeter=DEBUG \
	-Jhost=dev-riskmarketplace.standardbank.co.za \
	-n -t /test/RMP_CreateIncident.jmx -l ./test-plan.jtl -j ./jmeter.log \
	-e -o ./report

echo "==== jmeter.log ===="
cat ./jmeter.log

echo "==== Raw Test Report ===="
cat ./test-plan.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in $R_DIR/index.html"f