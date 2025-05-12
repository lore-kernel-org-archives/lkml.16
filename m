Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70C03D984
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747036697; cv=none; b=PPgVSz2yEH8c4dh4HJixAygq62S1KahRws+Ffm1J9AFCzm1gP+7Iav+vGvNnIu2kze+tQyf5COX4clYu5wIctt8K2GBh2l3Gmw0hkADJ+yORkSJe/8mFQflB5Rj4Md/iGr7VGijJ3HDo6UBbLoD3Y3mP8TJ5UdHG31czrEilQBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747036697; c=relaxed/simple;
	bh=4RyxF+zHBde/Sh9TkHzjLmXRWl6x6RsvLNgDaryOqdM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gtU712RaJl10mB57bURMMVlMe/BUDb3XzXn8a98z1nwHlHOn5tYdN6z9ATP9tyl1MzrtMa0vdbQ8l0Tl8Rd2uAZ0M6q62Gw3Lyf5wjkwIQFA3ATZkdKKSPuqktxM3d9mBVgwWuZO24yZqn5Ib3rhun3JtXqMebpwtKAil1NwUUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
	by SHSQR01.spreadtrum.com with ESMTP id 54C7wAeA024092
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:58:10 +0800 (+08)
	(envelope-from zhaoyang.huang@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 54C7u7LI010914;
	Mon, 12 May 2025 15:56:07 +0800 (+08)
	(envelope-from zhaoyang.huang@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx01.spreadtrum.com [10.0.64.7])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4ZwsLc3vFVz2Nm5S0;
	Mon, 12 May 2025 15:54:00 +0800 (CST)
Received: from bj03382pcu01.spreadtrum.com (10.0.73.40) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Mon, 12 May 2025 15:56:05 +0800
From: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
To: Andrew Morton <akpm@linux-foundation.org>, Yu Zhao <yuzhao@google.com>,
        <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
        Zhaoyang Huang
	<huangzhaoyang@gmail.com>, <steve.kang@unisoc.com>
Subject: [RFC PATCH] mm: throttling the reclaim when LRUVEC is congested under MGLRU
Date: Mon, 12 May 2025 15:55:57 +0800
Message-ID: <20250512075557.2308397-1-zhaoyang.huang@unisoc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL:SHSQR01.spreadtrum.com 54C7u7LI010914

From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>

Our v6.6 based ANDROID system with 4GB RAM and per pid based MEMCGv2
enabled constantly experienc starving of local watchdog process [1]
during an extreme fill data test over file system, which will generate
enormous dirty pages on page cache along with page fault from userspace.
Furthermore, we can see 423 out of 507 UN tasks are blocked by the same
callstack which indicating heavy IO pressure. However, the same test
case could get pass under legacy LRU.
By further debug, we find that 90% reclaimed folios are dirty [2] which
have reclaim be hard to reclaim folios and introduce extra IO by page
thrashing(clean cold mapped page get dropped and refault quickly).
We temporarily solving this by simulating the throttle thing as legacy
LRU does. I think this patch works because of reclaim_throttle happens
when all dirty pages of one round of scanning pages are all
congested(writeback & reclaim), which is easily to reach when memcgs
are configured in small granularity as we do(memcg for each single
process).

[1]
PID: 1384     TASK: ffffff80eae5e2c0  CPU: 4    COMMAND: "watchdog"
 #0 [ffffffc088e4b9f0] __switch_to at ffffffd0817a8d34
 #1 [ffffffc088e4ba50] __schedule at ffffffd0817a955c
 #2 [ffffffc088e4bab0] schedule at ffffffd0817a9a24
 #3 [ffffffc088e4bae0] io_schedule at ffffffd0817aa1b0
 #4 [ffffffc088e4bb90] folio_wait_bit_common at ffffffd08099fe98
 #5 [ffffffc088e4bc40] filemap_fault at ffffffd0809a36b0
 #6 [ffffffc088e4bd60] handle_mm_fault at ffffffd080a01a74
 #7 [ffffffc088e4bdc0] do_page_fault at ffffffd0817b5d38
 #8 [ffffffc088e4be20] do_translation_fault at ffffffd0817b5b1c
 #9 [ffffffc088e4be30] do_mem_abort at ffffffd0806e09f4
 #10 [ffffffc088e4be70] el0_ia at ffffffd0817a0d94
 #11 [ffffffc088e4bea0] el0t_64_sync_handler at ffffffd0817a0bfc
 #12 [ffffffc088e4bfe0] el0t_64_sync at ffffffd0806b1584

[2]
crash_arm64_v8.0.4++> kmem -p|grep reclaim|wc -l
22184
crash_arm64_v8.0.4++> kmem -p|grep dirty|wc -l
20484
crash_arm64_v8.0.4++> kmem -p|grep "dirty.*reclaim"|wc -l
20151
crash_arm64_v8.0.4++> kmem -p|grep "writeback.*reclaim"|wc -l
123

Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
---
 mm/vmscan.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 3783e45bfc92..a863d5cb5281 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4698,6 +4698,11 @@ static int evict_folios(struct lruvec *lruvec, struct scan_control *sc, int swap
 	reclaimed = shrink_folio_list(&list, pgdat, sc, &stat, false);
 	sc->nr.unqueued_dirty += stat.nr_unqueued_dirty;
 	sc->nr_reclaimed += reclaimed;
+	sc->nr.dirty += stat.nr_dirty;
+	sc->nr.congested += stat.nr_congested;
+	sc->nr.unqueued_dirty += stat.nr_unqueued_dirty;
+	sc->nr.writeback += stat.nr_writeback;
+	sc->nr.immediate += stat.nr_immediate;
 	trace_mm_vmscan_lru_shrink_inactive(pgdat->node_id,
 			scanned, reclaimed, &stat, sc->priority,
 			type ? LRU_INACTIVE_FILE : LRU_INACTIVE_ANON);
@@ -6010,10 +6015,36 @@ static void shrink_node(pg_data_t *pgdat, struct scan_control *sc)
 	unsigned long nr_reclaimed, nr_scanned, nr_node_reclaimed;
 	struct lruvec *target_lruvec;
 	bool reclaimable = false;
+	unsigned long flags;
 
 	if (lru_gen_enabled() && root_reclaim(sc)) {
 		memset(&sc->nr, 0, sizeof(sc->nr));
 		lru_gen_shrink_node(pgdat, sc);
+		/*
+		 * Tag a node/memcg as congested if all the dirty pages were marked
+		 * for writeback and immediate reclaim (counted in nr.congested).
+		 *
+		 * Legacy memcg will stall in page writeback so avoid forcibly
+		 * stalling in reclaim_throttle().
+		 */
+		if (sc->nr.dirty && sc->nr.dirty == sc->nr.congested) {
+			set_bit(LRUVEC_CGROUP_CONGESTED, &flags);
+
+			if (current_is_kswapd())
+				set_bit(LRUVEC_NODE_CONGESTED, &flags);
+		}
+
+		/*
+		 * Stall direct reclaim for IO completions if the lruvec is
+		 * node is congested. Allow kswapd to continue until it
+		 * starts encountering unqueued dirty pages or cycling through
+		 * the LRU too quickly.
+		 */
+		if (!current_is_kswapd() && current_may_throttle() &&
+				!sc->hibernation_mode &&
+				(test_bit(LRUVEC_CGROUP_CONGESTED, &flags) ||
+				 test_bit(LRUVEC_NODE_CONGESTED, &flags)))
+			reclaim_throttle(pgdat, VMSCAN_THROTTLE_CONGESTED);
 		return;
 	}
 
-- 
2.25.1

