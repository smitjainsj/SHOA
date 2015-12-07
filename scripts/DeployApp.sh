#!/bin/bash

function fetchAndDeployArtifact() {

	version=$1
	repository=$2
	echo "Downloading the war from the artifactory server"
	wget --user=admin --password=admin123 "http://23.251.147.16:8081/nexus/service/local/artifact/maven/content?g=Spring3HibernateApp&a=Spring3HibernateApp&v=$snapshotVersion&r=${repository}" -O /tmp/nu113r.war
	wget "http://23.251.147.16:8081/nexus/service/local/artifact/maven/redirect?r=$repository&g=Spring3HibernateApp&a=Spring3HibernateApp&e=war&v=$version" -O /tmp/nu113r.war
	warName="/tmp/nu113r.war"
	stopApp $warName
	startApp 
}

function startApp() {
	
	echo "Going to start the nu113r application"
	service tomcat7 start

}


function stopApp() {
	
	warName=$1
	echo "Going to stop the nu113r application"
	service tomcat7 stop
	rm -rf /usr/share/tomcat7/webapps/ROOT
	unzip $warName -d /usr/share/tomcat7/webapps/ROOT	
}

