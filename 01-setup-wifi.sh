echo "Generates the actual key used to authenticate on your WPA secured network"
wpa_passphrase $0 $1 > /etc/wpa_supplicant.conf

echo "Restarts WPA Supplicant, which gives us WiFi for now"
systemctl restart wpa_supplicant.service