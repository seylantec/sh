#Getting the script path with Readlink module                                                                                                                                                                                    
SCRIPT=$(readlink -f "$0")                                                                                                                                                                                                       
                                                                                                                                                                                                                                 
echo $SCRIPT                                                                                                                                                                                                                     
                                                                                                                                                                                                                                 
WORKPATH=$(dirname "$SCRIPT")                                                                                                                                                                                                  
                                                                                                                                                                                                                                 
#Script path for execution                                                                                                                                                                                                       
echo $SCRIPTPATH

alfrescoscripthome=/opt/scripttest/alfresco5

sleep 5

echo "Removing the alfresco home directory"
rm -rf $alfrescoscripthome

echo "Removing the database prorperties"

sleep 5

#mysql -h localhost -u alfresco -p alfresco  alfresco  < db_remove.sql

echo "Removing the database"
sleep 5
mysql -u root -p < $WORKPATH/db_remove.sql 	
echo "Removed database "

                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                 
                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                                                                                                                
