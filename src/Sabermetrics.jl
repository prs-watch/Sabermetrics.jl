module Sabermetrics

export basehit, avg, obp, slg, ops, iso, rc, lazyrc, rc27, babip, woba, wraa, wrc, era, whip, fip, k9, bb9, h9, hr9

# --- consts ---

const DIGITS = 3

# --- 共通function ---

function sabrround(num)
    return round(num, RoundNearestTiesAway, digits=DIGITS)
end

# --- バッティングfunction ---

function basehit(hits, double, triple, hr)
    return (hits - double - triple - hr)
end

function avg(hits, ab)
    return sabrround(hits / ab)
end

function obp(hits, bb, hbp, ab, sf)
    return sabrround((hits + bb + hbp) / (ab + bb + hbp + sf))
end

function slg(hits, double, triple, hr, ab)
    return sabrround((basehit(hits, double, triple, hr) + 2 * double + 3 * triple + 4 * hr) / ab)
end

function ops(hits, double, triple, hr, bb, hbp, ab, sf)
    return sabrround(
        obp(hits, bb, hbp, ab, sf) + slg(hits, double, triple, hr, ab)
    )
end

function iso(hits, double, triple, hr, ab)
    return sabrround(
        slg(hits, double, triple, hr, ab)- avg(hits, ab)
    )
end

function rc(hits, double, triple, hr, bb, ab)
    tb = basehit(hits, double, triple, hr) + 2 * double + 3 * triple + 4 * hr
    return sabrround(((hits + bb) * tb) / (ab + bb))
end

function lazyrc(hits, double, triple, hr, bb, hbp, ab, sf)
    tb = basehit(hits, double, triple, hr) + 2 * double + 3 * triple + 4 * hr
    return sabrround(obp(hits, bb, hbp, ab, sf) * tb)
end

function rc27(hits, double, triple, hr, bb, ab, cs, sh, sf, dp)
    return sabrround(rc(hits, double, triple, hr, bb, ab) * 27 / (ab - hits + cs + sh + sf + dp))
end

function babip(hits, hr, ab, k, sf)
    return sabrround((hits - hr) / (ab - k - hr + sf))
end

function woba(hits, double, triple, hr, ab, bb, hbp, sf)
    return sabrround(
        ((bb + hbp) * 0.7 + 0.9 * basehit(hits, double, triple, hr) + 1.3 * double + 1.6 * triple + 2 * hr) / (ab + bb + hbp + sf)
    )
end

function wraa(hits, double, triple, hr, ab, pa, bb, hbp, sf, lwoba)
    return sabrround(((woba(hits, double, triple, hr, ab, bb, hbp, sf) - lwoba) / 1.2) * pa)
end

function wrc(hits, double, triple, hr, ab, pa, bb, hbp, sf, lwoba, lr, lpa)
    return sabrround(
        (((woba(hits, double, triple, hr, ab, bb, hbp, sf) - lwoba) / 1.2) + (lr / lpa)) * pa
    )
end

# --- ピッチングfunction ---

function era(er, ip)
    return sabrround((er / ip) * 9)
end

function whip(hits, bb, ip)
    return sabrround((hits + bb) / ip)
end

function fip(hr, bb, ibb, hbp, k, ip)
    return sabrround(((13 * hr + 3 * (bb - ibb + hbp) - 2 * k) / ip) + 3)
end

function k9(k, ip)
    return sabrround((k / ip) * 9)
end

function bb9(bb, ip)
    return sabrround((bb / ip) * 9)
end

function h9(h, ip)
    return sabrround((h / ip) * 9)
end

function hr9(hr, ip)
    return sabrround((hr / ip) * 9)
end

end