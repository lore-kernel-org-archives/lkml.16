Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C2561FCE
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642909; cv=none; b=i1PGWZ+HbHfeQ4ezSHiIrgE+CIm6OQ/K01uS3fAqciVyB+lWFOpzHCAzQ+chzIHZAjQyaDmcM8g6XrNG18ouNHEPkdEGrCxIboAv6g/0hACAdsicHLpwwvYQlCC4RZqbn1unlTN4Ui5cy08EKBfngCO8gCTf3VXkbZuq6nL5jIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642909; c=relaxed/simple;
	bh=bBjjj9zsbk9H9i6/iZApKjtgWkJguNo3d+xw1A7B87s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrdaWbGovcsAtnAaf6pPYZIdFaGAIHHzpVViNLArNdKkVIWOPr9UdngtglfgwBD2pvAT4U/vi7/kAvA8O119FE1+IrNPuHEhpvfVoC5XvDKNEgkVIYjIbRQoPhocx7h4qNNRwSU38VXn/tbrQcVu1mmJFeM9UaOgS6Qyeq3rPSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EsKz0aCd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EsKz0aCd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747642905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=u+MG9y4O8ppEorrD5bhLn8mSmUVZv9zwa5Zj0IOyggI=;
	b=EsKz0aCdujDIVCD1FTbUXocfDanVLmXdFagmcXTlr80hMsXgekdTzzZ6NrQjsIdTykBasP
	paPUojbtj3roBR4Se3d5jJR/+wfMAnLv+03Bw2D23n+Qo9xal49faf5wAr5imGG65b7RBj
	yXfTtaPmdUMs/4tZDu+w2VDxahb9ULo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-6b5q6TpoMTiB8a2P_O0PcQ-1; Mon, 19 May 2025 04:21:44 -0400
X-MC-Unique: 6b5q6TpoMTiB8a2P_O0PcQ-1
X-Mimecast-MFC-AGG-ID: 6b5q6TpoMTiB8a2P_O0PcQ_1747642903
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-445135eb689so6279755e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642903; x=1748247703;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u+MG9y4O8ppEorrD5bhLn8mSmUVZv9zwa5Zj0IOyggI=;
        b=rg78cvtYe5GuFRZJRTPJLF9Hd/kVaIRGIdZHf9IEb2tbWYBuPaNYo3x58LGVZ/ObIH
         qzM22DOTEdyfcbopTqqMfsexwHsb60CA9DXsT8Sac14A0Nkb0xDQzdNXhAHrhTXVmeFD
         Ic8a66yWp4R+rI0e2unRo4zcCXEoNlqJKPNEOQDWYWOk5kF2srfq+8Ll7yDM+dxCVIpq
         cvBi/vY3emYeILmqaZes2vKAObCRLW8riUfRbTcR+31/4RRTZCuyGzYQ0AoJJIjLDviB
         y5FwDUBs48MJ5nFgxRNd8ZuM3QHD/kj2JRNIy/5iSsU8gIMv2NifIU+HCUohynboWz2I
         GFMA==
X-Forwarded-Encrypted: i=1; AJvYcCU0aVpFahxON2PcihfUioyZlrUCgPYVAH8/twDp3Xh+TPHCNzKhd2o8dUbouTSHeGB+QYrMHE/WYWcb3NY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2gIFQIPrRwuILNabS2Nh+cQkbbNrlITHajRDmE3ExtV1Bj24+
	kGGmp76f7ElbnPZ/qLaU68QDRlzYhXXWZMlEMPywVMyFfa+VMWSX44JGNLzwxa17XuiR2h7RyEa
	MGO8J3U1ceMAfk5lKB03PtzpdjT2i58jI5GCPlFzr+xwnvNhSM3JJOr2UBdsxLEh0pw==
X-Gm-Gg: ASbGnctEEhTYtyGchH2LIZ+DJC42k/QWVtVA4AUmrehhzYTkjfROFx490AxdZvIjDNA
	VQn4mpYzcJFrptE92N0kPXOdkYOg0KZaPNNHD4tGxdzllxK/NZQgGI1uko+dm11g5xgl7Xfq7h1
	tSCjEQ2gGrkgd/FlUgUVjVZ2mDRDo3wDpBFXmFb/BG87L5tQdI5KJ7btcMRAsPQ50hNKI2VzLyQ
	DidYuwX+/F5aCRCxMXbLvxhZIYXQLpyV8ymgmFZTFHZDu6ltcqXEFssmrR8YSikFNrfhmgt5wgF
	GwOQzjT5WOCZiV/fotHGkEaitdLZj1tLftAOp0zzHGNrjUdS/KpoWwfpjNJBPz6ZOJbwTQ15i+T
	hAzxBpuwwD95zFRimuUb+srkoRFNYXI7DzJoSDdM=
X-Received: by 2002:a05:600c:3114:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-442fd6445bdmr117043865e9.17.1747642903171;
        Mon, 19 May 2025 01:21:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSAFjAk60JdnbWGV8nMpoKRSo95W61/xKU0nMNnL2WA8IKD61o0r0m8m7GIhp6pzuiWP8kSw==
X-Received: by 2002:a05:600c:3114:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-442fd6445bdmr117043585e9.17.1747642902730;
        Mon, 19 May 2025 01:21:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:3a00:5662:26b3:3e5d:438e? (p200300d82f3c3a00566226b33e5d438e.dip0.t-ipconnect.de. [2003:d8:2f3c:3a00:5662:26b3:3e5d:438e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebd46aa4sm142242045e9.1.2025.05.19.01.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:21:42 -0700 (PDT)
Message-ID: <63ba9fe3-e384-4396-bd86-fe62150ed1ab@redhat.com>
Date: Mon, 19 May 2025 10:21:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] mm/page_isolation: remove migratetype from
 move_freepages_block_isolate()
To: Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Baolin Wang
 <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang
 <richardycc@google.com>, linux-kernel@vger.kernel.org
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-3-ziy@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250509200111.3372279-3-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.05.25 22:01, Zi Yan wrote:
> Since migratetype is no longer overwritten during pageblock isolation,
> moving pageblocks to and from MIGRATE_ISOLATE no longer needs migratetype.
> 
> Add MIGRATETYPE_NO_ISO_MASK to allow read before-isolation migratetype
> when a pageblock is isolated. It is used by move_freepages_block_isolate().
> 
> Add pageblock_isolate_and_move_free_pages() and
> pageblock_unisolate_and_move_free_pages() to be explicit about the page
> isolation operations. Both share the common code in
> __move_freepages_block_isolate(), which is renamed from
> move_freepages_block_isolate().
> 
> Make set_pageblock_migratetype() only accept non MIGRATE_ISOLATE types,
> so that one should use set_pageblock_isolate() to isolate pageblocks.
> 
> Two consequential changes:
> 1. move pageblock migratetype code out of __move_freepages_block().
> 2. in online_pages() from mm/memory_hotplug.c, move_pfn_range_to_zone() is
>     called with MIGRATE_MOVABLE instead of MIGRATE_ISOLATE and all affected
>     pageblocks are isolated afterwards. Otherwise, all online pageblocks
>     will have non-determined migratetype.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>   include/linux/mmzone.h         |  4 +-
>   include/linux/page-isolation.h |  5 ++-
>   mm/memory_hotplug.c            |  7 +++-
>   mm/page_alloc.c                | 73 +++++++++++++++++++++++++---------
>   mm/page_isolation.c            | 27 ++++++++-----
>   5 files changed, 82 insertions(+), 34 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 7ef01fe148ce..f66895456974 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -107,8 +107,10 @@ static inline bool migratetype_is_mergeable(int mt)
>   extern int page_group_by_mobility_disabled;
>   
>   #ifdef CONFIG_MEMORY_ISOLATION
> -#define MIGRATETYPE_MASK ((BIT(PB_migratetype_bits) - 1) | PB_migrate_isolate_bit)
> +#define MIGRATETYPE_NO_ISO_MASK (BIT(PB_migratetype_bits) - 1)
> +#define MIGRATETYPE_MASK (MIGRATETYPE_NO_ISO_MASK | PB_migrate_isolate_bit)
>   #else
> +#define MIGRATETYPE_NO_ISO_MASK MIGRATETYPE_MASK
>   #define MIGRATETYPE_MASK (BIT(PB_migratetype_bits) - 1)
>   #endif
>   
> diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
> index 898bb788243b..b0a2af0a5357 100644
> --- a/include/linux/page-isolation.h
> +++ b/include/linux/page-isolation.h
> @@ -26,9 +26,10 @@ static inline bool is_migrate_isolate(int migratetype)
>   #define REPORT_FAILURE	0x2
>   
>   void set_pageblock_migratetype(struct page *page, int migratetype);
> +void set_pageblock_isolate(struct page *page);
>   
> -bool move_freepages_block_isolate(struct zone *zone, struct page *page,
> -				  int migratetype);
> +bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page);
> +bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
>   
>   int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>   			     int migratetype, int flags);
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index b1caedbade5b..c86c47bba019 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1178,6 +1178,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>   	const int nid = zone_to_nid(zone);
>   	int ret;
>   	struct memory_notify arg;
> +	unsigned long isol_pfn;
>   
>   	/*
>   	 * {on,off}lining is constrained to full memory sections (or more
> @@ -1192,7 +1193,11 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>   
>   
>   	/* associate pfn range with the zone */
> -	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
> +	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_MOVABLE);
> +	for (isol_pfn = pfn;
> +	     isol_pfn < pfn + nr_pages;
> +	     isol_pfn += pageblock_nr_pages)
> +		set_pageblock_isolate(pfn_to_page(isol_pfn));

Can we move that all the way into memmap_init_range(), where we do the
set_pageblock_migratetype()?

The MIGRATE_UNMOVABLE in mhp_init_memmap_on_memory() is likely fine: all
pages in that pageblock will be used for the memmap. Everything is unmovable,
but no free pages so ... nobody cares? :)


diff --git a/mm/internal.h b/mm/internal.h
index 6b8ed20177432..bc102846fcf1f 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -821,7 +821,7 @@ extern void *memmap_alloc(phys_addr_t size, phys_addr_t align,
  			  int nid, bool exact_nid);
  
  void memmap_init_range(unsigned long, int, unsigned long, unsigned long,
-		unsigned long, enum meminit_context, struct vmem_altmap *, int);
+		unsigned long, enum meminit_context, struct vmem_altmap *, bool);
  
  #if defined CONFIG_COMPACTION || defined CONFIG_CMA
  
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index b1caedbade5b1..4b2cf20ad21fb 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -764,13 +764,13 @@ static inline void section_taint_zone_device(unsigned long pfn)
   * and resizing the pgdat/zone data to span the added pages. After this
   * call, all affected pages are PageOffline().
   *
- * All aligned pageblocks are initialized to the specified migratetype
- * (usually MIGRATE_MOVABLE). Besides setting the migratetype, no related
- * zone stats (e.g., nr_isolate_pageblock) are touched.
+ * All aligned pageblocks are initialized to MIGRATE_MOVABLE, and are isolated
+ * if requested. Besides setting the migratetype, no related zone stats (e.g.,
+ * nr_isolate_pageblock) are touched.
   */
  void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
  				  unsigned long nr_pages,
-				  struct vmem_altmap *altmap, int migratetype)
+				  struct vmem_altmap *altmap, bool isolate)
  {
  	struct pglist_data *pgdat = zone->zone_pgdat;
  	int nid = pgdat->node_id;
@@ -802,7 +802,7 @@ void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
  	 * are reserved so nobody should be touching them so we should be safe
  	 */
  	memmap_init_range(nr_pages, nid, zone_idx(zone), start_pfn, 0,
-			 MEMINIT_HOTPLUG, altmap, migratetype);
+			 MEMINIT_HOTPLUG, altmap, isolate);
  
  	set_zone_contiguous(zone);
  }
@@ -1127,7 +1127,7 @@ int mhp_init_memmap_on_memory(unsigned long pfn, unsigned long nr_pages,
  	if (mhp_off_inaccessible)
  		page_init_poison(pfn_to_page(pfn), sizeof(struct page) * nr_pages);
  
-	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_UNMOVABLE);
+	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, false);
  
  	for (i = 0; i < nr_pages; i++) {
  		struct page *page = pfn_to_page(pfn + i);
@@ -1192,7 +1192,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
  
  
  	/* associate pfn range with the zone */
-	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
+	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, true);
  
  	arg.start_pfn = pfn;
  	arg.nr_pages = nr_pages;
diff --git a/mm/memremap.c b/mm/memremap.c
index c417c843e9b1f..e47f6809f254b 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -254,7 +254,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
  		zone = &NODE_DATA(nid)->node_zones[ZONE_DEVICE];
  		move_pfn_range_to_zone(zone, PHYS_PFN(range->start),
  				PHYS_PFN(range_len(range)), params->altmap,
-				MIGRATE_MOVABLE);
+				false);
  	}
  
  	mem_hotplug_done();
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 1c5444e188f82..041106fc524be 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -867,14 +867,14 @@ static void __init init_unavailable_range(unsigned long spfn,
   * up by memblock_free_all() once the early boot process is
   * done. Non-atomic initialization, single-pass.
   *
- * All aligned pageblocks are initialized to the specified migratetype
- * (usually MIGRATE_MOVABLE). Besides setting the migratetype, no related
- * zone stats (e.g., nr_isolate_pageblock) are touched.
+ * All aligned pageblocks are initialized to MIGRATE_MOVABLE, and are isolated
+ * if requested. Besides setting the migratetype, no related zone stats (e.g.,
+ * nr_isolate_pageblock) are touched.
   */
  void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone,
  		unsigned long start_pfn, unsigned long zone_end_pfn,
  		enum meminit_context context,
-		struct vmem_altmap *altmap, int migratetype)
+		struct vmem_altmap *altmap, bool isolate)
  {
  	unsigned long pfn, end_pfn = start_pfn + size;
  	struct page *page;
@@ -931,7 +931,9 @@ void __meminit memmap_init_range(unsigned long size, int nid, unsigned long zone
  		 * over the place during system boot.
  		 */
  		if (pageblock_aligned(pfn)) {
-			set_pageblock_migratetype(page, migratetype);
+			set_pageblock_migratetype(page, MIGRATE_MOVABLE);
+			if (isolate)
+				set_pageblock_isolate(page, isolate)
  			cond_resched();
  		}
  		pfn++;
@@ -954,7 +956,7 @@ static void __init memmap_init_zone_range(struct zone *zone,
  		return;
  
  	memmap_init_range(end_pfn - start_pfn, nid, zone_id, start_pfn,
-			  zone_end_pfn, MEMINIT_EARLY, NULL, MIGRATE_MOVABLE);
+			  zone_end_pfn, MEMINIT_EARLY, NULL, false);
  
  	if (*hole_pfn < start_pfn)
  		init_unavailable_range(*hole_pfn, start_pfn, zone_id, nid);
-- 
2.49.0



As an alterantive, a second "isolate" parameter and make sure that migratetype is
never MIGRATE_ISOLATE.

[...]

> --- a/mm/page_isolation.c
> +++ b/mm/page_isolation.c
> @@ -25,6 +25,12 @@ static inline void clear_pageblock_isolate(struct page *page)
>   	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),
>   			PB_migrate_isolate_bit);
>   }
> +void set_pageblock_isolate(struct page *page)
> +{
> +	set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
> +			page_to_pfn(page),
> +			PB_migrate_isolate_bit);
> +}

Probably better placed in the previous patch, and in the header (see comment to #1).

-- 
Cheers,

David / dhildenb

