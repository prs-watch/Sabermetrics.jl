using Test
using Sabermetrics

# --- Mike Trout 2019 ---
const PA = 600
const AB = 470
const HITS = 137
const DOUBLE = 27
const TRIPLE = 2
const HR = 45
const SB = 11
const CS = 2
const BB = 110
const SO = 120
const HBP = 16
const DP = 5
const SH = 0
const SF = 4
const IBB = 14

@test basehit(HITS, DOUBLE, TRIPLE, HR) == 63
@test avg(HITS, AB) == 0.291
@test obp(HITS, BB, HBP, AB, SF) == 0.438
@test slg(HITS, DOUBLE, TRIPLE, HR, AB) == 0.645
@test ops(HITS, DOUBLE, TRIPLE, HR, BB, HBP, AB, SF) == 1.083
@test iso(HITS, DOUBLE, TRIPLE, HR, AB) == 0.354
@test rc(HITS, DOUBLE, TRIPLE, HR, BB, AB) == 129.036
@test lazyrc(HITS, DOUBLE, TRIPLE, HR, BB, HBP, AB, SF) == 132.714
@test rc27(HITS, DOUBLE, TRIPLE, HR, BB, AB, CS, SH, SF, DP) == 10.128
@test babip(HITS, HR, AB, SO, SF) == 0.298
@test woba(HITS, DOUBLE, TRIPLE, HR, AB, BB, HBP, SF) == 0.455
@test wraa(HITS, DOUBLE, TRIPLE, HR, AB, PA, BB, HBP, SF, 0.33) == 62.5

# --- Gerritt Cole 2019 ---
const ER = 59
const IP = 212.1
const K = 326
const PBB = 48
const PIBB = 0
const PHBP = 3
const PHR = 29
const PH = 142

@test era(ER, IP) == 2.504
@test whip(PH, PBB, IP) == 0.896
@test fip(PHR, PBB, PIBB, PHBP, K, IP) == 2.425
@test k9(K, IP) == 13.833
@test bb9(PBB, IP) == 2.037
@test h9(PH, IP) == 6.025
@test hr9(PHR, IP) == 1.231