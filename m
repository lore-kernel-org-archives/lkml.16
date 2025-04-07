Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B632721146F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744048922; cv=none; b=RpSm2NKUey5Bt9jWy7wD+C0GFP2av2YcCQA2eBaHfUonGFUOgI+5mBLdPrjBYr5GqeS7FNCppgowQcKUN8FP4bcbY6d+XBMzSV2bAARnfVbT3NDmahbd8ZqA/wDcy2hdzkcYKSy2NEyqLhISGBiUFOhZF6fGUev9xKLj2funluQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744048922; c=relaxed/simple;
	bh=atydcBScW3fHfFEUH3PoUA1H7PylnORJLDCt9lUf18A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTrQ+eXSH6x+XZwuV9UdTEa76NygLnJ8F5maX6wrOM0HscPcXTvmNkkv4mfMdcYu4d53ncw7PnpJ8eBKXHyBgAVpCfd7k/O32+jPtZrRhisXSUgkjwhht2g+nn+yqB/qmfdFLPlmfqH1j8+tEbuP5hZyvt4YHl/3fFbizrh1kVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=iD2TDNyD; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="iD2TDNyD"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c559b3eb0bso249589085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 11:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744048918; x=1744653718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQLZCr05VGtGVBv3A2tu1D2mkKumfPoYpq5Esa8pDhY=;
        b=iD2TDNyDQplUOkWl4xe8IBMKH8vJ6l1aZaeSSLtO5pPFJ3oeklMa4igKq48XH0137F
         4ZgEsQAKSknPOzcgYvZdf3ady4UV3bmxzaPt+a09HPqioeRtuQ1G2ghUlnurOkpa/lyG
         0NIrXRA2xo/xDLscahhISMI2MrFA+/5Z1hc4BekumwczBaObR4eqXEC2wnEhf3fOg9Ol
         ASQZl+Hy6+Qrh7SbHbrktTKBiEyybfzMM18dTP7+pP2eJ6/m6ZrKSI5A4ffFxQ9ndlJS
         Hlwy8nAtQLfyFN4i+NuLgWDG6yKUFe2mZiRHMu4iHT/ydfnXzq6pecvTcxVRL2Fn5qfy
         1MBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744048918; x=1744653718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQLZCr05VGtGVBv3A2tu1D2mkKumfPoYpq5Esa8pDhY=;
        b=K62p+OVN7XtYQjLb2hL43UwQPeL6NaWFAH8EgxxMGxGHye30k4W9ck4Rcpa+3fD+EF
         Ai8XCDaP3zURPIVFempOos1sdL4wqBV84nxR5crOxTrlsIZX33vsty07VHcGkFHnQNRD
         FNPb9rfPJNGwpquP6wNWrPlrb34eLBK2Wa41Cwmfbp/IJLrXQNBQs6V1XgTqOrzngkkq
         Kmk13fJcf0G1bPtvLUBoGOQAEjEPb6zV8tk7BTJCiF66f1zQA/+HAu0iuzn8ByvfXdrK
         k743bsKe9k+d8z7bdS1TcwuNJPSdTH4g9L7vq8nwqLODyrHiivHQIISiH5PdKWs9R3x3
         7uOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYSEVZAyggiQ2dyGQOlk8kiIfiUQjr+XRmzFnzGrpbhUMtNTBjc3DL6aYPyuY9dhVYrmT60ahRoIGknzk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1PKmgI4qSAz/LABSwZoWz4/Y0IoBdbElG+2oEchfqbekAt7n6
	hYdhqCDPbK4Oab4REPrM4yh5g8ly6w8wX10ruvFVPB8aktG3shAgzEtyHbQnJEc=
X-Gm-Gg: ASbGncvoNw9iHcsiAo9d2LedScfBQgs5sGLqFzNLvMUj73BYJIKz82y2WVP56ryf21O
	dBBR8YAK1IMRnCuBlETPQcjzHXqu9Ozxfr+/Kx/pQMU1fF1DA5M8mVUSLR+thSk35zT++kux+iV
	prte+ABXkd76L+Va+sZoTiNryJYxJj2igqDpPusqc/gxL2jykHI76nXwtc7VrdjuhNRhfuk2EYq
	i4SMI6YYR5qrsGnDpmB5JBYwvgQ9TGyVkKVp1ThNLZwm6JCf1dqO5NSEC3c4Hkl7ufFj7moEl0Y
	FdMP8f7g2ve8Pa0RKyXRIDLC0Gsng0PumC0RkkAyMhA=
X-Google-Smtp-Source: AGHT+IFP40wX1tqDVmp7PqGhxZhz6Aw85evf0lAoeVchmmMqlQfdBSCHrrixVtc5cp7a9YIfnuha/Q==
X-Received: by 2002:a05:620a:318b:b0:7c5:4278:d151 with SMTP id af79cd13be357-7c775ac006emr2098904885a.43.1744048918447;
        Mon, 07 Apr 2025 11:01:58 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76e96cf01sm627509185a.55.2025.04.07.11.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 11:01:57 -0700 (PDT)
From: Johannes Weiner <hannes@cmpxchg.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Brendan Jackman <jackmanb@google.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Carlos Song <carlos.song@nxp.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mm: page_alloc: tighten up find_suitable_fallback()
Date: Mon,  7 Apr 2025 14:01:54 -0400
Message-ID: <20250407180154.63348-2-hannes@cmpxchg.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407180154.63348-1-hannes@cmpxchg.org>
References: <20250407180154.63348-1-hannes@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

find_suitable_fallback() is not as efficient as it could be, and
somewhat difficult to follow.

1. should_try_claim_block() is a loop invariant. There is no point in
   checking fallback areas if the caller is interested in claimable
   blocks but the order and the migratetype don't allow for that.

2. __rmqueue_steal() doesn't care about claimability, so it shouldn't
   have to run those tests.

Different callers want different things from this helper:

1. __compact_finished() scans orders up until it finds a claimable block
2. __rmqueue_claim() scans orders down as long as blocks are claimable
3. __rmqueue_steal() doesn't care about claimability at all

Move should_try_claim_block() out of the loop. Only test it for the
two callers who care in the first place. Distinguish "no blocks" from
"order + mt are not claimable" in the return value; __rmqueue_claim()
can stop once order becomes unclaimable, __compact_finished() can keep
advancing until order becomes claimable.

Before:

 Performance counter stats for './run case-lru-file-mmap-read' (5 runs):

	 85,294.85 msec task-clock                       #    5.644 CPUs utilized               ( +-  0.32% )
	    15,968      context-switches                 #  187.209 /sec                        ( +-  3.81% )
	       153      cpu-migrations                   #    1.794 /sec                        ( +-  3.29% )
	   801,808      page-faults                      #    9.400 K/sec                       ( +-  0.10% )
   733,358,331,786      instructions                     #    1.87  insn per cycle              ( +-  0.20% )  (64.94%)
   392,622,904,199      cycles                           #    4.603 GHz                         ( +-  0.31% )  (64.84%)
   148,563,488,531      branches                         #    1.742 G/sec                       ( +-  0.18% )  (63.86%)
       152,143,228      branch-misses                    #    0.10% of all branches             ( +-  1.19% )  (62.82%)

	   15.1128 +- 0.0637 seconds time elapsed  ( +-  0.42% )

After:

 Performance counter stats for './run case-lru-file-mmap-read' (5 runs):

         84,380.21 msec task-clock                       #    5.664 CPUs utilized               ( +-  0.21% )
            16,656      context-switches                 #  197.392 /sec                        ( +-  3.27% )
               151      cpu-migrations                   #    1.790 /sec                        ( +-  3.28% )
           801,703      page-faults                      #    9.501 K/sec                       ( +-  0.09% )
   731,914,183,060      instructions                     #    1.88  insn per cycle              ( +-  0.38% )  (64.90%)
   388,673,535,116      cycles                           #    4.606 GHz                         ( +-  0.24% )  (65.06%)
   148,251,482,143      branches                         #    1.757 G/sec                       ( +-  0.37% )  (63.92%)
       149,766,550      branch-misses                    #    0.10% of all branches             ( +-  1.22% )  (62.88%)

           14.8968 +- 0.0486 seconds time elapsed  ( +-  0.33% )

Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 mm/compaction.c |  4 +---
 mm/internal.h   |  2 +-
 mm/page_alloc.c | 31 +++++++++++++------------------
 3 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index 139f00c0308a..7462a02802a5 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -2348,7 +2348,6 @@ static enum compact_result __compact_finished(struct compact_control *cc)
 	ret = COMPACT_NO_SUITABLE_PAGE;
 	for (order = cc->order; order < NR_PAGE_ORDERS; order++) {
 		struct free_area *area = &cc->zone->free_area[order];
-		bool claim_block;
 
 		/* Job done if page is free of the right migratetype */
 		if (!free_area_empty(area, migratetype))
@@ -2364,8 +2363,7 @@ static enum compact_result __compact_finished(struct compact_control *cc)
 		 * Job done if allocation would steal freepages from
 		 * other migratetype buddy lists.
 		 */
-		if (find_suitable_fallback(area, order, migratetype,
-						true, &claim_block) != -1)
+		if (find_suitable_fallback(area, order, migratetype, true) >= 0)
 			/*
 			 * Movable pages are OK in any pageblock. If we are
 			 * stealing for a non-movable allocation, make sure
diff --git a/mm/internal.h b/mm/internal.h
index 50c2f590b2d0..55384b9971c3 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -915,7 +915,7 @@ static inline void init_cma_pageblock(struct page *page)
 
 
 int find_suitable_fallback(struct free_area *area, unsigned int order,
-			int migratetype, bool claim_only, bool *claim_block);
+			   int migratetype, bool claimable);
 
 static inline bool free_area_empty(struct free_area *area, int migratetype)
 {
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 03b0d45ed45a..1522e3a29b16 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2077,31 +2077,25 @@ static bool should_try_claim_block(unsigned int order, int start_mt)
 
 /*
  * Check whether there is a suitable fallback freepage with requested order.
- * Sets *claim_block to instruct the caller whether it should convert a whole
- * pageblock to the returned migratetype.
- * If only_claim is true, this function returns fallback_mt only if
+ * If claimable is true, this function returns fallback_mt only if
  * we would do this whole-block claiming. This would help to reduce
  * fragmentation due to mixed migratetype pages in one pageblock.
  */
 int find_suitable_fallback(struct free_area *area, unsigned int order,
-			int migratetype, bool only_claim, bool *claim_block)
+			   int migratetype, bool claimable)
 {
 	int i;
-	int fallback_mt;
+
+	if (claimable && !should_try_claim_block(order, migratetype))
+		return -2;
 
 	if (area->nr_free == 0)
 		return -1;
 
-	*claim_block = false;
 	for (i = 0; i < MIGRATE_PCPTYPES - 1 ; i++) {
-		fallback_mt = fallbacks[migratetype][i];
-		if (free_area_empty(area, fallback_mt))
-			continue;
+		int fallback_mt = fallbacks[migratetype][i];
 
-		if (should_try_claim_block(order, migratetype))
-			*claim_block = true;
-
-		if (*claim_block || !only_claim)
+		if (!free_area_empty(area, fallback_mt))
 			return fallback_mt;
 	}
 
@@ -2206,7 +2200,6 @@ __rmqueue_claim(struct zone *zone, int order, int start_migratetype,
 	int min_order = order;
 	struct page *page;
 	int fallback_mt;
-	bool claim_block;
 
 	/*
 	 * Do not steal pages from freelists belonging to other pageblocks
@@ -2225,11 +2218,14 @@ __rmqueue_claim(struct zone *zone, int order, int start_migratetype,
 				--current_order) {
 		area = &(zone->free_area[current_order]);
 		fallback_mt = find_suitable_fallback(area, current_order,
-				start_migratetype, false, &claim_block);
+						     start_migratetype, true);
+
+		/* No block in that order */
 		if (fallback_mt == -1)
 			continue;
 
-		if (!claim_block)
+		/* Advanced into orders too low to claim, abort */
+		if (fallback_mt == -2)
 			break;
 
 		page = get_page_from_free_area(area, fallback_mt);
@@ -2254,12 +2250,11 @@ __rmqueue_steal(struct zone *zone, int order, int start_migratetype)
 	int current_order;
 	struct page *page;
 	int fallback_mt;
-	bool claim_block;
 
 	for (current_order = order; current_order < NR_PAGE_ORDERS; current_order++) {
 		area = &(zone->free_area[current_order]);
 		fallback_mt = find_suitable_fallback(area, current_order,
-				start_migratetype, false, &claim_block);
+						     start_migratetype, false);
 		if (fallback_mt == -1)
 			continue;
 
-- 
2.49.0

