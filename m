Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3DF219E4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715110; cv=none; b=G5UDCGyhKinXdxtREEDvhN3UVL404TM9N+K5fppADoO8hNWUkAI0WUvIZlqHRD206q0iTsVNvGCUc0pMG6z0VClsjQlFX1GryJucLlhbORNSLJja1/KROfWvv7R4uks+qV8EQfG72fLjv2eGi+pwvn0tobk5/5NZE8WqkrvT8ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715110; c=relaxed/simple;
	bh=EtaNgAi96I+gZn4ebubJzhEEvvSAr2ROdW5pT8HUvqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQ/5RPq6GBaDNmMQnq4X5TC2TX5TfbAbZdPXP6sG90y6zzXhB2gSf4xBj9ltWzhjVwZEH/7q66aGdliU/qC3cFmIWoFKF+3/Kqg+zbT5+ldFIxYisRpoyrknUAfgetoTN8F8vKV+InUZJJT5Y3JurT/ZRvGEf/NVnNG3GQMbTw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=tF9at3UA; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="tF9at3UA"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4772f48f516so24034231cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 14:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1743715105; x=1744319905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0kOc9IVgq4Yk9moCNK2lpDYwr+QzgoTOSJskjayuc4I=;
        b=tF9at3UAXuCFrCfvoj/mj6JZy5xX0/F3CCjOkghu1jwF8TTsoyEPCjiRH487/kRzdQ
         vFDwPIzXRDG3bXoHrQ3MWzcY0bCvsOXOZHRktZEMI9JFUSyLyR1nEPeKmIEV0+wJ2Ic4
         N7/O6CDszPifG4VQy0eW1RgZ930ZHTVn6zwqqKlJDO86Fmcgx6zkiNpw7kbQmqTi3v6M
         pZ1jdqfdYr1yBOA7wt1bZGF/NqfdpYSpoQ/Rru06MnvVYSWUHa/N5EGSoI6tJ3bSHkDR
         X9Y2l/FkNBRvIdWItuNce0lP0zgJ97LeQ8e08eYVNj/KVC7cq9VaqP/+CCtqH1HSBH2e
         nH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743715105; x=1744319905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kOc9IVgq4Yk9moCNK2lpDYwr+QzgoTOSJskjayuc4I=;
        b=TBUi8O/3vpgR9XGBbEcyrdDfv5c1mUd6zsuj/N6aB6aqMSQyKIjKygyVjScTpPmugt
         qClvfcTItqh0tKrg5VIszMFETin56Wv/Eht+x9kqkESZGrN+KpLUtacljWEjeKRYjL7Q
         868Ey1P61NIpxKC7+kuKg6g4Sa8niUOk7Z6wFGkHZ5W35AOIjEYtN/bvtTENdDh8UL9f
         BRX3wW/AVlJo82LlIZtdEr+/8u6b3UnRxP+PIwOnIPrOqGESjhXaH+LEOpLkuOplIKXm
         +qHqunjbAiTBk7wRCeR0uNWM8QlwAkk+VUzIANEtj3Asupdn765+keCSfYo0YI+g5iZe
         YQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeazFriZGjmTQ2H68cDe1ZAq6Jw0U2mU4cnWfOED81FXwtdUoLPhdhutgfrawHZI39wP+a7tZQisVrGE0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4l5b/AXaX7rS6DDYaD3gYPypI++Z+8k68qE0LhD18C97gLIHa
	IOFHWlw0d0u8MYJy/BZdFxuohqrWuw+DmA0mSO4TgB0PgkN3UoXo4jT+e1AC6+g=
X-Gm-Gg: ASbGncs6qWrkAC1AoBWCssNgDL+Sai9IIHFb3zV+WPcwdo145qdDTDVFSYJO+TdF3Ix
	VfaN4Ly/mFBqeZvcD8AyAsEh/CXhKTTD9ZzKWx0Mntv0C6mS/3kWh6SDLRJbHdUkLIgpL3uwlqz
	eo8eMEnF7Vpff7/VV6N9eOlwS8cFMR3cHvpq//F5e7LtDza563HK1Z/DvGi5Nzi1rWHlRYI9g7l
	rtH9tWXgUrr/R121V957lvlJ7MSWbip/wJSxGrvB3J7ZQOh7HqGqQSeEbXzg8EWrLD298XDeSAJ
	iBKa1dUqtyItnVwt+TI5DPW86MG+sGgNco2fRiM7lq4=
X-Google-Smtp-Source: AGHT+IG8qbRrdJJRNYAPb5HBuHq1caolO9hi310F9UTL31muqwVvUZfvWxa+/+p3NN97BPjnjl9qYg==
X-Received: by 2002:a05:622a:1350:b0:474:f9f2:ecb with SMTP id d75a77b69052e-47924da2174mr13754871cf.18.1743715105567;
        Thu, 03 Apr 2025 14:18:25 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4791b07141csm12331961cf.18.2025.04.03.14.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 14:18:24 -0700 (PDT)
Date: Thu, 3 Apr 2025 17:18:20 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
	"ying.huang@intel.com" <ying.huang@intel.com>,
	"vbabka@suse.cz" <vbabka@suse.cz>,
	"david@redhat.com" <david@redhat.com>,
	"mgorman@techsingularity.net" <mgorman@techsingularity.net>,
	"ziy@nvidia.com" <ziy@nvidia.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Brendan Jackman <jackmanb@google.com>
Subject: Re: Ask help about this patch c0cd6f557b90 "mm: page_alloc: fix
 freelist movement during block conversion"
Message-ID: <20250403211820.GA447372@cmpxchg.org>
References: <VI2PR04MB11147E11724F867F4FCB6677DE8AF2@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <20250402194425.GB198651@cmpxchg.org>
 <VI2PR04MB11147FA8008C118F375650623E8AE2@VI2PR04MB11147.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI2PR04MB11147FA8008C118F375650623E8AE2@VI2PR04MB11147.eurprd04.prod.outlook.com>

Hi Carlos,

On Thu, Apr 03, 2025 at 09:23:55AM +0000, Carlos Song wrote:
> Thank you for your quick ack and help! After applied this patch, it improved well.
> I apply this patch at this HEAD:
> f0a16f536332 (tag: next-20250403, origin/master, origin/HEAD) Add linux-next specific files for 20250403
> 
> and do 10 times same test like what I have done before in IMX7D:
> The IRQ off tracer shows the irq_off time 7~10ms. Is this what you expected?

This is great, thank you for testing it!

> # irqsoff latency trace v1.1.5 on 6.14.0-next-20250403-00003-gf9e8473ee91a
> # --------------------------------------------------------------------
> # latency: 8111 us, #4323/4323, CPU#0 | (M:NONE VP:0, KP:0, SP:0 HP:0 #P:2)
> #    -----------------
> #    | task: dd-820 (uid:0 nice:0 policy:0 rt_prio:0)
> #    -----------------
> #  => started at: __rmqueue_pcplist
> #  => ended at:   _raw_spin_unlock_irqrestore
> #
> #
> #                    _------=> CPU#
> #                   / _-----=> irqs-off/BH-disabled
> #                  | / _----=> need-resched
> #                  || / _---=> hardirq/softirq
> #                  ||| / _--=> preempt-depth
> #                  |||| / _-=> migrate-disable
> #                  ||||| /     delay
> #  cmd     pid     |||||| time  |   caller
> #     \   /        ||||||  \    |    /
>       dd-820       0d....    1us : __rmqueue_pcplist
>       dd-820       0d....    3us : _raw_spin_trylock <-__rmqueue_pcplist
>       dd-820       0d....    7us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d....   11us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d....   13us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d....   15us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d....   17us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d....   19us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d....   21us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d....   23us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d....   25us : __mod_zone_page_state <-__rmqueue_pcplist
> ...
>       dd-820       0d.... 1326us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1328us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1330us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1332us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1334us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1336us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1337us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1339us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1341us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1343us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1345us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1347us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1349us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1351us : __mod_zone_page_state <-__rmqueue_pcplist
> ...
>       dd-820       0d.... 1660us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1662us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1664us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 1666us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 1668us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 1670us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 1672us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-820       0d.... 1727us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 1729us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-820       0d.... 1806us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 1807us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 1809us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-820       0d.... 1854us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 1856us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-820       0d.... 1893us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 1895us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 1896us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 1898us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-820       0d.... 1954us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 1956us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-820       0d.... 2012us : find_suitable_fallback <-__rmqueue_pcplist
> ...
>      dd-820       0d.... 8077us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 8079us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 8081us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 8083us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 8084us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 8086us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 8088us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 8089us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 8091us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 8093us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 8095us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 8097us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 8098us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 8100us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 8102us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 8104us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-820       0d.... 8105us : __mod_zone_page_state <-__rmqueue_pcplist
>       dd-820       0d.... 8107us : _raw_spin_unlock_irqrestore <-__rmqueue_pcplist
>       dd-820       0d.... 8110us : _raw_spin_unlock_irqrestore
>       dd-820       0d.... 8113us+: trace_hardirqs_on <-_raw_spin_unlock_irqrestore
>       dd-820       0d.... 8156us : <stack trace>

This pattern looks much better. Once it fails to claim blocks, it goes
straight to single-page stealing.

Another observation is that find_suitable_callback() is hot. Looking
closer at that function, I think there are a few optimizations we can
do. Attaching another patch below, to go on top of the previous one.

Carlos, would you be able to give this a spin?

Thanks!

---

From 621b1842b9fbbb26848296a5feb4daf5b038ba33 Mon Sep 17 00:00:00 2001
From: Johannes Weiner <hannes@cmpxchg.org>
Date: Thu, 3 Apr 2025 16:44:32 -0400
Subject: [PATCH] mm: page_alloc: tighten up find_suitable_fallback()

find_suitable_fallback() is not as efficient as it could be:

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


