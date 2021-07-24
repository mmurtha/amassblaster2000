# amassblaster2000
This script takes raw output file from amass enum, parses out the ASN numbers and feeds them into amass intel.

Usage: ./amassblaster2000.sh target input_file

Output: target.ASNs (list of ASNS) and target.blast (output of amass intel -asn for said list)
