{
        "route": {
                "geoip": {
                "path": "geo-assets\\sagernet-sing-geoip-geoip.db"
                },
                "geosite": {
                "path": "geo-assets\\sagernet-sing-geosite-geosite.db"
                },
                "rules": [
                {
                        "inbound": "dns-in",
                        "outbound": "dns-out"
                },
                {
                        "port": 53,
                        "outbound": "dns-out"
                },
                {
                        "clash_mode": "Direct",
                        "outbound": "direct"
                },
                {
                        "clash_mode": "Global",
                        "outbound": "select"
                }
                ],
                "auto_detect_interface": true,
                "override_android_vpn": true
        },
        "outbounds": [
                {
                "type": "selector",
                "tag": "select",
                "outbounds": [
                        "auto",
                        "IP->Iran, Yotube:Geekmeek",
                        "IP->Main, Yotube:Geekmeek"
                ],
                "default": "auto"
                },
                {
                "type": "urltest",
                "tag": "auto",
                "outbounds": [
                        "IP->Iran, Yotube:Geekmeek",
                        "IP->Main, Yotube:Geekmeek"
                ],
                "url": "http://cp.cloudflare.com/",
                "interval": "10m0s"
                },
                {
                "type": "wireguard",
                "tag": "IP->Iran, Yotube:Geekmeek",
                "local_address": [
                        "172.16.0.2/32",
                        "2606:4700:110:8a9b:e6fb:ce5e:dde:873/128"
                ],
                "private_key": "yOYXvlrbf04wt+57l0Dcb8F/sflbYy0qSNyXorcdXHY=",
                "server": "188.114.96.69",
                "server_port": 3138,
                "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
                "reserved": [67,14,85],
                "mtu": 1280,
                "fake_packets": "5-10"
                },
                {
                "type": "wireguard",
                "tag": "IP->Main, Yotube:Geekmeek",
                "detour": "IP->Iran, Yotube:Geekmeek",
                "local_address": [
                        "172.16.0.2/32",
                        "2606:4700:110:8426:c904:7f86:efc1:2b8e/128"
                ],
                "private_key": "eBPK/hzXq2QHrcIhEV5oDeLZgzYDvchKAlHUSXEDNlA=",
                "server": "188.114.96.69",
                "server_port": 3138,
                "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
                "reserved": [55,231,185],
                "mtu": 1280,
                "fake_packets": "5-10"
                },
                {
                "type": "dns",
                "tag": "dns-out"
                },
                {
                "type": "direct",
                "tag": "direct"
                },
                {
                "type": "direct",
                "tag": "bypass"
                },
                {
                "type": "block",
                "tag": "block"
                }
        ]
        }
