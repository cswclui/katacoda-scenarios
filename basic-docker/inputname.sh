#!/bin/bash

if [ ! -f "myname" ]
then
	echo "Please input your student ID:"
	read myname
	echo $myname > myname
fi

if [ ! -f "myid" ]
then
	echo "Please input your studentName:"
	read myid
	echo $id > myid
fi
