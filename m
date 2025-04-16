Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5021F1DE4CE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811519; cv=none; b=h7UEiAQOW4EIjZvgyMSGJkyHBhD4+KMHeTHhaX21d+YdFMPOcPvWUZVFOGlZS6wLiSby7HwYZ3QWpXR6ZPZxvixJL9G3/Gz/1P0R6I6dS8EwkC3YnaK5EPclncjTkZGWJcKVcXtJ6p98ufpb9eYNTCH9ph1q57m0imPQ0j2oElE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811519; c=relaxed/simple;
	bh=QzLXGKN1qZ+mBSCYiutyeuYDvZHhAcPyMYsPDC1APA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FeI94Dtb9JiwqJ5L38t1a+BAG/L1xQI0Hy8XBj8fljGRU/Srp/DXk//ST7VDmfPMX07pIdS0NlTaS6ZYpqnP2lC8AjqFn42u5GKiD/PzEPgE19y6mxY+Ldyvxlu5dTRB3CWTKh5bCXRAATB1hyQdIaaFIImuSl/MlyzJ8eHiBCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=Eo05iwr7; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="Eo05iwr7"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c55500d08cso596514885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744811515; x=1745416315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wj3NrniHNZn/X8o5tdAU6UD1m+UiZoBgpGIel9S7xk4=;
        b=Eo05iwr7maAXL2f1PeaUuKXyYE52+l5T7C1a/6Lo5euwCB7gT3bFoJaP7XTFMePbfZ
         FhIyCokDCPCTu1HJBQyQ9wB3H46ciapv6B+6Wdv2nsecBQdwFpe6Tq0N4DBXA26govNG
         6yq49gEAa0Kxm4zkz4POPja1fekwid12gFqCIkoolquRCMES9ef1td7VPqvmgc5pcCQ7
         OijAOGUO1nMtS7ZM+bVaA8MNnffNuQ30nIMv4Fp+zNjZoZ1ifW2OklcE9N4j2rkOFEum
         Dl7qI5Zr8VXW4VvBxSHtV+uCdudQxn/f7BLv0TQIvLbQHY7sKv2jRbYi9ateb+EV6vaF
         TYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744811515; x=1745416315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wj3NrniHNZn/X8o5tdAU6UD1m+UiZoBgpGIel9S7xk4=;
        b=c3uCG28+3j2ZLQE/hEKGJnJR2EGGx0Kt8POt4MKCJE9Eio3HG8FzP/TAm33EXMQyDC
         TwfLt8UIiRYtfmySGfomq5qzBi5tN24O0JeibVkudWCHRugRjJwOEhi2kdV2ponQDreF
         UwdbTT3OFVQrymSCWZNUi6wFjuYO2iURbP5Tim68yS+jwLEM3wJpLXCNlcoy8BjCcOhh
         snBwAbSXDWp8o6/fBpVCChBW5qpexHpiNaA2FBgZqM3htnHHXD6qq+TKf4pHrR/hCxRl
         rFBNdaeVURyoUjZLgSLCjFIJ5zcIC6ZxYy4AXbOv039qXx9zQ+iJMkjl7jH8oLsEYNtl
         cBjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK0VfMNRHFGECxEuiTutHp99t+avG8a/iUJoi4Fx4T3D5jKxYnaP2x6p0WwvgBBJ+2w8LQFfII0GoKvpE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvr/2cYf/GJhW1/abALnzebl7oDlzByl/cMUYqQacZScNzwAMC
	WIto9d28t8ZFezw3+7z6rU6Wt34OIDFy5TO42R/6Rk2Xh8JnEArB7+E1PN5V/htcZsmcj4WK4fS
	7
X-Gm-Gg: ASbGncva4hw1TmIRKrKCGVeHziubSFZLw8m3Z0Y5iWW9gqKLBtIYGksnfEBXEG9EufG
	6LRH/raun4g2giXvmOomYxIcPxSOzbqOacfv+9SVdCjYoif02LAXULhIAHf29EP5o/ylhIK0L/N
	nYMQrbWdecHzVgPn70UXNsmOleG1blW3sjYuh8xnQg/qBJXhjzN4LD6MV/1005LmKxv4pNbv7ME
	Zm3SQmr3DbzpjOIPHQ4okkhu4l5vmubORb0+r1cLCRgp1nNy1ZGZBCmtkltf4+bgru7glB/Cnps
	SJR6+nDt24nIVqY2SZfvYSWW8BDKkTwg7nPoyGIMrX80lmEo2A==
X-Google-Smtp-Source: AGHT+IGmuTUyCI94ZLmAFrRh2xfR+geJlI+XCIVaAF1HfCP+icwZogiLKrredbMjVg402ILAUyjhvQ==
X-Received: by 2002:a05:620a:4890:b0:7c5:a513:1ff0 with SMTP id af79cd13be357-7c919002f41mr255476485a.34.1744811514898;
        Wed, 16 Apr 2025 06:51:54 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a89f9943sm1059867585a.82.2025.04.16.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:51:54 -0700 (PDT)
From: Johannes Weiner <hannes@cmpxchg.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Brendan Jackman <jackmanb@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mm: vmscan: restore high-cpu watermark safety in kswapd
Date: Wed, 16 Apr 2025 09:45:39 -0400
Message-ID: <20250416135142.778933-2-hannes@cmpxchg.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416135142.778933-1-hannes@cmpxchg.org>
References: <20250416135142.778933-1-hannes@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vlastimil points out that commit a211c6550efc ("mm: page_alloc:
defrag_mode kswapd/kcompactd watermarks") switched kswapd from
zone_watermark_ok_safe() to the standard, percpu-cached version of
reading free pages, thus dropping the watermark safety precautions for
systems with high CPU counts (e.g. >212 cpus on 64G). Restore them.

Since zone_watermark_ok_safe() is no longer the right interface, and
this was the last caller of the function anyway, open-code the
zone_page_state_snapshot() conditional and delete the function.

Reported-by: Vlastimil Babka <vbabka@suse.cz>
Fixes: a211c6550efc ("mm: page_alloc: defrag_mode kswapd/kcompactd watermarks")
Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 include/linux/mmzone.h |  2 --
 mm/page_alloc.c        | 12 ------------
 mm/vmscan.c            | 21 +++++++++++++++++++--
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 4c95fcc9e9df..6ccec1bf2896 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1502,8 +1502,6 @@ bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
 bool zone_watermark_ok(struct zone *z, unsigned int order,
 		unsigned long mark, int highest_zoneidx,
 		unsigned int alloc_flags);
-bool zone_watermark_ok_safe(struct zone *z, unsigned int order,
-		unsigned long mark, int highest_zoneidx);
 /*
  * Memory initialization context, use to differentiate memory added by
  * the platform statically or via memory hotplug interface.
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index d7cfcfa2b077..928a81f67326 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3470,18 +3470,6 @@ static inline bool zone_watermark_fast(struct zone *z, unsigned int order,
 	return false;
 }
 
-bool zone_watermark_ok_safe(struct zone *z, unsigned int order,
-			unsigned long mark, int highest_zoneidx)
-{
-	long free_pages = zone_page_state(z, NR_FREE_PAGES);
-
-	if (z->percpu_drift_mark && free_pages < z->percpu_drift_mark)
-		free_pages = zone_page_state_snapshot(z, NR_FREE_PAGES);
-
-	return __zone_watermark_ok(z, order, mark, highest_zoneidx, 0,
-								free_pages);
-}
-
 #ifdef CONFIG_NUMA
 int __read_mostly node_reclaim_distance = RECLAIM_DISTANCE;
 
diff --git a/mm/vmscan.c b/mm/vmscan.c
index b620d74b0f66..cc422ad830d6 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -6736,6 +6736,7 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
 	 * meet watermarks.
 	 */
 	for_each_managed_zone_pgdat(zone, pgdat, i, highest_zoneidx) {
+		enum zone_stat_item item;
 		unsigned long free_pages;
 
 		if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
@@ -6748,9 +6749,25 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
 		 * blocks to avoid polluting allocator fallbacks.
 		 */
 		if (defrag_mode)
-			free_pages = zone_page_state(zone, NR_FREE_PAGES_BLOCKS);
+			item = NR_FREE_PAGES_BLOCKS;
 		else
-			free_pages = zone_page_state(zone, NR_FREE_PAGES);
+			item = NR_FREE_PAGES;
+
+		/*
+		 * When there is a high number of CPUs in the system,
+		 * the cumulative error from the vmstat per-cpu cache
+		 * can blur the line between the watermarks. In that
+		 * case, be safe and get an accurate snapshot.
+		 *
+		 * TODO: NR_FREE_PAGES_BLOCKS moves in steps of
+		 * pageblock_nr_pages, while the vmstat pcp threshold
+		 * is limited to 125. On many configurations that
+		 * counter won't actually be per-cpu cached. But keep
+		 * things simple for now; revisit when somebody cares.
+		 */
+		free_pages = zone_page_state(zone, item);
+		if (zone->percpu_drift_mark && free_pages < zone->percpu_drift_mark)
+			free_pages = zone_page_state_snapshot(zone, item);
 
 		if (__zone_watermark_ok(zone, order, mark, highest_zoneidx,
 					0, free_pages))
-- 
2.49.0

