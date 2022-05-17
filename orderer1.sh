#!/usr/bin/env sh
set -eu

# look for binaries in local dev environment /build/bin directory and then in local samples /bin directory
export PATH="${PWD}"/../../fabric/build/bin:"${PWD}"/../bin:"$PATH"
export FABRIC_CFG_PATH="${PWD}"/../config

export FABRIC_LOGGING_SPEC=debug:cauthdsl,policies,msp,common.configtx,common.channelconfig=info
export ORDERER_GENERAL_LISTENPORT=7050
export ORDERER_GENERAL_LOCALMSPID=Org1MSP
export ORDERER_GENERAL_LOCALMSPDIR="${PWD}"/crypto-config/organizations/org1.example.com/peers/peer0.org1.example.com/msp
export ORDERER_GENERAL_TLS_ENABLED=true
export ORDERER_GENERAL_TLS_PRIVATEKEY="${PWD}"/crypto-config/organizations/org1.example.com/peers/peer0.org1.example.com/tls/server.key
export ORDERER_GENERAL_TLS_CERTIFICATE="${PWD}"/crypto-config/organizations/org1.example.com/peers/peer0.org1.example.com/tls/server.crt
# following setting is not really needed at runtime since channel config has ca root certs, but we need to override the default in orderer.yaml
export ORDERER_GENERAL_TLS_ROOTCAS="${PWD}"/crypto-config/organizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export ORDERER_GENERAL_BOOTSTRAPMETHOD=file
export ORDERER_GENERAL_BOOTSTRAPFILE="${PWD}"/channel-artifacts/genesis.block
export ORDERER_FILELEDGER_LOCATION="${PWD}"/data/orderer
export ORDERER_CONSENSUS_WALDIR="${PWD}"/data/orderer/etcdraft/wal
export ORDERER_CONSENSUS_SNAPDIR="${PWD}"/data/orderer/etcdraft/wal
export ORDERER_ADMIN_LISTENADDRESS=127.0.0.1:9443
# used in metrics
export ORDERER_METRICS_PROVIDER=prometheus
export ORDERER_OPERATIONS_LISTENADDRESS=127.0.0.1:8443

# start orderer
orderer
