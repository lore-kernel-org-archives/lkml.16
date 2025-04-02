Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27117537FF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743623076; cv=none; b=Gp3fwTav7UQWBWIjwBq2nNhnA9yMCoRb5UckNR9szcIkMFnudRB/0vf6u4qmfdn8f3/Wdu79n9FZhKdj7PvgdqYeWbDIrVX5xNMU07ybW6DN9rx6lNY5URc9Vanop3Aut72UCZuM5v/chdptNJT0SlfILqzKeWesaGnkMiXb1aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743623076; c=relaxed/simple;
	bh=zI3J8Glc84uOrclZuT6sDMbfecyaEBAvIO76Qb0xJ9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9Nk1X/Z6AFxDHlnlVHaMioPFoZ9YYyykt703ZOjMtPAeBQAyRcK5LyyZVeGFB6fE7vg1MbuhSK5/g1QDUihHSV7yygDrJfjrJgaiho2GKmQeFBBfOJ1EpDFFmiN0yN4h4iF31PCFDok915o+YWAu0yaKsMhiYyUlnChXA9DP6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=GBcLvN/C; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="GBcLvN/C"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476ac73c76fso1339911cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1743623071; x=1744227871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TfYfp4s9XelsxhfphCsHaWHCaWwmM7i6SUoQjlUISMA=;
        b=GBcLvN/CDvqJwV8X5HoGb9RQp7G70r86BgPRUC/VzCkvSc3bmfQhctC4kE8L2dyR5f
         iKjSqAK/C4GPIOt03Ii7WwzW+71RawzH6ttTfp/vS6rlEsHr7ntwX8XnpnI4ehVJ5wcr
         Sh+c2mTtL6zI41gr/696Nz5KmxktknytgnvVy5parRDOLRNy5b5xTD39LhU/K85l3UwX
         ekq13RPl/QRjhzDoWq+bT/nQdQiLQhdbzjpb6vFoy5bvUflpQ3kwERqaQYgF1Nj6lsJl
         abB0llXksAQ1N+4+rY98j6y7v9JmD4ZkW7ir9ppePhbsoFlnAnc62u2UAaBk07I87eVZ
         aplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743623071; x=1744227871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfYfp4s9XelsxhfphCsHaWHCaWwmM7i6SUoQjlUISMA=;
        b=BjEqKpsx1UVqzcK8rGFu0z98Ycdv4J9qlhiFEqlrEt55Hj5x13oPUtA8l1gzVDG4IK
         FdZ4FFpGKnCnd3UegXAi+pLYNcQWbuF3XQ89+CX9aUZ1vrq3G82d3ttjTeuIFsIUqgus
         cuzrQJgX9H0LDGy4Nk+WmSKlv+LBC7ZZ0lqrwnTx9eNXw0vA/JI6BW2jMa3olxHX1g32
         EBAlS2rRdATDcYW/2jQ/WtzKuaGYvDRUzVWu5DoAFH94E6N338xLkztkeH9UjRzqUw/4
         +NKRaZMrTjvUdbSxV5tnm5+YpeZKAe3WUN4HTTk6n1UN34X0fO/vCfP32RC39jpqKjpT
         4Naw==
X-Forwarded-Encrypted: i=1; AJvYcCU4jxW90Op+KNY0MxnDULXWiTBYpi44e7PNxIO6+UZsIW+M67K4NR1oh/AjF5hryjeHHyKHXzoSHed22lQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd6mypHNxx27U212EXBE+VBeZPtwqCsOVgUnWmpqtj6vT3ONhD
	uqdom9Xp9fucyF5huqEMXRfvr1hC441GaaPTAbn3qF5EMvQMHuNcWQTV9BhZbuc=
X-Gm-Gg: ASbGncsNMC0QgvPzDZPKUuVTyBHVMu8L4rxqMIXvjSFfSI80UJv6jW9w0+JfGH5XCsp
	kL20C7DsdvuF8pzpV3jVCDKEc52TEqWVQrxcAliiNqfKkob+jM/u2zcAoagD51Tw5jY6Q+YQM99
	Rgm8KNT9DEfOfb5LXwxpOCoFhCl3cH07scQuQFxJskouA+CQ2Oy+RhbHPY66ekyWSDHECnVBWQX
	Uyw3p2iIUd+7lt7ASNT1pRsRMHqFG4/chY89xX/5+m/se31+1uajhYooxV847jrJTy/d0JzBhbn
	1AqPxpRuiKXbmosN3mwWjx5DEy3q7Pb0sINTiDl4050=
X-Google-Smtp-Source: AGHT+IG2kXB/ttkddm2R6pEo8J2jPf9mExkVjH4E0/ie6n/jNNaV3zE2RKEoGeAJq32H4ViQBBrgRQ==
X-Received: by 2002:ac8:5d0f:0:b0:476:75d0:dbed with SMTP id d75a77b69052e-477ed746f15mr274663151cf.44.1743623070666;
        Wed, 02 Apr 2025 12:44:30 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4778317b416sm82819361cf.50.2025.04.02.12.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:44:29 -0700 (PDT)
Date: Wed, 2 Apr 2025 15:44:25 -0400
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
Message-ID: <20250402194425.GB198651@cmpxchg.org>
References: <VI2PR04MB11147E11724F867F4FCB6677DE8AF2@VI2PR04MB11147.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI2PR04MB11147E11724F867F4FCB6677DE8AF2@VI2PR04MB11147.eurprd04.prod.outlook.com>

Hi Carlos,

On Wed, Apr 02, 2025 at 11:31:58AM +0000, Carlos Song wrote:
> Hi, all
> 
> I found a 300ms~600ms IRQ off when writing 1Gb data to storage device at I.MX7d SDB board at Linux-kernel-v6.14.
> From this discussion I find the regression root cause:
> https://lore.kernel.org/linux-mm/CAJuCfpGajtAP8-kw5B5mKmhfyq6Pn67+PJgMjBeozW-qzjQMkw@mail.gmail.com/T/

Thanks for the report!

> 2. After add this patch: c0cd6f557b90 "mm: page_alloc: fix freelist movement during block conversion"
> # tracer: irqsoff
> #
> # irqsoff latency trace v1.1.5 on 6.9.0-rc4-00116-gc0cd6f557b90
> # --------------------------------------------------------------------
> # latency: 93635 us, #13758/13758, CPU#0 | (M:server VP:0, KP:0, SP:0 HP:0 #P:2)
> #    -----------------
> #    | task: dd-764 (uid:0 nice:0 policy:0 rt_prio:0)
> #    -----------------
> #  => started at: _raw_spin_lock_irqsave
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
>       dd-764       0d....    1us!: _raw_spin_lock_irqsave
>       dd-764       0d....  206us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-764       0d....  209us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-764       0d....  210us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-764       0d....  213us+: steal_suitable_fallback <-__rmqueue_pcplist
>       dd-764       0d....  281us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-764       0d....  282us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-764       0d....  284us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-764       0d....  286us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-764       0d....  288us+: steal_suitable_fallback <-__rmqueue_pcplist

This is the freelists being replenished with a loop over
__rmqueue(). Two things stand out:

1. steal_suitable_fallback() is the expensive part. The patch in
   question made this slightly worse because stealability is checked
   up-front instead of just stealing optimistically like before. So
   the pages in the block are iterated twice. This can explain some of
   the issue, but not a 100x increase in lock hold time.

2. We're doing it *a lot*. And this is the likely culprit. Whereas
   before the patch, we'd steal whole buddies and their remainders,
   afterwards there is a lot more single page stealing when grabbing
   the whole block fails. This means __rmqueue_smallest() fails more
   often and we end up doing a lot more topdown fallback scans:

>     dd-767       0d.... 2043us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2045us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2047us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2049us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-767       0d.... 2101us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2103us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-767       0d.... 2181us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2184us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-767       0d.... 2220us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2222us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-767       0d.... 2304us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2306us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-767       0d.... 2365us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2367us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2368us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2370us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2372us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-767       0d.... 2434us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2436us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2438us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2442us : __mod_zone_page_state <-__rmqueue_pcplist

The __mod_zone_page_state() is the successful allocation after
attempting to steal a few different blocks. If this had succeeded, it
would have replenished the native freelist and we'd see another
__mod_zone_page_state() quickly. Alas it failed:

>       dd-767       0d.... 2445us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2446us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2448us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2450us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-767       0d.... 2490us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2492us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-767       0d.... 2548us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2550us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-767       0d.... 2586us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2588us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-767       0d.... 2652us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2654us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-767       0d.... 2712us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2714us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2715us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2717us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2719us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2720us+: try_to_claim_block <-__rmqueue_pcplist
>       dd-767       0d.... 2778us : find_suitable_fallback <-__rmqueue_pcplist
>       dd-767       0d.... 2780us : __mod_zone_page_state <-__rmqueue_pcplist

... and we go through the whole fallback spiel for the next page.

We can definitely do better. rmqueue_bulk() holds the zone->lock the
entire time, which means nobody else can modify the freelists
underneath us. Once block claiming has failed, there is no point in
trying it again for the next page.

In fact, the recent kernel test bot report [1] appears to be related
to this. It points to c2f6ea38fc1b640aa7a2e155cc1c0410ff91afa2 ("mm:
page_alloc: don't steal single pages from biggest buddy"), a patch
that further forces bottom-up freelist scans if block stealing fails.

Attached is a patch that has __rmqueue() remember which fallback level
it had to stoop to in order to succeed; for the next page, it restarts
the search from there.

I cannot reproduce Carlos' setup, but testing with lru-file-mmap-read
from the kernel test bot, it shows a stark difference:

         upstream          patched
real     0m8.939s         0m5.546s
user     0m2.617s         0m2.528s
sys     0m52.885s        0m30.183s

Trace points confirm that try_to_reclaim_block() is called about two
orders of magnitudes less than before.

[1] https://lore.kernel.org/all/202503271547.fc08b188-lkp@intel.com/

---

From 13433454403e0c6f99ccc3b76c609034fe47e41c Mon Sep 17 00:00:00 2001
From: Johannes Weiner <hannes@cmpxchg.org>
Date: Wed, 2 Apr 2025 14:23:53 -0400
Subject: [PATCH] mm: page_alloc: speed up fallbacks in rmqueue_bulk()

Not-yet-signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 mm/page_alloc.c | 100 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 74 insertions(+), 26 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index f51aa6051a99..03b0d45ed45a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2194,11 +2194,11 @@ try_to_claim_block(struct zone *zone, struct page *page,
  * The use of signed ints for order and current_order is a deliberate
  * deviation from the rest of this file, to make the for loop
  * condition simpler.
- *
- * Return the stolen page, or NULL if none can be found.
  */
+
+/* Try to claim a whole foreign block, take a page, expand the remainder */
 static __always_inline struct page *
-__rmqueue_fallback(struct zone *zone, int order, int start_migratetype,
+__rmqueue_claim(struct zone *zone, int order, int start_migratetype,
 						unsigned int alloc_flags)
 {
 	struct free_area *area;
@@ -2236,14 +2236,26 @@ __rmqueue_fallback(struct zone *zone, int order, int start_migratetype,
 		page = try_to_claim_block(zone, page, current_order, order,
 					  start_migratetype, fallback_mt,
 					  alloc_flags);
-		if (page)
-			goto got_one;
+		if (page) {
+			trace_mm_page_alloc_extfrag(page, order, current_order,
+						    start_migratetype, fallback_mt);
+			return page;
+		}
 	}
 
-	if (alloc_flags & ALLOC_NOFRAGMENT)
-		return NULL;
+	return NULL;
+}
+
+/* Try to steal a single page from a foreign block */
+static __always_inline struct page *
+__rmqueue_steal(struct zone *zone, int order, int start_migratetype)
+{
+	struct free_area *area;
+	int current_order;
+	struct page *page;
+	int fallback_mt;
+	bool claim_block;
 
-	/* No luck claiming pageblock. Find the smallest fallback page */
 	for (current_order = order; current_order < NR_PAGE_ORDERS; current_order++) {
 		area = &(zone->free_area[current_order]);
 		fallback_mt = find_suitable_fallback(area, current_order,
@@ -2253,25 +2265,28 @@ __rmqueue_fallback(struct zone *zone, int order, int start_migratetype,
 
 		page = get_page_from_free_area(area, fallback_mt);
 		page_del_and_expand(zone, page, order, current_order, fallback_mt);
-		goto got_one;
+		trace_mm_page_alloc_extfrag(page, order, current_order,
+					    start_migratetype, fallback_mt);
+		return page;
 	}
 
 	return NULL;
-
-got_one:
-	trace_mm_page_alloc_extfrag(page, order, current_order,
-		start_migratetype, fallback_mt);
-
-	return page;
 }
 
+enum rmqueue_mode {
+	RMQUEUE_NORMAL,
+	RMQUEUE_CMA,
+	RMQUEUE_CLAIM,
+	RMQUEUE_STEAL,
+};
+
 /*
  * Do the hard work of removing an element from the buddy allocator.
  * Call me with the zone->lock already held.
  */
 static __always_inline struct page *
 __rmqueue(struct zone *zone, unsigned int order, int migratetype,
-						unsigned int alloc_flags)
+	  unsigned int alloc_flags, enum rmqueue_mode *mode)
 {
 	struct page *page;
 
@@ -2290,16 +2305,47 @@ __rmqueue(struct zone *zone, unsigned int order, int migratetype,
 		}
 	}
 
-	page = __rmqueue_smallest(zone, order, migratetype);
-	if (unlikely(!page)) {
-		if (alloc_flags & ALLOC_CMA)
+	/*
+	 * Try the different freelists, native then foreign.
+	 *
+	 * The fallback logic is expensive and rmqueue_bulk() calls in
+	 * a loop with the zone->lock held, meaning the freelists are
+	 * not subject to any outside changes. Remember in *mode where
+	 * we found pay dirt, to save us the search on the next call.
+	 */
+	switch (*mode) {
+	case RMQUEUE_NORMAL:
+		page = __rmqueue_smallest(zone, order, migratetype);
+		if (page)
+			return page;
+		fallthrough;
+	case RMQUEUE_CMA:
+		if (alloc_flags & ALLOC_CMA) {
 			page = __rmqueue_cma_fallback(zone, order);
-
-		if (!page)
-			page = __rmqueue_fallback(zone, order, migratetype,
-						  alloc_flags);
+			if (page) {
+				*mode = RMQUEUE_CMA;
+				return page;
+			}
+		}
+		fallthrough;
+	case RMQUEUE_CLAIM:
+		page = __rmqueue_claim(zone, order, migratetype, alloc_flags);
+		if (page) {
+			/* Replenished native freelist, back to normal mode */
+			*mode = RMQUEUE_NORMAL;
+			return page;
+		}
+		fallthrough;
+	case RMQUEUE_STEAL:
+		if (!(alloc_flags & ALLOC_NOFRAGMENT)) {
+			page = __rmqueue_steal(zone, order, migratetype);
+			if (page) {
+				*mode = RMQUEUE_STEAL;
+				return page;
+			}
+		}
 	}
-	return page;
+	return NULL;
 }
 
 /*
@@ -2311,6 +2357,7 @@ static int rmqueue_bulk(struct zone *zone, unsigned int order,
 			unsigned long count, struct list_head *list,
 			int migratetype, unsigned int alloc_flags)
 {
+	enum rmqueue_mode rmqm = RMQUEUE_NORMAL;
 	unsigned long flags;
 	int i;
 
@@ -2321,7 +2368,7 @@ static int rmqueue_bulk(struct zone *zone, unsigned int order,
 	}
 	for (i = 0; i < count; ++i) {
 		struct page *page = __rmqueue(zone, order, migratetype,
-								alloc_flags);
+					      alloc_flags, &rmqm);
 		if (unlikely(page == NULL))
 			break;
 
@@ -2934,6 +2981,7 @@ struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
 {
 	struct page *page;
 	unsigned long flags;
+	enum rmqueue_mode rmqm = RMQUEUE_NORMAL;
 
 	do {
 		page = NULL;
@@ -2945,7 +2993,7 @@ struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
 		if (alloc_flags & ALLOC_HIGHATOMIC)
 			page = __rmqueue_smallest(zone, order, MIGRATE_HIGHATOMIC);
 		if (!page) {
-			page = __rmqueue(zone, order, migratetype, alloc_flags);
+			page = __rmqueue(zone, order, migratetype, alloc_flags, &rmqm);
 
 			/*
 			 * If the allocation fails, allow OOM handling and
-- 
2.49.0

