#!/bin/bash

if [ -z $1 ]; then
    echo "ERROR: Please specify a port to forward from"
    echo "USAGE: kube-forward from-port [to-port]" 
    exit 1
elif [ -z $2 ]; then
    to_port=$1
    from_port=$1
else
    to_port=$2
    from_port=$1
fi

kubectl port-forward -n bi $(kubectl get -n bi pods | fzf | cut -f 1 -d ' ') $to_port:$from_port
