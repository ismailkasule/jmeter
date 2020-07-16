#!/bin/bash
#
# Reporting dir: start fresh
R_DIR=./report
rm -rf ./report
mkdir -p ./report

rm -f ./test-plan.jtl ./jmeter.log

/jmeter/run.sh /jmeter -Dlog_level.jmeter=DEBUG \
	-Jhost=dev-riskmarketplace.standardbank.co.za \
	-n -t /jmeter/RMP_CreateIncident.jmx -l ./test-plan.jtl -j ./jmeter.log \
	-e -o ./report

echo "==== jmeter.log ===="
cat ./jmeter.log

echo "==== Raw Test Report ===="
cat ./test-plan.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in ./report/index.html"