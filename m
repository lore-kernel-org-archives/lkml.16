Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DEA1F418D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744384027; cv=none; b=uOA1uybH9OCXf3Za0GsBb4MQjO1BBYD1bwqki1UghZX2bGqqQ5HWciNQQktKBZUPYIXGHLUsKG9YU5qqVx0bmeuPtjham0Cq5m4nNA5ZXRSV6erGPgv7h4LVwsXhXASn5JV5BKHt6vN8/ljQNCF4Yc3STMePqTiLBjUW/pup840=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744384027; c=relaxed/simple;
	bh=qTlFl5dPv4jGbSPyV2TlGNiuW/1R9GKcrM0RSvIrFfY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q75B8ypSP5hpN8Ksb05MpGLosiTMZmq/ZjogT/NdlEjYzEn+/8i0twfLGyJJnG5OjepZXIu7cYRhekZPnpU53yY+JxK/F3kejPs2bMoFYBgmKOh57UGgzurfspS8Oj41z8sNjLQ5j/hJxqwat9HPzgEN9BFADVLDdR1zh2gXdS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wh7rt2Yt; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wh7rt2Yt"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so13557275e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744384023; x=1744988823; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zT9HK7f4zut0JMwgxK/+pZ5AGVyQQmaHlu9Z+2ZcOlE=;
        b=wh7rt2YtETyLkD+C1RtgRGzMh47RQstmYlf3WV18hi1I+U4+Re/2MCJUrZQXHxJhBp
         zpnLm2cEqNZdzMTGV+GKeYHB1SDLqfUG2e8Q5c75fOqwy7Q1YIohs4pSFL/YYXoD9Dba
         LMj9j4ZJsKpY74ne0MiijWvaRBpaaIXih10Toq0T5m6pqKfB+67qTq/SfUny64gLpK/B
         /efyJM/KSStlsYa/xtT8sDrK5y6cugTSBKQ/q0atbS51NndyDItvS5aJBYWWgq16h5pf
         YKuZMgDu4S/41BFaSqm+1ImCa11wy2WVw1K8vqC7MiTrE3Iy1di8uQi92zteJyg/oJh7
         cBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744384023; x=1744988823;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zT9HK7f4zut0JMwgxK/+pZ5AGVyQQmaHlu9Z+2ZcOlE=;
        b=a1gF19cJiPbB1HuDtov4ymXtaOfhIjCQMcvuv8Va35zGBgorn9Q2PIgdz/qHpxQgHu
         U7Rm4mQ9KeAES8HTZcmXeUMAUobrSecblnyHFe4eMD6lBId+EuZCattQ5qCebn/bmCg9
         ECuws7cmupmFJgbuTakJNspivNmBKqka4ZwXBBpzNJ01mT8hLGLuI1ojouatNMHiJh18
         CFUUKXI20DVTjninTdGoNNjSbnGApEiBJiE5Pe0zaLvzkJ7PAoU5FIy8SUxhiLEeNgAg
         bxuzNoT/vvnz2MnBKuH2frucXtUQefEewDp/ize+PZijaojr+uHClKOZqOpoMgUd56Tj
         LLvA==
X-Forwarded-Encrypted: i=1; AJvYcCWamWuNLmpo9YnUIXReWGY3rU1xASekTir+3hg70c+5BGe8TURdQp+VumatfElHT16i9JNLsq7Kb1daLSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YytMEb4wESOPWLiJbuAZBPzJwuv9JD6lk/0LFlRNUq6YvUFHYet
	9SrX8kHezCw+wIUE5DzdmOWhkWyw0QudcZDTBkHTFjiMFY6KQQ0s7W0odBT0okrJLwpHd9u/EGB
	K+W8p2vin9w==
X-Google-Smtp-Source: AGHT+IHO4xZ09nGgDUkGFuaki3SkgqbYyALc8qGc3LePIPFrD28NPTB6CI/SE4o7MkIyp0jXLwML7Vw5WAvp8g==
X-Received: from wmbbh10.prod.google.com ([2002:a05:600c:3d0a:b0:43b:c7e5:66e0])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b9d:b0:43d:934:ea97 with SMTP id 5b1f17b1804b1-43f3a9af8c5mr31645595e9.27.1744384023753;
 Fri, 11 Apr 2025 08:07:03 -0700 (PDT)
Date: Fri, 11 Apr 2025 15:07:01 +0000
In-Reply-To: <20250411134550.GB366747@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407180154.63348-1-hannes@cmpxchg.org> <20250407180154.63348-2-hannes@cmpxchg.org>
 <D930DO9PAJR8.SOYZSGRG5Y2O@google.com> <20250411134550.GB366747@cmpxchg.org>
X-Mailer: aerc 0.20.0
Message-ID: <D93WJ0HYKRGL.1NWTMXWJBWE80@google.com>
Subject: Re: [PATCH 2/2] mm: page_alloc: tighten up find_suitable_fallback()
From: Brendan Jackman <jackmanb@google.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Mel Gorman <mgorman@techsingularity.net>, Carlos Song <carlos.song@nxp.com>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri Apr 11, 2025 at 1:45 PM UTC, Johannes Weiner wrote:
>> -		if (find_suitable_fallback(area, order, migratetype, true) >= 0)
>> +		if (should_try_claim_block(order, migratetype) &&
>> +		    find_fallback_migratetype(area, order, migratetype) >= 0)
>
> So I agree with pushing the test into the callers. However, I think
> the name "should_try_claim_block()" is not great for this. It makes
> sense in the alloc/fallback path, but compaction here doesn't claim
> anything. It just wants to know if this order + migratetype is
> eligible under block claiming rules.
>
> IMO this would be more readable with the old terminology:
>
> 		if (can_claim_block(order, migratetype) &&
> 		    find_fallback_migratetype(area, order, migratetype) >= 0)

Sure, that makes sense, here's a modified version of the patch:

---

From 85be0fca4627c5b832a3382c92b6310609e14ca4 Mon Sep 17 00:00:00 2001
From: Brendan Jackman <jackmanb@google.com>
Date: Thu, 10 Apr 2025 13:22:58 +0000
Subject: [PATCH] mm: page_alloc: Split up find_suitable_fallback()

Now that it's been simplified, it's clear that the bool arg isn't
needed, callers can just use should_try_claim_block(). Once that logic
is stripped out, the function becomes very obvious and can get a more
straightforward name and comment.

Since should_try_claim_block() is now exported to compaction.c, give it
a name that makes more sense outside the context of allocation -
should_claim_block() seems confusing in code that has no interest in
actually claiming a block.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 mm/compaction.c |  3 ++-
 mm/internal.h   |  5 +++--
 mm/page_alloc.c | 33 +++++++++++++--------------------
 3 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index 39a4d178dff3c..0528996c40507 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -2363,7 +2363,8 @@ static enum compact_result __compact_finished(struct compact_control *cc)
 		 * Job done if allocation would steal freepages from
 		 * other migratetype buddy lists.
 		 */
-		if (find_suitable_fallback(area, order, migratetype, true) >= 0)
+		if (can_claim_block(order, migratetype) &&
+		    find_fallback_migratetype(area, order, migratetype) >= 0)
 			/*
 			 * Movable pages are OK in any pageblock. If we are
 			 * stealing for a non-movable allocation, make sure
diff --git a/mm/internal.h b/mm/internal.h
index 4e0ea83aaf1c8..5450ea7f5b1ec 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -914,8 +914,9 @@ static inline void init_cma_pageblock(struct page *page)
 #endif
 
 
-int find_suitable_fallback(struct free_area *area, unsigned int order,
-			   int migratetype, bool claimable);
+int find_fallback_migratetype(struct free_area *area, unsigned int order,
+			      int migratetype);
+bool can_claim_block(unsigned int order, int start_mt);
 
 static inline bool free_area_empty(struct free_area *area, int migratetype)
 {
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 0a1f28bf5255c..c27a106ec5985 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2034,7 +2034,7 @@ static inline bool boost_watermark(struct zone *zone)
  * try to claim an entire block to satisfy further allocations, instead of
  * polluting multiple pageblocks?
  */
-static bool should_try_claim_block(unsigned int order, int start_mt)
+bool can_claim_block(unsigned int order, int start_mt)
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
+		if (!can_claim_block(order, start_migratetype))
+			break;
+
 		area = &(zone->free_area[current_order]);
-		fallback_mt = find_suitable_fallback(area, current_order,
-						     start_migratetype, true);
+		fallback_mt = find_fallback_migratetype(area, current_order,
+							start_migratetype);
 
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
 
-- 
2.49.0.604.gff1f9ca942-goog

