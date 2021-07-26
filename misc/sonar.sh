#!/bin/bash
month=$(date +'%b')
echo "Application,month,blocker_violations,critical_violations,major_violations,technical_debt_days,TotalLOC,LinesToCover,LinesUncovered"
for i in `curl -X GET http://some.sonar.server:9003/api/components/search?qualifiers=TRK |jq '.components[] .key'|sed 's/"//g'|egrep -v "configuration-service|file-scan|integration"`;do
 vul=$(curl -sX GET "http://some.sonar.server:9003/api/issues/search?projectKeys={$i}&types=VULNERABILITY")
 bug=$(curl -sX GET "http://some.sonar.server:9003/api/issues/search?projectKeys={$i}&types=BUG")
 loc=$(curl -sX GET "http://some.sonar.server:9003/api/measures/search?projectKeys={$i}&metricKeys=ncloc")
 ltc=$(curl -sX GET "http://some.sonar.server:9003/api/measures/search?projectKeys={$i}&metricKeys=lines_to_cover")
 luc=$(curl -sX GET "http://some.sonar.server:9003/api/measures/search?projectKeys={$i}&metricKeys=uncovered_lines")
 cov=$(curl -sX GET "http://some.sonar.server:9003/api/measures/search?projectKeys={$i}&metricKeys=coverage")
 #debt=$(curl -sX GET "http://some.sonar.server:9003/api/measures/search?projectKeys={$i}&metricKeys=technical_debt")
 majv=$(curl -sX GET "http://some.sonar.server:9003/api/measures/search?projectKeys={$i}&metricKeys=major_violations")
 critv=$(curl -sX GET "http://some.sonar.server:9003/api/measures/search?projectKeys={$i}&metricKeys=critical_violations")
 blockerv=$(curl -sX GET "http://some.sonar.server:9003/api/measures/search?projectKeys={$i}&metricKeys=blocker_violations")
 techdebt=$(curl -sX GET "http://some.sonar.server:9003/api/measures/search?projectKeys={$i}&metricKeys=new_technical_debt")
 no_vul=$(echo $vul | jq -r .total); # total vulnerabilities
 no_bug=$(echo $bug | jq -r .total); # total number of bugs
 no_loc=$(echo $loc | jq -r .measures[].value); # total lines of code
 no_ltc=$(echo $ltc | jq -r .measures[].value); # total lines to cover
 no_luc=$(echo $luc | jq -r .measures[].value); # total lines uncovered
 no_coverage=$(echo $cov | jq -r .measures[].value); # Coverage
 no_majorv=$(echo $majv | jq -r .measures[].value);
 no_critv=$(echo $critv | jq -r .measures[].value);
 no_blockerv=$(echo $blockerv | jq -r .measures[].value);
 no_debt=$(echo $cov | jq -r .measures[].value);
 tech_debt_minutes=$(echo $techdebt |jq '.measures[] .period.value|tonumber');
 tech_debt_days=$(awk -v awkcal="$tech_debt_minutes" 'BEGIN {print (awkcal/60)/8}')
 noomni=$(echo $i |sed 's/omnichannel://g');
 echo "$noomni","$month","$no_blockerv","$no_critv","$no_majorv","$tech_debt_days","$no_loc","$no_ltc","$no_luc"
done
