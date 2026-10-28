# ha-cards patches

Our tweaks on top of the upstream `omada-network-card.js` (RCooLeR/omada_exporter, `ha-cards/`).
Upstream bundle is a release asset; we rebuild it with the patches in this folder:

```bash
./build.sh v2.4.4      # → dist/omada-network-card.js
```

Then upload `dist/omada-network-card.js` to HA `/config/www/` and bump the `?v=` on the Lovelace resource.

| patch | what |
| --- | --- |
| 0001-qoxi-card | One combined patch on `ha-cards/src`: (a) `.frame` fills the panel view (`height: calc(100vh - var(--qoxi-frame-offset, 58px))`), `ha-card` without outer radius; (b) `logo_url` card option (custom image, e.g. `/local/ghost-logo.svg`); (c) ONU sticks from the HA "8311 ONU Monitor" integration (`sensor.8311_onu_<serial>_*`) appear as devices of type `onu` above the controller, with their own filter pill, list row (PON state, RX dBm, temp, GEM rates) and detail panel; option `onu_prefix` (default `8311_onu_`, `""` disables); (d) ISP/WAN rows whose Omada rates are 0 (virtual WANs) take RX/TX from the matching ONU's GEM counters (name tokens, e.g. `LinkCom_sfp2` ↔ `ONU LinkCom (sfp2)`). |
