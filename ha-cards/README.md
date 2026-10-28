# ha-cards patches

Our tweaks on top of the upstream `omada-network-card.js` (RCooLeR/omada_exporter, `ha-cards/`).
Upstream bundle is a release asset; we rebuild it with the patches in this folder:

```bash
./build.sh v2.4.4      # → dist/omada-network-card.js
```

Then upload `dist/omada-network-card.js` to HA `/config/www/` and bump the `?v=` on the Lovelace resource.

| patch | what |
| --- | --- |
| 0001-fill-panel-height | `.frame` fills the panel view (`height: calc(100vh - var(--qoxi-frame-offset, 58px))`) instead of a fixed 16:9 box; lists scroll inside. Also `ha-card { border-radius: 0 }` for edge-to-edge panel view. |
