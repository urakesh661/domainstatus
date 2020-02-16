#!/bin/bash

start_time=$(date +%s)

echo -n "Enter location of domains file: "
read location

#Check for no response
if [[ (-z $location) || (! -f $location) ]];then
	echo "You did not provide a domain list or the location of file is invalid!"
	exit
fi

echo -n "Enter the response code which you would like to filter from the curl result:: "
read response


for i in $(cat $location);do
	curl -o /dev/null  -s -w  "%{http_code} %{url_effective}\n" --connect-timeout 1 --max-time 1   $i | grep $response
done

end_time=$(date +%s)
time_diff=$(( $end_time - $start_time ))
echo "Total time taken by script $time_diff seconds"











