Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E777128A416
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293333; cv=none; b=BwlSnsHGzfWNT5jeODV2k1DlQrPcmJY5CsppuhSrJ6ipH59sNbi0IGxGN17y4h0DL3JVKXANyDWSJWTVUmyExX3Rc7aqutyvugpgU4pHT3vm+ppJPMY3Z88+Ji3kwqPRxdJzIT/4VsqKpn8TwWdhcJM3ukNV6v48M0oC/jTAMdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293333; c=relaxed/simple;
	bh=VOpVt+41yrli7ULy6Cv44zxlFXhK+7x2i4JhnJeRJ00=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qnWWoefdqKt2RU5macbzlbAJCVXIz6QTsaczA1AuwdrlmU/hFSXOONxh/X1xwya2nNnEhK1JY5iG5q6b42XEsYH92FSHOsepvYbYJG7VUc6jomjxm+UKK9t7zMOVzM/v7K7RyHmzJYMouCdHA4CqJSLvNIlD7VSJq2qVVnt6YmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h8IOpwpq; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h8IOpwpq"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf327e9a2so7782605e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744293329; x=1744898129; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QDFIq8Rc3inYMDqZcvdxiRvCnaWwkWGcb7xaJWd+b3Y=;
        b=h8IOpwpqE56cXjot7MTRc8AnOdvgoZ2H8MOwQLFpKANonKIAoSdeO+cnBWwpYoPhWz
         RQt5hQiR1AunUnhuJtReteDZ2VCYmhy+qTWxFzcVJ94J4e3o2cpPWD9jJEW6wv2OeNOl
         dHgBKZe2eQmarcBzL8KVQDd13biIvnFL8IVGdVwjyq239q2u3RYZqDo+rmpSqoy6WJcQ
         TOqJ/kK/BYIDgsCXBU/wHfOnalQU6WNtmpuhK+2lpYHxzT3FHKCBqFOLSZefaLU0eXks
         I+6/Yb0RdvqDHXPK697CNfp5NyzC6okc5+skwayliZXfmAaYxsBlLGpuTGSgVRe1ny3P
         6WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744293329; x=1744898129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QDFIq8Rc3inYMDqZcvdxiRvCnaWwkWGcb7xaJWd+b3Y=;
        b=QsIGKeEvWaqGdqhdS4vfwl5suNAsJqO+X4GUppZAEgKOQtqTtBeG+3G4kfyXGbixcs
         2CwTIPn6RAm1f8ZQAsataMsUkCr4xJI3oF8g6ZHvKq4Hqo4GBg+i6JIdLIySmIhMU3OF
         9SwRuh3K6ZN2ezxDwYqL5Ofkw2aTWNQhN4lcGvhKxZt0hJAemKi21QcRD4BOIVEejEp5
         BLyrqSl7DDuvmyi9faFXjrQSIRRIp0H5JOOEpD1D7ZDfL20ODRXSAte95nv5fRIaFPjC
         +TACiXxnkOBFDHif/0weqCf8ebAlzGdbsZXBvUjRwWmjHLcQ5X9vF8QaWAsWdo7IPLzQ
         9HOg==
X-Forwarded-Encrypted: i=1; AJvYcCUimTjJvQmoCN2Ye9XhaY9Q7t8uaTDqOAapo+Qb1ZPh7fKtcLS1XZbyjlGL06b5UNzx5VK03TxaoO9ZpBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8dxDJlYegK1qk7nERqI6QWeewEDSFY4KAewvFswwPhXSA4Sqf
	FW818SK6sqkD+Mmgd2sjTW5xJVZVC8oQNW/WK0KuBXT9xWmeo+BA53oHPfHfRuU1OjpgoAh1Z+2
	Hs/U0gYX5Ww==
X-Google-Smtp-Source: AGHT+IF36wK+RgxWudcaKSM179JMydTdTYiZ6lfF38iCsfbydhNnVkj9Jh+6mJ8bFYUC1D8C/FVuSmbhjqfnsA==
X-Received: from wmbh17.prod.google.com ([2002:a05:600c:a111:b0:43d:1c11:4e5d])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c8e:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-43f2d7b4ed6mr22820475e9.8.1744293329091;
 Thu, 10 Apr 2025 06:55:29 -0700 (PDT)
Date: Thu, 10 Apr 2025 13:55:27 +0000
In-Reply-To: <20250407180154.63348-2-hannes@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407180154.63348-1-hannes@cmpxchg.org> <20250407180154.63348-2-hannes@cmpxchg.org>
X-Mailer: aerc 0.20.1-64-g7cb8e0e7ce24
Message-ID: <D930DO9PAJR8.SOYZSGRG5Y2O@google.com>
Subject: Re: [PATCH 2/2] mm: page_alloc: tighten up find_suitable_fallback()
From: Brendan Jackman <jackmanb@google.com>
To: Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Brendan Jackman <jackmanb@google.com>, 
	Mel Gorman <mgorman@techsingularity.net>, Carlos Song <carlos.song@nxp.com>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon Apr 7, 2025 at 6:01 PM UTC, Johannes Weiner wrote:
> find_suitable_fallback() is not as efficient as it could be, and
> somewhat difficult to follow.
>
> 1. should_try_claim_block() is a loop invariant. There is no point in
>    checking fallback areas if the caller is interested in claimable
>    blocks but the order and the migratetype don't allow for that.
>
> 2. __rmqueue_steal() doesn't care about claimability, so it shouldn't
>    have to run those tests.
>
> Different callers want different things from this helper:
>
> 1. __compact_finished() scans orders up until it finds a claimable block
> 2. __rmqueue_claim() scans orders down as long as blocks are claimable
> 3. __rmqueue_steal() doesn't care about claimability at all
>
> Move should_try_claim_block() out of the loop. Only test it for the
> two callers who care in the first place. Distinguish "no blocks" from
> "order + mt are not claimable" in the return value; __rmqueue_claim()
> can stop once order becomes unclaimable, __compact_finished() can keep
> advancing until order becomes claimable.

Nice!

My initial thought was: now we can drop the boolean arg and just have
the callers who care about claimability just call
should_try_claim_block() themselves. Then we can also get rid of the
magic -2 return value and find_suitable_fallback() becomes a pretty
obvious function.

I think it's a win on balance but it does make more verbosity at the
callsites, and an extra interface between page_alloc.c and compaction.c
So maybe it's a wash, maybe you already considered it and decided you
don't prefer it.

So, LGTM either way, I will attempt to attach the optional additional
patch for your perusal, hopefully without molesting the mail encoding
this time...

Reviewed-by: Brendan Jackman <jackmanb@google.com>

---

From 25f77012674db95354fb2496bc89954b8f8b4e6c Mon Sep 17 00:00:00 2001
From: Brendan Jackman <jackmanb@google.com>
Date: Thu, 10 Apr 2025 13:22:58 +0000
Subject: [PATCH] mm: page_alloc: Split up find_suitable_fallback()

Now that it's been simplified, it's clear that the bool arg isn't
needed, callers can just use should_try_claim_block(). Once that logic
is stripped out, the function becomes very obvious and can get a more
straightforward name and comment.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 mm/compaction.c |  3 ++-
 mm/internal.h   |  5 +++--
 mm/page_alloc.c | 33 +++++++++++++--------------------
 3 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index 39a4d178dff3c..d735c22e71029 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -2363,7 +2363,8 @@ static enum compact_result __compact_finished(struct compact_control *cc)
 		 * Job done if allocation would steal freepages from
 		 * other migratetype buddy lists.
 		 */
-		if (find_suitable_fallback(area, order, migratetype, true) >= 0)
+		if (should_try_claim_block(order, migratetype) &&
+		    find_fallback_migratetype(area, order, migratetype) >= 0)
 			/*
 			 * Movable pages are OK in any pageblock. If we are
 			 * stealing for a non-movable allocation, make sure
diff --git a/mm/internal.h b/mm/internal.h
index 4e0ea83aaf1c8..93a8be54924f4 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -914,8 +914,9 @@ static inline void init_cma_pageblock(struct page *page)
 #endif
 
 
-int find_suitable_fallback(struct free_area *area, unsigned int order,
-			   int migratetype, bool claimable);
+int find_fallback_migratetype(struct free_area *area, unsigned int order,
+			   int migratetype);
+bool should_try_claim_block(unsigned int order, int start_mt);
 
 static inline bool free_area_empty(struct free_area *area, int migratetype)
 {
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 0a1f28bf5255c..604cad16e1b5a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2034,7 +2034,7 @@ static inline bool boost_watermark(struct zone *zone)
  * try to claim an entire block to satisfy further allocations, instead of
  * polluting multiple pageblocks?
  */
-static bool should_try_claim_block(unsigned int order, int start_mt)
+bool should_try_claim_block(unsigned int order, int start_mt)
 {
 	/*
 	 * Leaving this order check is intended, although there is
@@ -2076,20 +2076,12 @@ static bool should_try_claim_block(unsigned int order, int start_mt)
 	return false;
 }
 
-/*
- * Check whether there is a suitable fallback freepage with requested order.
- * If claimable is true, this function returns fallback_mt only if
- * we would do this whole-block claiming. This would help to reduce
- * fragmentation due to mixed migratetype pages in one pageblock.
- */
-int find_suitable_fallback(struct free_area *area, unsigned int order,
-			   int migratetype, bool claimable)
+/* Find a fallback migratetype with at least one page of the given order. */
+int find_fallback_migratetype(struct free_area *area, unsigned int order,
+			      int migratetype)
 {
 	int i;
 
-	if (claimable && !should_try_claim_block(order, migratetype))
-		return -2;
-
 	if (area->nr_free == 0)
 		return -1;
 
@@ -2209,18 +2201,19 @@ __rmqueue_claim(struct zone *zone, int order, int start_migratetype,
 	 */
 	for (current_order = MAX_PAGE_ORDER; current_order >= min_order;
 				--current_order) {
+
+		/* Advanced into orders too low to claim, abort */
+		if (!should_try_claim_block(order, start_migratetype))
+			break;
+
 		area = &(zone->free_area[current_order]);
-		fallback_mt = find_suitable_fallback(area, current_order,
-						     start_migratetype, true);
+		fallback_mt = find_fallback_migratetype(area, current_order,
+						     start_migratetype);
 
 		/* No block in that order */
 		if (fallback_mt == -1)
 			continue;
 
-		/* Advanced into orders too low to claim, abort */
-		if (fallback_mt == -2)
-			break;
-
 		page = get_page_from_free_area(area, fallback_mt);
 		page = try_to_claim_block(zone, page, current_order, order,
 					  start_migratetype, fallback_mt,
@@ -2249,8 +2242,8 @@ __rmqueue_steal(struct zone *zone, int order, int start_migratetype)
 
 	for (current_order = order; current_order < NR_PAGE_ORDERS; current_order++) {
 		area = &(zone->free_area[current_order]);
-		fallback_mt = find_suitable_fallback(area, current_order,
-						     start_migratetype, false);
+		fallback_mt = find_fallback_migratetype(area, current_order,
+							start_migratetype);
 		if (fallback_mt == -1)
 			continue;
 

base-commit: 0e56a6f04d3b06eafe0000d2e3c3d7c2d554366a
-- 
2.49.0.504.g3bcea36a83-goog

