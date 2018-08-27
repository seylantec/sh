#!/bin/sh

# Instructions to Install Solr4 with alfresco5.2.1 

# Files to modify before starting solr installation. 

# Copy the necessary files in the directory

# SolrArchive Home
alfrescoscripthome=/opt/scripttest/alfresco5/solr4

alfrescotomcathome=/opt/scripttest/alfresco5/tomcat

# copy the context file for the exact location

sudo cp $alfrescoscripthome/context.xml $alfrescotomcathome/conf/Catalina/localhost/context.xml

sudo mv $alfrescotomcathome/conf/Catalina/localhost/context.xml $alfrescotomcathome/conf/Catalina/localhost/solr4.xml
chown -R mhassen:mhassen /opt/scripttest/alfresco5/solr4

#Modifying the context.xml file

awk '{gsub("@@ALFRESCO_SOLR4_DIR@@","/opt/scripttest/alfresco5/solr4")}1' ${alfrescotomcathome}/conf/Catalina/localhost/solr4.xml > ${alfrescotomcathome}/conf/Catalina/localhost/solr4.xml.back 

mv ${alfrescotomcathome}/conf/Catalina/localhost/solr4.xml.back ${alfrescotomcathome}/conf/Catalina/localhost/solr4.xml

awk '{gsub("@@ALFRESCO_SOLR4_MODEL_DIR@@", /opt/scripttest/alfresco5/alf_data/solr4/model)}1' ${alfrescotomcathome}/conf/Catalina/localhost/solr4.xml > ${alfrescotomcathome}/conf/Catalina/localhost/solr4.xml.back

mv ${alfrescotomcathome}/conf/Catalina/localhost/solr4.xml.back ${alfrescotomcathome}/conf/Catalina/localhost/solr4.xml

awk '{gsub("@@ALFRESCO_SOLR4_CONTENT_DIR@@", /opt/scripttest/alfresco5/alf_data/solr4/content)}1' ${alfrescotomcathome}/conf/Catalina/localhost/solr4.xml > ${alfrescotomcathome}/conf/Catalina/localhost/solr4.xml.back

mv ${alfrescotomcathome}/conf/Catalina/localhost/solr4.xml.back ${alfrescotomcathome}/conf/Catalina/localhost/solr4.xml


sed -i '94i\<Connector port="8443" protocol="org.apache.coyote.http11.Http11Protocol"
      SSLEnabled="true" maxThreads="150" scheme="https"
      keystoreFile="<ALFRESCO_HOME>/alf_data/keystore/ssl.keystore"
      keystorePass="kT9X6oe68t" keystoreType="JCEKS" secure="true" connectionTimeout="240000"
      truststoreFile="<ALFRESCO_HOME>/alf_data/keystore/ssl.truststore"
      truststorePass="kT9X6oe68t" truststoreType="JCEKS" clientAuth="want" sslProtocol="TLS"/>  ' ${alfrescotomcathome}/conf/server.xml


sed -i '41i\<user username="CN=Alfresco Repository, OU=Unknown, O=Alfresco Software Ltd., L=Maidenhead, ST=UK, C=GB" roles="repository" password="null"/> <user username="CN=Alfresco Repository Client, OU=Unknown, O=Alfresco Software Ltd., L=Maidenhead, ST=UK, C=GB" roles="repoclient" password="null"/> </tomcat-users>' ${alfrescotomcathome}/conf/tomcat-users.xml


cat ${alfrescotomcathome}/conf/server.xml
