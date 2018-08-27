#!/bin/sh

sh /opt/scripttest/alfresco5/tomcat/bin/shutdown.sh

tail -f /opt/scripttest/alfresco5/tomcat/logs/catalina.out


ps -ef | grep tomcat


