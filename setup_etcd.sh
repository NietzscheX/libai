mkdir -p /tmp/etcd && cd /tmp/etcd

os_arch=$(uname -m)
latest_version_url=$(curl -s https://api.github.com/repos/etcd-io/etcd/releases/latest   | grep browser_download_url   | grep linux-amd64   | cut -d '"' -f 4 )
latest_file=$(echo $latest_version_url | awk -F"/" '{print $NF}')
if [ -e $latest_file ]; then
  echo "file exist"
else
  wget  $latest_version_url	
fi

tar xvf *.tar.gz
cd etcd-*/
mv etcd* /usr/local/bin/


groupadd --system etcd
useradd -s /sbin/nologin --system -g etcd etcd
mkdir -p /var/lib/etcd/
mkdir -p /etc/etcd
chown -R etcd:etcd /var/lib/etcd/
INT_NAME="eth0"
ETCD_HOST_IP=$(ip addr show $INT_NAME | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
ETCD_NAME=$(hostname -s)

cat <<EOF | sudo tee /etc/systemd/system/etcd.service
[Unit]
Description=etcd service
Documentation=https://github.com/etcd-io/etcd

[Service]
Type=notify
User=etcd
ExecStart=/usr/local/bin/etcd \\
  --name ${ETCD_NAME} \\
  --data-dir=/var/lib/etcd \\
  --initial-advertise-peer-urls http://${ETCD_HOST_IP}:2380 \\
  --listen-peer-urls http://${ETCD_HOST_IP}:2380 \\
  --listen-client-urls http://${ETCD_HOST_IP}:2379,http://127.0.0.1:2379 \\
  --advertise-client-urls http://${ETCD_HOST_IP}:2379 \\
  --initial-cluster-token etcd-cluster-0 \\
  --initial-cluster etcd1=http://etcd1:2380,etcd2=http://etcd2:2380,etcd3=http://etcd3:2380 \\
  --initial-cluster-state new \

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable etcd
systemctl start etcd
systemctl status etcd
