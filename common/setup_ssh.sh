
echo adding ssh key authorized_keys

cat /Users/M/.ssh/id_rsa.pub | "mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys"
