Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFCA4B1E76
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642133; cv=none; b=O7uqS3A63NChd3DhYOhp1ixVhOQSlhVKV0EAKoU/pRwn49FsclORwE7agyJTgojrJMdyKIXNn/LRXKiZGANcH/jig5O2UoFIs39UWfmhxEks50ZlfDw3EGIa/Aj9Qx2UVL9zvd5EVeejLXKH7k23Dq8NjygTDdfN+k/JoaHN4No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642133; c=relaxed/simple;
	bh=ZEH79xkiv+3W9M3jqrE814zzN7DiDh91paY62WF/ul0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qRCbtm00AZRicAX/0Wm4QdtuUGB87rMy1nHnJBgY7OCsJhTCvnKoobYYDds0IyfhXkWj6JQSSdAlFlyVaCips4AnYYxrjtDro3asihfWyunkehN/RYa1Wq6pGFosG+DmCUNEOGTatvcQcDVh6wgZlm/U58YZO2G52zDl8hRyjDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W4VEGgJ+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W4VEGgJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747642129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FM/rxrjxuQ0BFg/Ab2gHXktIcFuldiVbhNFXhCTqZdk=;
	b=W4VEGgJ+ijiHgUo41/kZMYT3sLIK4ULiFw89nazsIcYTmCAeR1uXV4c7zP8UgD3Xk2YG53
	3D5y0ocAyu1zFNGZkoAsLzzlr2V0H1Xt1E6/q7jj+HJ3R6RgdilpWtmTc7ONiHrcP9ma17
	n9z2hxHn51NZD3zNae0kGVMDyP+1QUA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-SDL662O1O26bMKFUk6P0_w-1; Mon, 19 May 2025 04:08:47 -0400
X-MC-Unique: SDL662O1O26bMKFUk6P0_w-1
X-Mimecast-MFC-AGG-ID: SDL662O1O26bMKFUk6P0_w_1747642126
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so24290835e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642126; x=1748246926;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FM/rxrjxuQ0BFg/Ab2gHXktIcFuldiVbhNFXhCTqZdk=;
        b=ApD9k60A2Yk1gfZsJmo4tZRn/FQ5LjN5sJPi6HB1Tb/JAqzThktrn5B/EcnvaOTpCS
         6UWkrKtByTVivziy5DhrTv1qzABndWeRDZOQk9636p/TJAc06mFJyjnw9lfNsvM45sVm
         yBWE4b3X7FT78W8uHSOWFTjYzaUC7Ymwqwkz8LQgGQBl8puYdMWi8pKk1Q/juKbpYVaK
         VlidWwFawD1RLu9xgT3EHVjjMIccMXlDELPpp0txP86lJrwnN+YTtY3AQyRM6aIfLfrI
         TNH6eKz2s2K5760d91rzgSubmFYsaZ8UBpditNmZY+hgyQqWJMZEP6kO6Nw9xbwVvE8n
         M5Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWRdDLjT3UvQ84zrrIL2EyuGjU8mpNX9+GEqfbTi9BsdimMH5jTUMIuBizBy5BTjLTuWxYwTQhus5O4oHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVsF7j78M0QLuQ+1Ntw70exly8bU6YZp71Nh9Xgu6CR3wuIw0G
	I8qrDfidHgNp9uFlwOrhHRFHlx2I37YTzJpUTVkYKMejp9sefBiltmXOfkpAbOPEhXCDSIALjv1
	/5vHTxRqxnVF/SKLIJSUI1thR/0xpCNhesfYORS3cD/kx+IEVuDVqtAjMn3bHmSZplA==
X-Gm-Gg: ASbGncvWvtQ9nxImv7lDDE8RiwoQcrmgQhruGgdVqSiQ+iLeWkKrEpOH+CIgfZZd+vo
	JTugaFmjkCo+D38WLznb/epCFaaK5npiOdIWbgeuPgDPDZxjGo51zeS7fYJIfrxnFzw8okBspt6
	wXDo+FivCykwGLL4uKrwQMUp+IT9UL8pJpOl5o6v1Gq78RYhvkk/OvEmWxXrD09DrcEW/VX6/gc
	6quMSbtG/RUlTzGCBmN679MUhHZOJDejTMYyThMGq/0w+kotSDTl6cXWA/W45xh9ZXZ5DwUX9Wd
	+jZMUqwYXWczleZC8FFnQ4mTFG18sVj+ic7Rx3JXwXlEvdB+3A1n/lFe+Z26ALqBjyiSV6cfohZ
	e/0Rq5UdJy2dl9Gvta24UfYDDgmfw7hwwFV2a62c=
X-Received: by 2002:a05:600c:528a:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-442ff03c4edmr116309505e9.30.1747642126383;
        Mon, 19 May 2025 01:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFduBqkH4k774EAkez9Uz8t4ojhxJFHqhqHCrtbldv3ESoFEMQq2RERfvxqRo7N9E/Y0DjOnw==
X-Received: by 2002:a05:600c:528a:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-442ff03c4edmr116309225e9.30.1747642125980;
        Mon, 19 May 2025 01:08:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:3a00:5662:26b3:3e5d:438e? (p200300d82f3c3a00566226b33e5d438e.dip0.t-ipconnect.de. [2003:d8:2f3c:3a00:5662:26b3:3e5d:438e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3674fed67sm7808681f8f.89.2025.05.19.01.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:08:45 -0700 (PDT)
Message-ID: <506798aa-0280-4f63-9c0e-d5f2f5d58c3c@redhat.com>
Date: Mon, 19 May 2025 10:08:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] mm/page_isolation: make page isolation a
 standalone bit.
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
 <20250509200111.3372279-2-ziy@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250509200111.3372279-2-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.05.25 22:01, Zi Yan wrote:
> During page isolation, the original migratetype is overwritten, since
> MIGRATE_* are enums and stored in pageblock bitmaps. Change
> MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
> PB_migrate_skip, so that migratetype is not lost during pageblock
> isolation. pageblock bits needs to be word aligned, so expand
> the number of pageblock bits from 4 to 8 and make PB_migrate_isolate bit 7.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>   include/linux/mmzone.h          | 15 ++++++++------
>   include/linux/pageblock-flags.h |  9 ++++++++-
>   mm/page_alloc.c                 | 36 ++++++++++++++++++++++++++++++++-
>   mm/page_isolation.c             | 11 ++++++++++
>   4 files changed, 63 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index b19a98c20de8..7ef01fe148ce 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -106,14 +106,17 @@ static inline bool migratetype_is_mergeable(int mt)
>   
>   extern int page_group_by_mobility_disabled;
>   
> -#define MIGRATETYPE_MASK ((1UL << PB_migratetype_bits) - 1)
> +#ifdef CONFIG_MEMORY_ISOLATION
> +#define MIGRATETYPE_MASK ((BIT(PB_migratetype_bits) - 1) | PB_migrate_isolate_bit)
> +#else
> +#define MIGRATETYPE_MASK (BIT(PB_migratetype_bits) - 1)
> +#endif
> +
> +unsigned long get_pageblock_migratetype(const struct page *page);
>   
> -#define get_pageblock_migratetype(page)					\
> -	get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
> +#define folio_migratetype(folio)					\
> +	get_pageblock_migratetype(&folio->page)
>   
> -#define folio_migratetype(folio)				\
> -	get_pfnblock_flags_mask(&folio->page, folio_pfn(folio),		\
> -			MIGRATETYPE_MASK)
>   struct free_area {
>   	struct list_head	free_list[MIGRATE_TYPES];
>   	unsigned long		nr_free;
> diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
> index 0c4963339f0b..00040e7df8c8 100644
> --- a/include/linux/pageblock-flags.h
> +++ b/include/linux/pageblock-flags.h
> @@ -20,7 +20,10 @@ enum pageblock_bits {
>   	PB_migrate_end = PB_migrate + PB_migratetype_bits - 1,
>   			/* 3 bits required for migrate types */
>   	PB_migrate_skip,/* If set the block is skipped by compaction */
> -
> +#ifdef CONFIG_MEMORY_ISOLATION
> +	PB_migrate_isolate = 7, /* If set the block is isolated */
> +			/* set it to 7 to make pageblock bit word aligned */

I think what we want to do here is align NR_PAGEBLOCK_BITS up to 4 bits 
at relevant places. Or go to the next power-of-2.

Could we simply to that using something like

#ifdef CONFIG_MEMORY_ISOLATION
	PB_migrate_isolate, /* If set the block is isolated */
#endif
	__NR_PAGEBLOCK_BITS
};

/* We always want the bits to be a power of 2. */
#define NR_PAGEBLOCK_BITS (roundup_pow_of_two(__NR_PAGEBLOCK_BITS))


Would something like that work?

> +#endif
>   	/*
>   	 * Assume the bits will always align on a word. If this assumption
>   	 * changes then get/set pageblock needs updating.
> @@ -28,6 +31,10 @@ enum pageblock_bits {
>   	NR_PAGEBLOCK_BITS
 >   };>
> +#ifdef CONFIG_MEMORY_ISOLATION
> +#define PB_migrate_isolate_bit BIT(PB_migrate_isolate)
> +#endif
> +

I assume we should first change users ot "1 << (PB_migrate_skip)" to 
PB_migrate_skip_bit to keep it similar.

>   #if defined(CONFIG_PAGE_BLOCK_ORDER)
>   #define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
>   #else
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index c77592b22256..04e301fb4879 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -381,10 +381,31 @@ unsigned long get_pfnblock_flags_mask(const struct page *page,
>   	return (word >> bitidx) & mask;
>   }
>   
> +unsigned long get_pageblock_migratetype(const struct page *page)
> +{
> +	unsigned long flags;
> +
> +	flags = get_pfnblock_flags_mask(page, page_to_pfn(page),
> +			MIGRATETYPE_MASK);

When calling functions, we usually indent up to the beginning of the 
parameters. Same for the other cases below.

... or just exceed the 80 chars a bit in this case. :)

> +#ifdef CONFIG_MEMORY_ISOLATION
> +	if (flags & PB_migrate_isolate_bit)
> +		return MIGRATE_ISOLATE;
> +#endif
> +	return flags;
> +}
> +
>   static __always_inline int get_pfnblock_migratetype(const struct page *page,
>   					unsigned long pfn)
>   {
> -	return get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
> +	unsigned long flags;
> +
> +	flags = get_pfnblock_flags_mask(page, pfn,
> +			MIGRATETYPE_MASK);

This should fit into a single line.

> +#ifdef CONFIG_MEMORY_ISOLATION
> +	if (flags & PB_migrate_isolate_bit)
> +		return MIGRATE_ISOLATE;
> +#endif

If you call get_pfnblock_flags_mask() with MIGRATETYPE_MASK, how could 
you ever get PB_migrate_isolate_bit?


I think what we should do is

1) Rename get_pfnblock_flags_mask() to get_pfnblock_flags()

2) Remove the mask parameter

3) Perform the masking in all callers.



Maybe, we should convert set_pfnblock_flags_mask() to

void set_clear_pfnblock_flags(struct page *page, unsigned long
			      set_flags, unsigned long clear_flags);

And better, splitting it up (or providing helpers)

set_pfnblock_flags(struct page *page, unsigned long flags);
clear_pfnblock_flags(struct page *page, unsigned long flags);


This implies some more code cleanups first that make the code easier to 
extend.

> +	return flags;
>   }
>   
>   /**
> @@ -402,8 +423,14 @@ void set_pfnblock_flags_mask(struct page *page, unsigned long flags,
>   	unsigned long bitidx, word_bitidx;
>   	unsigned long word;
>   
> +#ifdef CONFIG_MEMORY_ISOLATION
> +	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 8);
> +	/* extra one for MIGRATE_ISOLATE */
> +	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits) + 1);
> +#else
>   	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
>   	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
> +#endif
>   
>   	bitmap = get_pageblock_bitmap(page, pfn);
>   	bitidx = pfn_to_bitidx(page, pfn);
> @@ -426,6 +453,13 @@ void set_pageblock_migratetype(struct page *page, int migratetype)
>   		     migratetype < MIGRATE_PCPTYPES))
>   		migratetype = MIGRATE_UNMOVABLE;
>   
> +#ifdef CONFIG_MEMORY_ISOLATION
> +	if (migratetype == MIGRATE_ISOLATE) {
> +		set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
> +				page_to_pfn(page), PB_migrate_isolate_bit);
> +		return;
> +	}
> +#endif
>   	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
>   				page_to_pfn(page), MIGRATETYPE_MASK);
>   }
> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
> index b2fc5266e3d2..751e21f6d85e 100644
> --- a/mm/page_isolation.c
> +++ b/mm/page_isolation.c
> @@ -15,6 +15,17 @@
>   #define CREATE_TRACE_POINTS
>   #include <trace/events/page_isolation.h>
>   
> +static inline bool __maybe_unused get_pageblock_isolate(struct page *page)
> +{
> +	return get_pfnblock_flags_mask(page, page_to_pfn(page),
> +			PB_migrate_isolate_bit);
> +}
> +static inline void clear_pageblock_isolate(struct page *page)
> +{
> +	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),
> +			PB_migrate_isolate_bit);
> +}

Should these reside in include/linux/pageblock-flags.h, just like the
CONFIG_COMPACTION "skip" variants?

-- 
Cheers,

David / dhildenb

