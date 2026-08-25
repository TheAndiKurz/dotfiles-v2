#!/usr/bin/env bash

set -euo pipefail

readonly connection_name="UIBK VPN"
readonly gateway="vpn.uibk.ac.at"
readonly ca_certificate="/etc/ssl/certs/T-TeleSec_GlobalRoot_Class_2.pem"

usage() {
    echo "Usage: $0 <UIBK username>" >&2
}

if [[ $# -ne 1 || -z $1 ]]; then
    usage
    exit 2
fi

if ! command -v nmcli >/dev/null 2>&1; then
    echo "Error: nmcli is required." >&2
    exit 1
fi

if ! command -v openconnect >/dev/null 2>&1; then
    echo "Error: OpenConnect support is required. Install networkmanager-openconnect first." >&2
    exit 1
fi

if [[ ! -r $ca_certificate ]]; then
    echo "Error: CA certificate not found: $ca_certificate" >&2
    exit 1
fi

username=$1

if nmcli connection show "$connection_name" >/dev/null 2>&1; then
    action="Updated"
else
    nmcli connection add \
        type vpn \
        vpn-type openconnect \
        con-name "$connection_name" \
        ifname "*" \
        autoconnect no
    action="Created"
fi

nmcli connection modify "$connection_name" \
    connection.autoconnect no \
    vpn.user-name "$username" \
    vpn.data "gateway = $gateway, protocol = anyconnect, cacert = $ca_certificate, cookie-flags = 2" \
    vpn.secrets "form:main:username=$username"

echo "$action '$connection_name' for '$username'."
