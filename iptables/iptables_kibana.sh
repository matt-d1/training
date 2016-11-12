

# Remove IPTables drop rules
        ./iptables_remove_drop.sh

# Need to add nginx as reverse proxy for security, until them allow 5601

# Allow http connection to kibana

	sudo iptables -A INPUT -p tcp -s 10.0.0.0/32 --dport 5601 -j ACCEPT

# Add IPTables drop rules
	./iptables_drop.sh
