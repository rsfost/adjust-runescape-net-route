$world = 474
$gateway = "172.20.10.1"

$domain = "oldschool$($world - 300).runescape.com"
$dnsResp = Resolve-DnsName -Name $domain -Type A

echo "Original routing table"
route -4 print
route delete 0.0.0.0 mask 0.0.0.0 $gateway
route add $dnsResp.IP4Address mask 255.255.255.255 $gateway metric 1
echo "New routing table"
route -4 print
