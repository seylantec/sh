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


################## Modifying the alfresco global properties ##########################
# copying an example of the alfresco global property file in the search
sudo mv /opt/scripttest/alfresco5/tomcat/shared/classes/alfresco-global.properties.sample /opt/scripttest/alfresco5/tomcat/shared/classes/alfresco-global.properties 













# Before starting the server few changes needs to be done
# Searching for a sentence inside a file change and appending it.
# modify it according to the need










# then only we can start the program. 
# sh /opt/scripttest/alfresco5/tomcat/bin/startup.sh

# tail -f /opt/scripttest/alfresco5/tomcat/logs/catalina.out

echo ${PWD}







