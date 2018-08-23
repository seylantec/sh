#!/bin/sh

#echo "hello"

# echo sed -n '/shared.loader/p' server.xml

#sed 's/shared.loader=/shared.loader=hello' server.xml > server.xml

#cat server.xml

# To edit in the save place we want to writie 

# sed -i 's/shared.loader=/shared.loader="hello"' catalina.properties

# grep "shared.loader" catalina.properties

#sed -i '\|#ServerRoot "/etc/apache2"| {N;s|\n$|\nServerName localhost|}' /etc/apache2/apache2.conf

#sed -i '\|#shared.loader= "catalina.properties"| {N;s|\n$|\nshared.loader= localhost|}' catalina.properties

#sleep 5

#cat catalina.properties


# Writing proper search script


#awk { gsub(/"shared.loader="/, "shared.loader=hello"); print}

#grep "shared.loader=" catalina.properties

#awk { gsub(/shared.loader=/, "shared.loader=hello"); print } catalina.properties

#sleep 5



# Working example of the file in the awk /
#awk '/shared.loader/' catalina.properties

# awk '{ sub(/shared.loader=/, "shared.loader=${catalina.base}/shared/classes,${catalina.base}/shared/lib/*.jar");print }' catalina.properties

# sleep 5

# echo "checking for shared line"


#awk '{ gsub(/shared.loader=/,"shared.loader=${catalina.base}/shared/classes,${catalina.base}/shared/lib/*.jar"); print }' catalina.properties

#grep "shared.loader" catalina.properties

#sleep 5

#gawk '{ $0 = gensub(/shared.loader=/ "shared.loader=${catalina.base}/shared/classes,${catalina.base}/shared/lib/*.jar",0); print}' catalina.properties

#sleep 5

#cat catalina.properties

awk '{gsub("shared.loader=", "shared.loader=${catalina.base}/shared/classes,${catalina.base}/shared/lib/*.jar")}1' catalina.properties > catalina.properties.temp 

sleep 5 

mv  catalina.properties.temp  catalina.properties 






























