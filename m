Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7532A1D8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746681861; cv=none; b=QR1sqoW2QLZpJiXP+4etFKWkYUa9BBcOxfU+FXk5cEPSM15G2PgbbLHwWA3Cip1WAXVVxaRpHY+8Vs2abpEJDG7maPOzmALscwR2ZnGvWqJNbuqv0Dv2Wb6GeRDU19l4ye6qwfWvJnkozQKyJIi2VUAPqZ++eCOTroI45mCIfJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746681861; c=relaxed/simple;
	bh=4XOokiKNtMSwJBEzFN7ZTUpq1fQCC6fMdav6CcW8xSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B61LVrCoQ4AFr4WLug8j/nygkAmLmMHUadNINRn1RXuClbVPhGDgB2/5ayCQddimKLUVGeL/vpsTqeQVJy0hrfBPu5eKukGZLSP8rbIfXVgHxOW1yKR0oKHEpaxYa6lwftp1PrKiyBLCvXj/7OlP/0YbEt6GAJCq8/aPKzKTfvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=11u99ap4; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="11u99ap4"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f53d1cb94eso6501566d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 22:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746681855; x=1747286655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5bWLG/G7Nb5+Ogn7HUeSKyLzxcaPVBfcIUAQJT4VbcQ=;
        b=11u99ap44o57vgh9U8NVFmoyvrSlYKaYLjdOY2Ua7zpTXNZxYW9KrUe1NlIOWFpAVO
         4FuPqoH30OpNVPqNxqOYNZONtEilHLtc1+mrBTMAnJPmMg0xRSdPuulI+Z78O6nJBuP4
         iSRD5wvBaazNtlabXH8hmxGmT1YvbY6TSCOjQrF5HJS1gAwHnY1axxQRO4Dvn+HkR+LW
         dg/gOYz9JWhP4EA1hBhiQU5Hww7luHaovJVTse2UTF58WaclV1E9q2V3jxceYUrpT5HQ
         Bkg8nvrG1rGRAYDTgveICvlXRc2Cf5xPGGSEZItheXQoTJLp8QI7zJxIK+8C56x2h4cO
         5PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746681855; x=1747286655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bWLG/G7Nb5+Ogn7HUeSKyLzxcaPVBfcIUAQJT4VbcQ=;
        b=UcM+BNHQ+lCvcxKAe+pjGV4D1Fu7ul/RQzUkB23HoCPtxAcNYRlGHGgYCGX6tzdRQm
         K6uVGGyNsVzZOtaDRE+sD2RQo6Cx0piQXZQ8tSjTt2Lf2SOQC+68yVBrZubbU/oL1JNK
         ko6NbR44pBamQcm3MJ4C1Wjdc5lg51qUyWazW2KAV35M4ffm6cH1Mb92LTNvEh+K/L5Y
         +GkCFX2AnrcO2gCUMM9zur2Vz9n2F+PdxhGZcBNd9b9KXLCMbmDnj1GNl+ITPSG+ck2D
         wVHbUbVpTlpOjqOEa1XaGmAdN6eGvZ5iiGL5lz7DdvLUOnC2fqfXqiymWVGcu7IDv06N
         uXMg==
X-Forwarded-Encrypted: i=1; AJvYcCXNeOor95WufIm+b2OEllxPcvx6vhw3nTYm+4r5Ldf4dsCuoQr+x76YigP07dQXfzYAB8/gPlr5m9EMMY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfY6gk/h7US/w+3iIVMVWhMg/uyHPThYnCD5BDDjcvRe7TP2aI
	VO+HEElD2k72YVth3VgfxrFQVOjeWpD2zKM6EKO5Ow6ZpSw6XX0iHwqlwSiI9HI=
X-Gm-Gg: ASbGncuX0muLtF32w5cpdUcxO8q0GO+6iRqPNIT3nfjt8kCEkRomILDtx190zmXw37D
	j6hbMVv43LolTgZ10LyWFifCV17KVpUoyuXcjigfBgcInIxvSQXtpLprIHHIANhkgpOmICNJqNb
	HMYvyuxU6Qa8V2E0tLjzUpK6bVNtL92cDQ+RrBw+AdcEhkGv0/uxlT0OKpU1st6hTQbD+bqO+cC
	i7MQ7Tl1ZyzMOJBiQRBLJCoVB4i2zTKDePLJDDKEzSkpsk5XLQKhewMp+q7TbB0/ZRHT/AoIiEm
	z+1Zwh41REHiGmd2L0LvKbcEqJ2ChDK8S8kBKRw=
X-Google-Smtp-Source: AGHT+IEKyyrg6irmELONZJ6Vl5mPpdutS1KJ3dRWIMgQj3cMBuzsQaTxGTGW/wubqGjWpUUCI3H87Q==
X-Received: by 2002:a05:6214:c46:b0:6f2:b7cd:7cac with SMTP id 6a1803df08f44-6f542aedcb1mr91706416d6.31.1746681855276;
        Wed, 07 May 2025 22:24:15 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f54279544csm28048576d6.94.2025.05.07.22.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 22:24:14 -0700 (PDT)
Date: Thu, 8 May 2025 01:24:09 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mm/page_isolation: make page isolation a
 standalone bit.
Message-ID: <20250508052409.GB320498@cmpxchg.org>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-2-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507211059.2211628-2-ziy@nvidia.com>

On Wed, May 07, 2025 at 05:10:56PM -0400, Zi Yan wrote:
> During page isolation, the original migratetype is overwritten, since
> MIGRATE_* are enums and stored in pageblock bitmaps. Change
> MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
> PB_migrate_skip, so that migratetype is not lost during pageblock
> isolation. pageblock bits needs to be word aligned, so expand
> the number of pageblock bits from 4 to 8 and make PB_migrate_isolate bit 7.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  include/linux/mmzone.h          | 17 ++++++++++----
>  include/linux/page-isolation.h  |  2 +-
>  include/linux/pageblock-flags.h | 33 +++++++++++++++++++++++++-
>  mm/page_alloc.c                 | 41 ++++++++++++++++++++++++++++++++-
>  4 files changed, 86 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index b19a98c20de8..9ec022a0b826 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -106,14 +106,23 @@ static inline bool migratetype_is_mergeable(int mt)
>  
>  extern int page_group_by_mobility_disabled;
>  
> -#define MIGRATETYPE_MASK ((1UL << PB_migratetype_bits) - 1)
> +#ifdef CONFIG_MEMORY_ISOLATION
> +#define MIGRATETYPE_MASK ((BIT(PB_migratetype_bits) - 1) | PB_migrate_isolate_bit)
> +#else
> +#define MIGRATETYPE_MASK (BIT(PB_migratetype_bits) - 1)
> +#endif
>  
> +#ifdef CONFIG_MEMORY_ISOLATION
> +unsigned long get_pageblock_migratetype(const struct page *page);
> +#else
>  #define get_pageblock_migratetype(page)					\
>  	get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
>  
> -#define folio_migratetype(folio)				\
> -	get_pfnblock_flags_mask(&folio->page, folio_pfn(folio),		\
> -			MIGRATETYPE_MASK)
> +#endif
> +
> +#define folio_migratetype(folio)					\
> +	get_pageblock_migratetype(&folio->page)
> +
>  struct free_area {
>  	struct list_head	free_list[MIGRATE_TYPES];
>  	unsigned long		nr_free;
> diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
> index 898bb788243b..51797dc39cbc 100644
> --- a/include/linux/page-isolation.h
> +++ b/include/linux/page-isolation.h
> @@ -5,7 +5,7 @@
>  #ifdef CONFIG_MEMORY_ISOLATION
>  static inline bool is_migrate_isolate_page(struct page *page)
>  {
> -	return get_pageblock_migratetype(page) == MIGRATE_ISOLATE;
> +	return get_pageblock_isolate(page);

The old version still works, right?

It would match is_migrate_isolate() a bit better, but no strong
feelings either way...

>  static inline bool is_migrate_isolate(int migratetype)
>  {
> diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
> index 0c4963339f0b..9fadae5892b2 100644
> --- a/include/linux/pageblock-flags.h
> +++ b/include/linux/pageblock-flags.h
> @@ -20,7 +20,10 @@ enum pageblock_bits {
>  	PB_migrate_end = PB_migrate + PB_migratetype_bits - 1,
>  			/* 3 bits required for migrate types */
>  	PB_migrate_skip,/* If set the block is skipped by compaction */
> -
> +#ifdef CONFIG_MEMORY_ISOLATION
> +	PB_migrate_isolate = 7, /* If set the block is isolated */
> +			/* set it to 7 to make pageblock bit word aligned */
> +#endif
>  	/*
>  	 * Assume the bits will always align on a word. If this assumption
>  	 * changes then get/set pageblock needs updating.
> @@ -28,6 +31,10 @@ enum pageblock_bits {
>  	NR_PAGEBLOCK_BITS
>  };
>  
> +#ifdef CONFIG_MEMORY_ISOLATION
> +#define PB_migrate_isolate_bit BIT(PB_migrate_isolate)
> +#endif
> +
>  #if defined(CONFIG_PAGE_BLOCK_ORDER)
>  #define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
>  #else
> @@ -105,4 +112,28 @@ static inline void set_pageblock_skip(struct page *page)
>  }
>  #endif /* CONFIG_COMPACTION */
>  
> +#ifdef CONFIG_MEMORY_ISOLATION
> +#define get_pageblock_isolate(page) \
> +	get_pfnblock_flags_mask(page, page_to_pfn(page),	\
> +			PB_migrate_isolate_bit)
> +#define clear_pageblock_isolate(page) \
> +	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),	\
> +			PB_migrate_isolate_bit)
> +#define set_pageblock_isolate(page) \
> +	set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,	\
> +			page_to_pfn(page),			\
> +			PB_migrate_isolate_bit)

Would it make sense to move these to page_isolation.c? Then they
wouldn't have to be macros.

> +#else
> +static inline bool get_pageblock_isolate(struct page *page)
> +{
> +	return false;
> +}
> +static inline void clear_pageblock_isolate(struct page *page)
> +{
> +}
> +static inline void set_pageblock_isolate(struct page *page)
> +{
> +}
> +#endif /* CONFIG_MEMORY_ISOLATION */
> +
>  #endif	/* PAGEBLOCK_FLAGS_H */
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index c77592b22256..acf68ef041d8 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -381,12 +381,40 @@ unsigned long get_pfnblock_flags_mask(const struct page *page,
>  	return (word >> bitidx) & mask;
>  }
>  
> +#ifdef CONFIG_MEMORY_ISOLATION
> +unsigned long get_pageblock_migratetype(const struct page *page)
> +{
> +	unsigned long flags;
> +
> +	flags = get_pfnblock_flags_mask(page, page_to_pfn(page),
> +			MIGRATETYPE_MASK);
> +	if (flags & PB_migrate_isolate_bit)
> +		return MIGRATE_ISOLATE;
> +
> +	return flags;
> +}

Since MIGRATETYPE_MASK includes the isolate bit if it exists, I think
you can share the get_pfnblock_flags_mask() part:

static inline get_pageblock_migratetype(const struct page *page)
{
	unsigned long pfn = page_to_pfn(page);

	flags = get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
#ifdef CONFIG_MEMORY_ISOLATEION
	if (flags & PB_migrate_isolate_bit)
		return MIGRATE_ISOLATE;
#endif
	return flags;
}

> +static __always_inline int get_pfnblock_migratetype(const struct page *page,
> +					unsigned long pfn)
> +{
> +	unsigned long flags;
> +
> +	flags = get_pfnblock_flags_mask(page, pfn,
> +			MIGRATETYPE_MASK);
> +	if (flags & PB_migrate_isolate_bit)
> +		return MIGRATE_ISOLATE;
> +
> +	return flags;
> +}
> +#else
>  static __always_inline int get_pfnblock_migratetype(const struct page *page,
>  					unsigned long pfn)
>  {
>  	return get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
>  }

Same with this one.

>  
> +#endif
> +
>  /**
>   * set_pfnblock_flags_mask - Set the requested group of flags for a pageblock_nr_pages block of pages
>   * @page: The page within the block of interest
> @@ -402,8 +430,14 @@ void set_pfnblock_flags_mask(struct page *page, unsigned long flags,
>  	unsigned long bitidx, word_bitidx;
>  	unsigned long word;
>  
> +#ifdef CONFIG_MEMORY_ISOLATION
> +	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 8);
> +	/* extra one for MIGRATE_ISOLATE */
> +	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits) + 1);
> +#else
>  	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
>  	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
> +#endif
>  
>  	bitmap = get_pageblock_bitmap(page, pfn);
>  	bitidx = pfn_to_bitidx(page, pfn);
> @@ -426,7 +460,12 @@ void set_pageblock_migratetype(struct page *page, int migratetype)
>  		     migratetype < MIGRATE_PCPTYPES))
>  		migratetype = MIGRATE_UNMOVABLE;
>  
> -	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
> +#ifdef CONFIG_MEMORY_ISOLATION
> +	if (migratetype == MIGRATE_ISOLATE)
> +		set_pageblock_isolate(page);

Are there paths actually doing this after the second patch?

There are many instances that want to *read* the migratetype or
MIGRATE_ISOLATE, but only isolation code should be manipulating that
bit through the dedicated set/toggle_pageblock_isolate API.

If there isn't one, it might be good to enforce this with a VM_WARN
instead.

> +	else
> +#endif
> +		set_pfnblock_flags_mask(page, (unsigned long)migratetype,
>  				page_to_pfn(page), MIGRATETYPE_MASK);

If the branch stays, you could add a `return' to the MIGRATE_ISOLATE
leg, drop the else and indent this line normally.
