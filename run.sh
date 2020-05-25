#!/usr/bin/env bash

# eval_type=$1

# echo $eval_type

# if [[ $eval_type == *"UNIT"* ]]; then
#	echo "abcd"
#	mvn clean surefire-report:report 
# fi

#if [[ $eval_type == *"MUTATION"* ]]; then
#	echo "abcdef"
#	mvn org.pitest:pitest-maven:mutationCoverage
#fi

mvn clean surefire-report:report 
mvn org.pitest:pitest-maven:mutationCoverage
java -Xmx256m -jar target/spring-boot-in-docker.jar