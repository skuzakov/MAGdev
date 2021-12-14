FROM debian:10

RUN apt-get update && apt-get install etcd -y && \
    echo "node1" > /etc/hostname     
    
CMD echo 'ETCD_NAME=node1 \n ETCD_DATA_DIR=/var/lib/etcd/default.etcd \n ETCD_LISTEN_PEER_URLS="http://node1:2380" \n ETCD_LISTEN_CLIENT_URLS="http://node1:2379,http://127.0.0.1:2379" \nETCD_INITIAL_ADVERTISE_PEER_URLS="http://node1:2380" \n ETCD_INITIAL_CLUSTER="node1=http://node1:2380,node2=http://node2:2380,node3=http://node3:2380" \n ETCD_INITIAL_CLUSTER_STATE="new" \n ETCD_INITIAL_CLUSTER_TOKEN="etcd-cluster-1" \n ETCD_ADVERTISE_CLIENT_URLS="http://node1:2379"' >> /etc/default/etcd && \
    systemctl restart etcd 
CMD ls


