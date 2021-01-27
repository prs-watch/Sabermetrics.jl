# Sabermetrics

Julia package for Calculate Baseball Stats.

## Install

```bash
julia -e 'using Pkg; Pkg.add("Sabermetrics")'
```

## Features

`Sabermetrics.jl` supports following calculations.

- Hitting Stats
    - `basehit(hits, double, triple, hr)`
    - `avg(hits, ab)`
    - `obp(hits, bb, hbp, ab, sf)`
    - `slg(hits, double, triple, hr, ab)`
    - `ops(hits, double, triple, hr, bb, hbp, ab, sf)`
    - `iso(hits, double, triple, hr, ab)`
    - `rc(hits, double, triple, hr, bb, ab)`
    - `lazyrc(hits, double, triple, hr, bb, hbp, ab, sf)`
    - `rc27(hits, double, triple, hr, bb, ab, cs, sh, sf, dp)`
    - `babip(hits, hr, ab, k, sf)`
    - `woba(hits, double, triple, hr, ab, bb, hbp, sf)`
    - `wraa(hits, double, triple, hr, ab, pa, bb, hbp, sf, league_woba)`
    - `wrc(hits, double, triple, hr, ab, pa, bb, hbp, sf, league_woba, league_run, league_pa)`
- Pitching Stats
    - `era(er, ip)`
    - `whip(hits, bb, ip)`
    - `fip(hr, bb, ibb, hbp, k, ip)`
    - `k9(k, ip)`
    - `bb9(bb, ip)`
    - `h9(h, ip)`
    - `hr9(hr, ip)`

## Changelogs

- `v0.0.1`
    - Pre-release.