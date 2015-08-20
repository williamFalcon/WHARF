#print welcome
clear
echo ""
echo "================================"
echo "WELCOME TO WILL'S ANYWHERE WIFI"
echo "================================"

#Check own MAC Address
echo "We're going to get wifi by pretending to be another computer..."
own=$(ifconfig en1 | grep ether)
echo "We'll change your MAC address $own to one whitelisted by the network :)"

#see others on the network
echo "Let's see who else is connected..."
friends=( $(arp -a) )
count=${#friends[@]}
echo  "Found $count devices on this network!! :)"

#Compile all MAC addresses into an array
echo "Let's see which one connects..."
macs=()
for adr in "${friends[@]}"
do
	[[ "$adr" =~ ^([a-fA-F0-9]{2}:){5}[a-zA-Z0-9]{2}$ ]] && macs=( "${macs[@]}" "$adr" )
done
#RESULT="`wget -qO- http://example.com`"
#spoof each address until we connect
for adr in "${macs[@]}"
do
	echo "Pretending to be device: $adr..."
	#change address
	#download file and check size
	#if size > x then open webpage in browser to show success and break

done