#!/bin/sh

echo PatternSearching

#port=`grep -w "port=8080" | cut -d '=' -f 2`

#sed "s/\($port)/"


# Example of replacing 
# 	
# sed "s/\(DEV_2_TARGET_DATABASE=\)\(.*\)/\1newdb/g" file


grep "shared.loader=" server.xml

# This did not work
# sed "s/\(shared.loader=\)\(.*\)/\1${catalina.base}/shared/classes,${catalina.base}/shared/lib/*.jar/g" server.xml

#catbase=${catalina.base}/shared/classes,${catalina.base}/shared/lib/*.jar

#sed `s/\(shared.loader=\)\(.*\)/\1$catbase/g` server.xml


#cat server.xml

grep -r1 'shared.loader=' catalina.properties | xargs sed -i 's/shared.loader=/shared.loader=${catalina.base}/shared/classes,${catalina.base}/shared/lib/*.jar'


grep "shared.loader="  catalina.properties




