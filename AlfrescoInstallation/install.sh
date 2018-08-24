#!/bin/sh

#########################################################
#							#
#							#
# 	Installing alfresco 5.2.1 with Solr4 		#
#		Configurations 				#
#	  Global Properties will be changed		#
#							#
#							#
#########################################################


work_dir=${PWD}
echo $work_dir

echo unzippingfile
echo "${workdir}/tomcat7.tar.gz"

if [-d "$/opt/scripttest/alfresco5"]; then 
 	rm -rf /opt/scripttest/alfresco5/
	echo " Removing existing alfresco directory "
	sleep 5
fi	

sleep 3
#tar -xzvf  "$workdir/tomcat7.tar.gz"

#Getting the script path with Readlink module
SCRIPT=$(readlink -f "$0")

echo $SCRIPT

SCRIPTPATH=$(dirname "$SCRIPT")

#Script path for execution
echo $SCRIPTPATH



# Unzipping the Tomcat 7
echo "unzipping the Tomcat 7"
#tar -xzvf tomcat7.tar.gz

######### Unzipping the Tomcat ############
tar -xzvf $SCRIPTPATH/tomcat7.tar.gz
echo "Finished Unzipping the Tomcat 7"


######### Unzipping the Alfresco ##########
echo "unzipping the Alfresco"
unzip $SCRIPTPATH/acs-5.2.1.zip
echo "finish unzipping the Alfresco Content Services"

chmod +x $SCRIPTPATH/db_setup.sql

sh ll

######### Moving alfresco for Test Directory ###############
echo "moving alfresco"
sudo mv alfresco-content-services-distribution-5.2.1/ /opt/scripttest/alfresco5

######### Moving Tomcat for Test Alfresco Home Directory ################
echo "moving tomcat7"
sudo mv apache-tomcat-7.0.82/ /opt/scripttest/alfresco5/tomcat


######### cd if Necessary to change the script ############
# sudo cd /opt/scripttest/alfresco5/web-server/

######## coping the necessary changes for alfresco to get up and running ###################
sudo cp -R /opt/scripttest/alfresco5/web-server/conf/* /opt/scripttest/alfresco5/tomcat/conf
sudo cp -R /opt/scripttest/alfresco5/web-server/lib/* /opt/scripttest/alfresco5/tomcat/lib
sudo mkdir /opt/scripttest/alfresco5/tomcat/shared


######## Changing the Ownership of the directory for any further changes ##################
sudo chown -R mhassen:mhassen /opt/scripttest/


######## Changing the shared directory files for any necessary  #######################
sudo cp -R /opt/scripttest/alfresco5/web-server/shared/* /opt/scripttest/alfresco5/tomcat/shared
sudo cp -R /opt/scripttest/alfresco5/web-server/webapps/* /opt/scripttest/alfresco5/tomcat/webapps/


########################## Global Property Changes
#######################################################################################################################

################## We can Either Modify the existing alfresco global properties or create one and append the changed to it. ##########################
# copying an example of the alfresco global property file in the search
#sudo mv /opt/scripttest/alfresco5/tomcat/shared/classes/alfresco-global.properties.sample /opt/scripttest/alfresco5/tomcat/shared/classes/alfresco-global.properties 

# Creating the alfresco global property file
sudo touch /opt/scripttest/alfresco5/tomcat/shared/classes/alfresco-global.properties

sudo chown -R mhassen:mhassen /opt/scripttest/alfresco5/*
sudo chown -R mhassen:mhassen /opt/scripttest/alfresco5/

# For this instance I am appending the changes to a new file without Editing the existing Alfresco Global Properties file 
# Append the changes to the file

#Adding Properties Dir Root and Dir.keystore  

# Dir Root and keystore settings property 

sleep 5

globaldir=/opt/scripttest/alfresco5/tomcat/shared/classes/

sudo echo "############# Alfresco global Properties ############"  >> ${globaldir}/alfresco-global.properties
sudo echo "dir.root=/opt/scripttest/alfresco5/alf_data" >> ${globaldir}/alfresco-global.properties
sudo echo "dir.keystore=/opt/scripttest/alfresco5/alf_data/keystore" >> ${globaldir}/alfresco-global.properties

# Database properties for the alfresco-global properties

sudo echo "db.name=alfresco" >> ${globaldir}/alfresco-global.properties 
sudo echo "db.username=alfresco" >> ${globaldir}/alfresco-global.properties
sudo echo "db.password=alfresco" >> ${globaldir}/alfresco-global.properties
sudo echo "db.host=localhost" >> ${globaldir}/alfresco-global.properties
sudo echo "db.port=5432" >> ${globaldir}/alfresco-global.properties
sudo echo "db.pool.max=100" >> ${globaldir}/alfresco-global.properties

# Office properties for installation dir

sudo echo "ooo.exe=/opt/libreoffice5.4/program/soffice" >> ${globaldir}/alfresco-global.properties
sudo echo "ooo.enabled=false" >> ${globaldir}/alfresco-global.properties
sudo echo "ooo.port=8100" >> ${globaldir}/alfresco-global.properties
sudo echo "jodconverter.officeHome=/opt/libreoffice5.4" >> ${globaldir}/alfresco-global.properties
sudo echo "jodconverter.maxTasksPerProcess=200" >> ${globaldir}/alfresco-global.properties
sudo echo "jodconverter.portNumbers=2201,2202,2203,2204" >> ${globaldir}/alfresco-global.properties
sudo echo "jodconverter.enabled=true" >> ${globaldir}/alfresco-global.properties
sudo echo "jodconverter.taskExecutionTimeout=120000" >> ${globaldir}/alfresco-global.properties
sudo echo "jodconverter.taskQueueTimeout=30000" >> ${globaldir}/alfresco-global.properties

# db schema settings

sudo echo "db.schema.update=true" >> ${globaldir}/alfresco-global.properties

# Image magic properties

sudo echo "img.root=/opt/ImageMagick" >> ${globaldir}/alfresco-global.properties


# Windows specific enviromental variables are not set here.

# solr 4 configuration 

sudo echo "index.subsystem.name=solr4" >> ${globaldir}/alfresco-global.properties
sudo echo "solr.host=localhost" >> ${globaldir}/alfresco-global.properties
sudo echo "solr.port=8080" >> ${globaldir}/alfresco-global.properties
sudo echo "solr.port.ssl=8453" >> ${globaldir}/alfresco-global.properties
sudo echo "solr.secureComms=https" >> ${globaldir}/alfresco-global.properties


# DB configuration settings
sudo echo "db.driver=org.gjt.mm.mysql.Driver" >> ${globaldir}/alfresco-global.properties
sudo echo "db.url=jdbc:mysql://localhost/alfresco?useUnicode=yes&characterEncoding=UTF-8" >> ${globaldir}/alfresco-global.properties

# Recovery index mode

sudo echo "index.recovery.mode=AUTO" >> ${globaldir}/alfresco-global.properties

alfresco-pdf-renderer.root=/opt/pdf-renderer
sudo echo "alfresco-pdf-renderer.root=/opt/pdf-renderer" >> ${globaldir}/alfresco-global.properties

sudo echo "alfresco-pdf-renderer.exe=${alfresco-pdf-renderer.root}/alfresco-pdf-renderer" >> ${globaldir}/alfresco-global.properties

# Authentication  Chain
sudo echo "authentication.chain=alfrescoNtlm1:alfrescoNtlm" >> ${globaldir}/alfresco-global.properties
sudo echo "alfresco.rmi.services.host=0.0.0.0" >> ${globaldir}/alfresco-global.properties


sudo echo "smart.folders.enabled=true" >> ${globaldir}/alfresco-global.properties
sudo echo "smart.folders.model=alfresco/model/smartfolder-model.xml" >> ${globaldir}/alfresco-global.properties
sudo echo "smart.folders.model.labels=alfresco/messages/smartfolder-model" >> ${globaldir}/alfresco-global.properties

cat ${globaldir}/alfresco-global.properties

sleep 5

echo "done with the configurations"


############## Writing the SQL Query Configuration ##########################

########################################################################################################################
######################## Solr changes Will work if change the necessary properties #####################################
########################################################################################################################

# Before starting the server few changes needs to be done
# Searching for a sentence inside a file change and appending it.
# modify it according to the need

sudo chown -R mhassen:mhassen /opt/scripttest/alfresco5/*
sudo chown -R mhassen:mhassen /opt/scripttest/alfresco5/


# Executing the Database 

echo "Database being creatd"
sh $SCRIPTPATH/db_setup.sql 
sleep 5

# then only we can start the program. 

echo "Alfresco Starting"

sh /opt/scripttest/alfresco5/tomcat/bin/startup.sh

echo "Alfresco Started up"

sleep 5

tail -f /opt/scripttest/alfresco5/tomcat/logs/catalina.out

echo ${PWD}


