
jmeter -n -j jmeter.log -t camunda.jmx -Jrampup=$1 -Jusers=$2
cat test.csv