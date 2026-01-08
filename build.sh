#!/bin/bash 
echo === Building DevOps Application === 
echo Compiling source files... 
find src -name .java  sources.txt 
javac @sources.txt 
echo Compilation complete. 
echo === Running Tests === 
java -cp srcmainjava com.example.HelloDevOpsTest 
echo Tests completed. 
echo === Creating JAR === 
jar cfe app.jar com.example.HelloDevOps -C srcmainjava . 
echo JAR created app.jar 
echo === Running Application === 
java -jar app.jar 