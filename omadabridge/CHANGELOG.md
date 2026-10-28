## 2.4.4-qoxi.3
- Wired uplink of every switch/AP from the controller topology map: new sensor `Device Uplink Link Speed Mbps` with attributes `uplink_name`, `uplink_mac`, `uplink_port`, `uplink_local_port`, `uplink_lag_id`, `uplink_lag_ports` (used by the Mushroom fork cards for client paths and switch port labels).

## 2.4.4-qoxi.2
- Latency for virtual WANs: the bridge pings each virtual WAN gateway (OMADA_VWAN_PING, default on); add-on gets NET_RAW.

## 2.4.4-qoxi.1
- Build from the qoxi-cloud fork (https://github.com/qoxi-cloud/omada_exporter, branch `qoxi`).
- Virtual WANs (Omada 6.x) are exported as WAN/ISP rows; physical ports that only carry virtual WANs are hidden.

## 2.4.4
- Initial add-on packaging of upstream OmadaBridge v2.4.4.
