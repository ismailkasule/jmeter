#!/bin/bash
#
# Reporting dir: start fresh
R_DIR=./report
rm -rf ./report
mkdir -p jmeter/jmeter/report

rm -f ./test-plan.jtl ./jmeter.log

./jmeter/jmeter/run.sh jmeter/jmeter -Dlog_level.jmeter=DEBUG \
	-Jhost=dev-riskmarketplace.standardbank.co.za \
	-n -t jmeter/jmeter/RMP_CreateIncident.jmx -l jmeter/jmeter/test-plan.jtl -j jmeter/jmeter/jmeter.log \
	-e -o jmeter/jmeter/report

echo "==== jmeter.log ===="
cat jmeter/jmeter/jmeter.log

echo "==== Raw Test Report ===="
cat jmeter/jmeter/test-plan.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in ./report/index.html"