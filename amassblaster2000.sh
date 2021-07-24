#/bin/bash

#Print usage if no args
if [[ "${#}" -lt 1 ]]
then
	echo
	echo "Usage: ./amassblaster2000.sh target input_file"
	echo
	echo "Example: ./amassblaster2000.sh att file.txt"
	exit 1
fi

#Take input of Target keyword and data to parse
TARGET="${1}"
INFILE="${2}"

#Parse Amass enum output, remove out of scope targets, and return clean file of ASNS
cat ${INFILE} | grep ${TARGET} | sed "s/^ASN:\s//" | cut -d " " -f 1 | sort -u >> ${1}.ASNs

#Rum amass intel with our sorted ASNs and outputs to target.blast
cat ${1}.ASNs | while read line || [[ -n $line ]];
do
	amass intel -asn $line | tee -a ${1}.blast
done

