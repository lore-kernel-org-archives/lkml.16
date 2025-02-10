Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AA6244195
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203871; cv=none; b=oRvJneSkW7Cqr1LGRgcCvvMOrHV8acseZf/lkw85/U3MJp1B0SQQrAl7GN17BnBhB2ytzlgTir4v1YrqGWMBXRcM1PAjV1x64xZgre/fRGhxQfIuckBX43hRKi3R49n8DCU75lv5We/e2PuBq+0XcN2jFfLi6ICrqsKzPu0kiHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203871; c=relaxed/simple;
	bh=R0MKiDoY26HPIOwFUCB6t2y9Vc87PkYPzVYIjoMb/DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L3oNXLKqs6cFjGY2Vd1vC4TEjMaJTQuE1jluPuaFq4DHcxbfHhqW2buVLa55SyFVkryxwAHdQf7L7UWmexAM2l0SD24FJvO0qJwD5KuPAmkpOK1QO0A3O4agIcghtJw3kL+Q7aPhyKWBasfN9VfxdGKK05ya3K2u7XK7mOZ5xlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGGMWVTO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGGMWVTO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739203870; x=1770739870;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R0MKiDoY26HPIOwFUCB6t2y9Vc87PkYPzVYIjoMb/DQ=;
  b=jGGMWVTORZfbhIdW2Uw37wWY7aJXAnWQ4X5+s4uhqkIlIGw/qXfll1KE
   RUNgsAcociQcRJe9YZDOJ65LAHXfzEUF3Gxkbd8YX44xCprq7UWLJZ7zl
   jm1TYNZKH3N5DxEEUZkgiSGVwvmMGJ+WyiBVA0Mr4tKhlNOrS0VjzTTO6
   D8abRRXauj94TspLx7LWJ7TpFmrSrralo0ag0xL5NLr9oytwW9yZrjBry
   QNWKACEBUqoe284tpZ4UuMJqvJobNnuaw3MeJfXuEPPzaLrIR/N4n2HOn
   kUr10b3tSgRyu87FJw1bX2Z+/G5hnAS0UPtA4CHcBFGn1W/5zdVxCFlTg
   w==;
X-CSE-ConnectionGUID: Zxj0RyKORdyVUCPcErd4AA==
X-CSE-MsgGUID: dsy2vSzNRueO9E5HiqMdxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43449896"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="43449896"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 08:11:09 -0800
X-CSE-ConnectionGUID: gqvKAhIGRT6AOhwQOxa9dg==
X-CSE-MsgGUID: QQlx2Dr2QO6s54FsjWjVgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149423919"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by orviesa001.jf.intel.com with ESMTP; 10 Feb 2025 08:11:03 -0800
Received: from soc-PF3291X2.clients.intel.com (unknown [10.245.121.166])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 233B032EA9;
	Mon, 10 Feb 2025 16:11:02 +0000 (GMT)
From: Bertrand Wlodarczyk <bertrand.wlodarczyk@intel.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Cc: mhocko@suse.com,
	dave.hansen@linux.intel.com,
	apw@canonical.com,
	joe@perches.com,
	dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com,
	Bertrand Wlodarczyk <bertrand.wlodarczyk@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>
Subject: [PATCH] vmscan, cleanup: add for_each_managed_zone_pgdat macro
Date: Mon, 10 Feb 2025 17:07:49 +0100
Message-ID: <20250210160818.686-1-bertrand.wlodarczyk@intel.com>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro is introduced to eliminate redundancy in the repeated iteration
over managed zones in pgdat data structure, reducing the potential for
errors. This change doesn't introduce any functional modifications.
Due to concentration of the pattern in vmscan.c the macro is placed
locally in that file.

Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
Signed-off-by: Bertrand Wlodarczyk <bertrand.wlodarczyk@intel.com>
---
There is an ERROR in checkpatch.pl script: "Macros should be enclosed in
Do-While loop" which seems to be false positive. Similar patch ee99c71c59f89
also raises the same error. Added maintainers of checkpatch.pl to review
and investigate.
---
 mm/vmscan.c | 83 +++++++++++++++++++++--------------------------------
 1 file changed, 32 insertions(+), 51 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index c767d71c43d7..2c77bd6f6f2f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -271,6 +271,25 @@ static int sc_swappiness(struct scan_control *sc, struct mem_cgroup *memcg)
 }
 #endif
 
+/* for_each_managed_zone_pgdat - helper macro to iterate over all managed zones in a pgdat up to
+ * and including the specified highidx
+ * @zone: The current zone in the iterator
+ * @pgdat: The pgdat which node_zones are being iterated
+ * @idx: The index variable
+ * @highidx: The index of the highest zone to return
+ *
+ * This macro iterates through all managed zones up to and including the specified highidx.
+ * The zone iterator enters an invalid state after macro call and must be reinitialized
+ * before it can be used again.
+ */
+#define for_each_managed_zone_pgdat(zone, pgdat, idx, highidx)	\
+	for ((idx) = 0, (zone) = (pgdat)->node_zones;		\
+	    (idx) <= (highidx);					\
+	    (idx)++, (zone)++)					\
+		if (!managed_zone(zone))			\
+			continue;				\
+		else
+
 static void set_task_reclaim_state(struct task_struct *task,
 				   struct reclaim_state *rs)
 {
@@ -396,13 +415,9 @@ static unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru,
 {
 	unsigned long size = 0;
 	int zid;
+	struct zone *zone;
 
-	for (zid = 0; zid <= zone_idx; zid++) {
-		struct zone *zone = &lruvec_pgdat(lruvec)->node_zones[zid];
-
-		if (!managed_zone(zone))
-			continue;
-
+	for_each_managed_zone_pgdat(zone, lruvec_pgdat(lruvec), zid, zone_idx) {
 		if (!mem_cgroup_disabled())
 			size += mem_cgroup_get_zone_lru_size(lruvec, lru, zid);
 		else
@@ -495,7 +510,7 @@ static bool skip_throttle_noprogress(pg_data_t *pgdat)
 {
 	int reclaimable = 0, write_pending = 0;
 	int i;
-
+	struct zone *zone;
 	/*
 	 * If kswapd is disabled, reschedule if necessary but do not
 	 * throttle as the system is likely near OOM.
@@ -508,12 +523,7 @@ static bool skip_throttle_noprogress(pg_data_t *pgdat)
 	 * throttle as throttling will occur when the folios cycle
 	 * towards the end of the LRU if still under writeback.
 	 */
-	for (i = 0; i < MAX_NR_ZONES; i++) {
-		struct zone *zone = pgdat->node_zones + i;
-
-		if (!managed_zone(zone))
-			continue;
-
+	for_each_managed_zone_pgdat(zone, pgdat, i, MAX_NR_ZONES - 1) {
 		reclaimable += zone_reclaimable_pages(zone);
 		write_pending += zone_page_state_snapshot(zone,
 						  NR_ZONE_WRITE_PENDING);
@@ -2372,17 +2382,13 @@ static void prepare_scan_control(pg_data_t *pgdat, struct scan_control *sc)
 		unsigned long total_high_wmark = 0;
 		unsigned long free, anon;
 		int z;
+		struct zone *zone;
 
 		free = sum_zone_node_page_state(pgdat->node_id, NR_FREE_PAGES);
 		file = node_page_state(pgdat, NR_ACTIVE_FILE) +
 			   node_page_state(pgdat, NR_INACTIVE_FILE);
 
-		for (z = 0; z < MAX_NR_ZONES; z++) {
-			struct zone *zone = &pgdat->node_zones[z];
-
-			if (!managed_zone(zone))
-				continue;
-
+		for_each_managed_zone_pgdat(zone, pgdat, z, MAX_NR_ZONES - 1) {
 			total_high_wmark += high_wmark_pages(zone);
 		}
 
@@ -5843,6 +5849,7 @@ static inline bool should_continue_reclaim(struct pglist_data *pgdat,
 	unsigned long pages_for_compaction;
 	unsigned long inactive_lru_pages;
 	int z;
+	struct zone *zone;
 
 	/* If not in reclaim/compaction mode, stop */
 	if (!in_reclaim_compaction(sc))
@@ -5862,11 +5869,7 @@ static inline bool should_continue_reclaim(struct pglist_data *pgdat,
 		return false;
 
 	/* If compaction would go ahead or the allocation would succeed, stop */
-	for (z = 0; z <= sc->reclaim_idx; z++) {
-		struct zone *zone = &pgdat->node_zones[z];
-		if (!managed_zone(zone))
-			continue;
-
+	for_each_managed_zone_pgdat(zone, pgdat, z, sc->reclaim_idx) {
 		/* Allocation can already succeed, nothing to do */
 		if (zone_watermark_ok(zone, sc->order, min_wmark_pages(zone),
 				      sc->reclaim_idx, 0))
@@ -6393,11 +6396,7 @@ static bool allow_direct_reclaim(pg_data_t *pgdat)
 	if (pgdat->kswapd_failures >= MAX_RECLAIM_RETRIES)
 		return true;
 
-	for (i = 0; i <= ZONE_NORMAL; i++) {
-		zone = &pgdat->node_zones[i];
-		if (!managed_zone(zone))
-			continue;
-
+	for_each_managed_zone_pgdat(zone, pgdat, i, ZONE_NORMAL) {
 		if (!zone_reclaimable_pages(zone))
 			continue;
 
@@ -6702,12 +6701,7 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
 	 * Check watermarks bottom-up as lower zones are more likely to
 	 * meet watermarks.
 	 */
-	for (i = 0; i <= highest_zoneidx; i++) {
-		zone = pgdat->node_zones + i;
-
-		if (!managed_zone(zone))
-			continue;
-
+	for_each_managed_zone_pgdat(zone, pgdat, i, highest_zoneidx) {
 		if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
 			mark = promo_wmark_pages(zone);
 		else
@@ -6792,11 +6786,7 @@ static bool kswapd_shrink_node(pg_data_t *pgdat,
 
 	/* Reclaim a number of pages proportional to the number of zones */
 	sc->nr_to_reclaim = 0;
-	for (z = 0; z <= sc->reclaim_idx; z++) {
-		zone = pgdat->node_zones + z;
-		if (!managed_zone(zone))
-			continue;
-
+	for_each_managed_zone_pgdat(zone, pgdat, z, sc->reclaim_idx) {
 		sc->nr_to_reclaim += max(high_wmark_pages(zone), SWAP_CLUSTER_MAX);
 	}
 
@@ -6827,12 +6817,7 @@ update_reclaim_active(pg_data_t *pgdat, int highest_zoneidx, bool active)
 	int i;
 	struct zone *zone;
 
-	for (i = 0; i <= highest_zoneidx; i++) {
-		zone = pgdat->node_zones + i;
-
-		if (!managed_zone(zone))
-			continue;
-
+	for_each_managed_zone_pgdat(zone, pgdat, i, highest_zoneidx) {
 		if (active)
 			set_bit(ZONE_RECLAIM_ACTIVE, &zone->flags);
 		else
@@ -6893,11 +6878,7 @@ static int balance_pgdat(pg_data_t *pgdat, int order, int highest_zoneidx)
 	 * stall or direct reclaim until kswapd is finished.
 	 */
 	nr_boost_reclaim = 0;
-	for (i = 0; i <= highest_zoneidx; i++) {
-		zone = pgdat->node_zones + i;
-		if (!managed_zone(zone))
-			continue;
-
+	for_each_managed_zone_pgdat(zone, pgdat, i, highest_zoneidx) {
 		nr_boost_reclaim += zone->watermark_boost;
 		zone_boosts[i] = zone->watermark_boost;
 	}
-- 
2.48.1

