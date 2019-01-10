#!/bin/bash

export HOST_MAIN="*:5000"
export HOST_1="*:5001"
export HOST_2="*:5002"

if [[ "$1" == "mainstay" ]]; then
    echo "Running attestation"
    mainstay
elif [[ "$1" == "signer1" ]]; then
    echo "Running signer 1"
    go run $GOPATH/src/mainstay/cmd/txsigningtool/txsigningtool.go -pk $PRIV_1 -pkTopup $PRIV_TOPUP_1 -host $HOST_1 -hostMain $HOST_MAIN
elif [[ "$1" == "signer2" ]]; then
    echo "Running signer 2"
    go run $GOPATH/src/mainstay/cmd/txsigningtool/txsigningtool.go -pk $PRIV_2 -pkTopup $PRIV_TOPUP_2 -host $HOST_2 -hostMain $HOST_MAIN
else
  $@
fi
