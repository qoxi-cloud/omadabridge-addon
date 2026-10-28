# qoxi-cloud Home Assistant add-ons

Add this repository in **Settings → Add-ons → Add-on Store → ⋮ → Repositories**:

```
https://github.com/qoxi-cloud/omadabridge-addon
```

## Add-ons

- **OmadaBridge** — read-only TP-Link Omada → Home Assistant bridge (MQTT Discovery).
  Packages the upstream [RCooLeR/omada_exporter](https://github.com/RCooLeR/omada_exporter) binary
  as a Supervisor add-on. Dashboards: the qoxi Mushroom fork (https://github.com/qoxi-cloud/lovelace-mushroom) reads its entities through the vendor-neutral `net_*` contract.
