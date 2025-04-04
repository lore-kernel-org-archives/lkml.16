Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153741EF0B9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743775911; cv=none; b=amv3SasSUnxOP4EpT4dNEc8gu2y/Cdp4W3LyoIrZ8d/tomxzXnV/IxQeuqfHpil+aUXEs/TQGK1WukCQmx/hT15vAFhUKBQepTihsH4Gy9/tYitLyOqs3fmvASuVbkrRyy5AqJw33r1CVPSfgvxUEfL22SmDaxETo5qf8Yb+x1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743775911; c=relaxed/simple;
	bh=8kLt7YzxiNnUitPhl16DBeAQM8YhMK4KRUfeK0ias44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=toUGwKAeJ2Z0O/Kxb0AWmCg2/X+EoiEghB0DNBDSRyWdA2OhA784PR6qnonmhTbcz+1yI6Srz8dlJT0YqCqu5GAIbAbP73o25cMejyNZDiOPUvaNOqIu4wM77YChPXiSzuwgVNw2R7epD2PKgZK3eVD1M8pPlHTwuqZdpb7xdcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=EE5fcLCx; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="EE5fcLCx"
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 400C93F6C3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1743775906;
	bh=C+zfkvYOpX/LkordDlbA+L4X7gmdrbSBRR7pZY7+5yg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=EE5fcLCxAi+LyWj2dyy5T+Bf43e7MwKqEDRewi/QD+HAuaDouGf/SiczsGVbN5d3b
	 ypEYcI3aKu3JVQjubTWsjDTI15V3zqcJLr49ehmbN1iaU1T3qkYQQw1uUsb1uAujJz
	 +5V3WeApaX563hS0X/XkMDCum9MxDxNe+r/TTQ5XAPsp9Nt2QljNAcpnJc9SWahqqy
	 j5kdt60D0TRTQlcPm60v1m5PFSNSiHGmiX0cyTKhdyb8tX7W4UjQx2W8ZWSDmtrwC0
	 jQfa7c7PSXqym7kdEeRckFRXsK5KnzeAk8iAgca7SlvLWw76B3VHRfzmXKW9g8OmuA
	 8qYu0MjFG+M4g==
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff6943febeso1639255a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743775905; x=1744380705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+zfkvYOpX/LkordDlbA+L4X7gmdrbSBRR7pZY7+5yg=;
        b=Rx2hLTXhWlK2GYsyTu/f5dxkjjQQmK2763H7oSl8M7Fjwo5LCoN83GKNQFBUzVBvFS
         snpV7pSqmKwCm0LuTcYE7Ja6r9eMljK0CHbNllngs3qKkvxIW9d0I6ecxNn7Q7BMmYc5
         FYw72lrKBOrE1qf9DtBjUxbv7xrE0ZyOyXusJBEpUCQU/L5cOCu8gQktP4F9n6jCuoeX
         u/brWtKhSaA2gAHPGLV2YaahVANW7OdwmDf6UA6QN4IBh7o+51brL98wz3JeNwVLS53m
         BjUIgg44tAi2e+FnPkdDefQFBcxpPSaJOX0BAx2JjqhbsmzoJDi1FwgrsBmfkbqoCzbF
         ibwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVESthrWmt1OPbSnO/gTxJw1NKtX5C7uggDex4SwNOKv9eMvyhq15UUeZ09b6JuV40oH63rxfiSZHXgh28=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBE9P2YnOmF+TAIXfraJl04k5xrnJZj/UEPHIEft0hKobSFZpo
	dTOE80fjoxFhb6B3rXyhnPANxscaAYgr16qLT4DMi1MtRbB6BcSKGUggARB7ouZFEERvCJHjnhA
	f/0+NgKqwVtrQYiE4h2jPImmHWpq7NoTuXzuAM1UQHwuBC8WBJLPcKHb1ldGekzSzj4OCItPEKR
	vkWq1KHSa0NQ==
X-Gm-Gg: ASbGncvIfF/vIj1p51dDUjo2rCGWbdraBRi6qLE6s8/6B0FB6vcpGoqwg8XwJGso97p
	RHieccEHKvTOePZ8s8bO1TTBQgsV7f9thk7CTqXFUGV61+n13WuO6NgkNYvz2dV5v6wly7Bi4jT
	KgLSOow40BGzpBk0Qsg9wM0bIub2p2KKa1XhOpNsByUF+ql5GV8jsvhSy/LXQZNACs1YrfVI9Xr
	BoUWXWLgj0lE/FVtpOsyNgswkKcXZHCSWF/TuPR7nm9c6uaFudTtCase5ee2PPfbua5mUsvpXiz
	mxwQZ9O62IhGZdPjKgbAVSLEeH+Dg+lmog==
X-Received: by 2002:a17:90b:5187:b0:2fa:6793:e860 with SMTP id 98e67ed59e1d1-3057a399b6amr11645222a91.0.1743775904583;
        Fri, 04 Apr 2025 07:11:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX9i1NIwBk506a6Vnth24ovqrIv1z3UCBu/3trbfNNc9QcdfNp6Tt72AOicIMydGztnYc1zA==
X-Received: by 2002:a17:90b:5187:b0:2fa:6793:e860 with SMTP id 98e67ed59e1d1-3057a399b6amr11645164a91.0.1743775904035;
        Fri, 04 Apr 2025 07:11:44 -0700 (PDT)
Received: from localhost.localdomain ([240f:74:7be:1:a79e:c2f7:7ca2:a9e0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca1e874sm3676512a91.8.2025.04.04.07.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:11:43 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	yuzhao@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: vmscan: apply proportional reclaim pressure for memcg when MGLRU is enabled
Date: Fri,  4 Apr 2025 23:11:18 +0900
Message-ID: <20250404141118.3895592-1-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The scan implementation for MGLRU was missing proportional reclaim
pressure for memcg, which contradicts the description in
Documentation/admin-guide/cgroup-v2.rst (memory.{low,min} section).

This issue was revealed by the LTP memcontrol03 [1] test case. The
following example output from a local test env with no NUMA shows
that prior to this patch, proportional protection was not working:

* Without this patch (MGLRU enabled):
  $ sudo LTP_SINGLE_FS_TYPE=xfs ./memcontrol03
    ...
    memcontrol03.c:214: TPASS: Expect: (A/B/C memory.current=25964544) ~= 34603008
    memcontrol03.c:216: TPASS: Expect: (A/B/D memory.current=26038272) ~= 17825792
    ...

* With this patch (MGLRU enabled):
  $ sudo LTP_SINGLE_FS_TYPE=xfs ./memcontrol03
    ...
    memcontrol03.c:214: TPASS: Expect: (A/B/C memory.current=29327360) ~= 34603008
    memcontrol03.c:216: TPASS: Expect: (A/B/D memory.current=23748608) ~= 17825792
    ...

* When MGLRU is disabled:
  $ sudo LTP_SINGLE_FS_TYPE=xfs ./memcontrol03
    ...
    memcontrol03.c:214: TPASS: Expect: (A/B/C memory.current=28819456) ~= 34603008
    memcontrol03.c:216: TPASS: Expect: (A/B/D memory.current=24018944) ~= 17825792
    ...

Note that the test shows TPASS for all cases here due to its lenient
criteria. And even with this patch, or when MGLRU is disabled, the
results above show slight deviation from the expected values, but this
is due to relatively small mem usage compared to the >> DEF_PRIORITY
adjustment.

Factor out the proportioning logic to a new function and have MGLRU
reuse it.

[1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/controllers/memcg/memcontrol03.c

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 mm/vmscan.c | 148 +++++++++++++++++++++++++++-------------------------
 1 file changed, 78 insertions(+), 70 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index b620d74b0f66..c594d8264938 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2467,6 +2467,69 @@ static inline void calculate_pressure_balance(struct scan_control *sc,
 	*denominator = ap + fp;
 }
 
+static unsigned long apply_proportional_protection(struct mem_cgroup *memcg,
+		struct scan_control *sc, unsigned long scan)
+{
+	unsigned long min, low;
+
+	mem_cgroup_protection(sc->target_mem_cgroup, memcg, &min, &low);
+
+	if (min || low) {
+		/*
+		 * Scale a cgroup's reclaim pressure by proportioning
+		 * its current usage to its memory.low or memory.min
+		 * setting.
+		 *
+		 * This is important, as otherwise scanning aggression
+		 * becomes extremely binary -- from nothing as we
+		 * approach the memory protection threshold, to totally
+		 * nominal as we exceed it.  This results in requiring
+		 * setting extremely liberal protection thresholds. It
+		 * also means we simply get no protection at all if we
+		 * set it too low, which is not ideal.
+		 *
+		 * If there is any protection in place, we reduce scan
+		 * pressure by how much of the total memory used is
+		 * within protection thresholds.
+		 *
+		 * There is one special case: in the first reclaim pass,
+		 * we skip over all groups that are within their low
+		 * protection. If that fails to reclaim enough pages to
+		 * satisfy the reclaim goal, we come back and override
+		 * the best-effort low protection. However, we still
+		 * ideally want to honor how well-behaved groups are in
+		 * that case instead of simply punishing them all
+		 * equally. As such, we reclaim them based on how much
+		 * memory they are using, reducing the scan pressure
+		 * again by how much of the total memory used is under
+		 * hard protection.
+		 */
+		unsigned long cgroup_size = mem_cgroup_size(memcg);
+		unsigned long protection;
+
+		/* memory.low scaling, make sure we retry before OOM */
+		if (!sc->memcg_low_reclaim && low > min) {
+			protection = low;
+			sc->memcg_low_skipped = 1;
+		} else {
+			protection = min;
+		}
+
+		/* Avoid TOCTOU with earlier protection check */
+		cgroup_size = max(cgroup_size, protection);
+
+		scan -= scan * protection / (cgroup_size + 1);
+
+		/*
+		 * Minimally target SWAP_CLUSTER_MAX pages to keep
+		 * reclaim moving forwards, avoiding decrementing
+		 * sc->priority further than desirable.
+		 */
+		scan = max(scan, SWAP_CLUSTER_MAX);
+	}
+	return scan;
+}
+
 /*
  * Determine how aggressively the anon and file LRU lists should be
  * scanned.
@@ -2537,70 +2600,10 @@ static void get_scan_count(struct lruvec *lruvec, struct scan_control *sc,
 	for_each_evictable_lru(lru) {
 		bool file = is_file_lru(lru);
 		unsigned long lruvec_size;
-		unsigned long low, min;
 		unsigned long scan;
 
 		lruvec_size = lruvec_lru_size(lruvec, lru, sc->reclaim_idx);
-		mem_cgroup_protection(sc->target_mem_cgroup, memcg,
-				      &min, &low);
-
-		if (min || low) {
-			/*
-			 * Scale a cgroup's reclaim pressure by proportioning
-			 * its current usage to its memory.low or memory.min
-			 * setting.
-			 *
-			 * This is important, as otherwise scanning aggression
-			 * becomes extremely binary -- from nothing as we
-			 * approach the memory protection threshold, to totally
-			 * nominal as we exceed it.  This results in requiring
-			 * setting extremely liberal protection thresholds. It
-			 * also means we simply get no protection at all if we
-			 * set it too low, which is not ideal.
-			 *
-			 * If there is any protection in place, we reduce scan
-			 * pressure by how much of the total memory used is
-			 * within protection thresholds.
-			 *
-			 * There is one special case: in the first reclaim pass,
-			 * we skip over all groups that are within their low
-			 * protection. If that fails to reclaim enough pages to
-			 * satisfy the reclaim goal, we come back and override
-			 * the best-effort low protection. However, we still
-			 * ideally want to honor how well-behaved groups are in
-			 * that case instead of simply punishing them all
-			 * equally. As such, we reclaim them based on how much
-			 * memory they are using, reducing the scan pressure
-			 * again by how much of the total memory used is under
-			 * hard protection.
-			 */
-			unsigned long cgroup_size = mem_cgroup_size(memcg);
-			unsigned long protection;
-
-			/* memory.low scaling, make sure we retry before OOM */
-			if (!sc->memcg_low_reclaim && low > min) {
-				protection = low;
-				sc->memcg_low_skipped = 1;
-			} else {
-				protection = min;
-			}
-
-			/* Avoid TOCTOU with earlier protection check */
-			cgroup_size = max(cgroup_size, protection);
-
-			scan = lruvec_size - lruvec_size * protection /
-				(cgroup_size + 1);
-
-			/*
-			 * Minimally target SWAP_CLUSTER_MAX pages to keep
-			 * reclaim moving forwards, avoiding decrementing
-			 * sc->priority further than desirable.
-			 */
-			scan = max(scan, SWAP_CLUSTER_MAX);
-		} else {
-			scan = lruvec_size;
-		}
-
+		scan = apply_proportional_protection(memcg, sc, lruvec_size);
 		scan >>= sc->priority;
 
 		/*
@@ -4521,8 +4524,9 @@ static bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct sca
 	return true;
 }
 
-static int scan_folios(struct lruvec *lruvec, struct scan_control *sc,
-		       int type, int tier, struct list_head *list)
+static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
+		       struct scan_control *sc, int type, int tier,
+		       struct list_head *list)
 {
 	int i;
 	int gen;
@@ -4531,7 +4535,7 @@ static int scan_folios(struct lruvec *lruvec, struct scan_control *sc,
 	int scanned = 0;
 	int isolated = 0;
 	int skipped = 0;
-	int remaining = MAX_LRU_BATCH;
+	int remaining = min(nr_to_scan, MAX_LRU_BATCH);
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
 
@@ -4642,7 +4646,8 @@ static int get_type_to_scan(struct lruvec *lruvec, int swappiness)
 	return positive_ctrl_err(&sp, &pv);
 }
 
-static int isolate_folios(struct lruvec *lruvec, struct scan_control *sc, int swappiness,
+static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
+			  struct scan_control *sc, int swappiness,
 			  int *type_scanned, struct list_head *list)
 {
 	int i;
@@ -4654,7 +4659,7 @@ static int isolate_folios(struct lruvec *lruvec, struct scan_control *sc, int sw
 
 		*type_scanned = type;
 
-		scanned = scan_folios(lruvec, sc, type, tier, list);
+		scanned = scan_folios(nr_to_scan, lruvec, sc, type, tier, list);
 		if (scanned)
 			return scanned;
 
@@ -4664,7 +4669,8 @@ static int isolate_folios(struct lruvec *lruvec, struct scan_control *sc, int sw
 	return 0;
 }
 
-static int evict_folios(struct lruvec *lruvec, struct scan_control *sc, int swappiness)
+static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
+			struct scan_control *sc, int swappiness)
 {
 	int type;
 	int scanned;
@@ -4683,7 +4689,7 @@ static int evict_folios(struct lruvec *lruvec, struct scan_control *sc, int swap
 
 	spin_lock_irq(&lruvec->lru_lock);
 
-	scanned = isolate_folios(lruvec, sc, swappiness, &type, &list);
+	scanned = isolate_folios(nr_to_scan, lruvec, sc, swappiness, &type, &list);
 
 	scanned += try_to_inc_min_seq(lruvec, swappiness);
 
@@ -4804,6 +4810,8 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc, int s
 	if (nr_to_scan && !mem_cgroup_online(memcg))
 		return nr_to_scan;
 
+	nr_to_scan = apply_proportional_protection(memcg, sc, nr_to_scan);
+
 	/* try to get away with not aging at the default priority */
 	if (!success || sc->priority == DEF_PRIORITY)
 		return nr_to_scan >> sc->priority;
@@ -4856,7 +4864,7 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 		if (nr_to_scan <= 0)
 			break;
 
-		delta = evict_folios(lruvec, sc, swappiness);
+		delta = evict_folios(nr_to_scan, lruvec, sc, swappiness);
 		if (!delta)
 			break;
 
@@ -5477,7 +5485,7 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
 		if (sc->nr_reclaimed >= nr_to_reclaim)
 			return 0;
 
-		if (!evict_folios(lruvec, sc, swappiness))
+		if (!evict_folios(MAX_LRU_BATCH, lruvec, sc, swappiness))
 			return 0;
 
 		cond_resched();
-- 
2.45.2

