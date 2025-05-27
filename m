Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78576258CF0
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748343048; cv=none; b=IGai6DeLBtyddGb5q+SbxEh+uRiggf2H/X5qGW3VHBL3eEnYJ8wCaTlqjL0JhxnHmrBysAstLQdaV8iuFTPgvdyh5Ecso94ElJMwjLi7nEH0DoEKxLSn0vZKb1lzXVMct1apZWzebEu+nBPnmLDKPT09o4Ch/vJ6JFQfGGRDVsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748343048; c=relaxed/simple;
	bh=d1V5VE+7lblPNrwyv+JQeBjQFfrPKexuDjcfwIlJzg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pl7XpP9tA+8NubW0wPM8ZmHwkdfQ0nLkuOeu8m0z/ZY+LvN5REIFL/DoSOCRISL8ZyE8L2Msv64e4wMelx94fpCVbtxQnULLOXyF1Yk2By52EC6lmrDYUFv1a0LJD2LMnhp7AeQT6CEHOAcMNM5o0Pzht+PoM6KeDKCfqOYNw2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=jKwWzyeJ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Ka2eQhtr; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=jKwWzyeJ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Ka2eQhtr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="jKwWzyeJ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Ka2eQhtr";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="jKwWzyeJ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Ka2eQhtr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4C1AF1F835;
	Tue, 27 May 2025 10:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748343044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I9IZ37vg8F7szD5jviqCeB7vCvd4JhZgpZx7xqXvLok=;
	b=jKwWzyeJZhqP2sE4QfG75UtvCle4xNsgRMeNwK/37UvoyssFPYjy8bsBie5/roqFWp1Px6
	JGUYimEaiTXnZ7Y2gm+9hnOsMgOLfnFfhmgrmOcLw/SaOIEo6pSubC7KbgdOzSoFaFC4sx
	Gv4p7BJ28tQJh87AjHnm8TQjwoEAxfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748343044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I9IZ37vg8F7szD5jviqCeB7vCvd4JhZgpZx7xqXvLok=;
	b=Ka2eQhtrYQf81bt6/xyZoAHLeWZNsy+9XRacbaIZ6Bzuv1miAPfLuZjc98usFYBCe0rNUH
	Opsn1iRAZiLXYHCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=jKwWzyeJ;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=Ka2eQhtr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748343044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I9IZ37vg8F7szD5jviqCeB7vCvd4JhZgpZx7xqXvLok=;
	b=jKwWzyeJZhqP2sE4QfG75UtvCle4xNsgRMeNwK/37UvoyssFPYjy8bsBie5/roqFWp1Px6
	JGUYimEaiTXnZ7Y2gm+9hnOsMgOLfnFfhmgrmOcLw/SaOIEo6pSubC7KbgdOzSoFaFC4sx
	Gv4p7BJ28tQJh87AjHnm8TQjwoEAxfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748343044;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I9IZ37vg8F7szD5jviqCeB7vCvd4JhZgpZx7xqXvLok=;
	b=Ka2eQhtrYQf81bt6/xyZoAHLeWZNsy+9XRacbaIZ6Bzuv1miAPfLuZjc98usFYBCe0rNUH
	Opsn1iRAZiLXYHCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 24DA81388B;
	Tue, 27 May 2025 10:50:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8BiKBwSZNWhQdAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 27 May 2025 10:50:44 +0000
Message-ID: <2d8017fb-474f-493c-84ad-df172987e65e@suse.cz>
Date: Tue, 27 May 2025 12:50:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] mm/page_isolation: remove migratetype from
 move_freepages_block_isolate()
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang
 <richardycc@google.com>, linux-kernel@vger.kernel.org
References: <20250523191258.339826-1-ziy@nvidia.com>
 <20250523191258.339826-5-ziy@nvidia.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <20250523191258.339826-5-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Queue-Id: 4C1AF1F835
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On 5/23/25 21:12, Zi Yan wrote:
> Since migratetype is no longer overwritten during pageblock isolation,
> moving a pageblock out of MIGRATE_ISOLATE no longer needs a new
> migratetype.
> 
> Add pageblock_isolate_and_move_free_pages() and
> pageblock_unisolate_and_move_free_pages() to be explicit about the page
> isolation operations. Both share the common code in
> __move_freepages_block_isolate(), which is renamed from
> move_freepages_block_isolate().
> 
> Add toggle_pageblock_isolate() to flip pageblock isolation bit in
> __move_freepages_block_isolate().
> 
> Make set_pageblock_migratetype() only accept non MIGRATE_ISOLATE types,
> so that one should use set_pageblock_isolate() to isolate pageblocks.
> As a result, move pageblock migratetype code out of
> __move_freepages_block().
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  include/linux/page-isolation.h |  5 +-
>  mm/page_alloc.c                | 97 ++++++++++++++++++++++++++++------
>  mm/page_isolation.c            | 21 ++++----
>  3 files changed, 92 insertions(+), 31 deletions(-)
> 
> diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
> index 14c6a5f691c2..7241a6719618 100644
> --- a/include/linux/page-isolation.h
> +++ b/include/linux/page-isolation.h
> @@ -44,10 +44,9 @@ static inline void set_pageblock_isolate(struct page *page)
>  void __meminit init_pageblock_migratetype(struct page *page,
>  					  enum migratetype migratetype,
>  					  bool isolate);
> -void set_pageblock_migratetype(struct page *page, enum migratetype migratetype);
>  
> -bool move_freepages_block_isolate(struct zone *zone, struct page *page,
> -				  int migratetype);
> +bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page);
> +bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
>  
>  int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>  			     int migratetype, int flags);
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 8fcbd7fa13c2..44a08b1a9de4 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -524,13 +524,36 @@ void clear_pfnblock_bit(const struct page *page, unsigned long pfn,
>  	__clear_bit(bitidx + pb_bit, bitmap_word);
>  }
>  
> +#ifdef CONFIG_MEMORY_ISOLATION
> +/**
> + * toggle_pfnblock_bit - Toggle a standalone bit of a pageblock
> + * @page: The page within the block of interest
> + * @pfn: The target page frame number
> + * @pb_bit: pageblock bit to toggle
> + */
> +static void toggle_pfnblock_bit(const struct page *page, unsigned long pfn,
> +		      enum pageblock_bits pb_bit)
> +{
> +	unsigned long *bitmap_word;
> +	unsigned long bitidx;
> +
> +	if (WARN_ON_ONCE(pb_bit <= PB_migrate_end ||
> +			 pb_bit >= __NR_PAGEBLOCK_BITS))
> +		return;
> +
> +	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
> +
> +	__change_bit(bitidx + pb_bit, bitmap_word);

Again the non-atomic variant, but actually below I suggest we drop this.

> +}
> +#endif
> +
>  /**
>   * set_pageblock_migratetype - Set the migratetype of a pageblock
>   * @page: The page within the block of interest
>   * @migratetype: migratetype to set
>   */
> -__always_inline void set_pageblock_migratetype(struct page *page,
> -					       enum migratetype migratetype)
> +static void set_pageblock_migratetype(struct page *page,
> +				      enum migratetype migratetype)
>  {
>  	unsigned long mask = MIGRATETYPE_MASK;
>  
> @@ -540,11 +563,15 @@ __always_inline void set_pageblock_migratetype(struct page *page,
>  
>  #ifdef CONFIG_MEMORY_ISOLATION
>  	if (migratetype == MIGRATE_ISOLATE) {
> -		set_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
> +		VM_WARN_ONCE(1,
> +			"Use set_pageblock_isolate() for pageblock isolation");
>  		return;
>  	}
>  	/* change mask to clear PB_migrate_isolate if it is set */
>  	mask = MIGRATETYPE_AND_ISO_MASK;
> +	VM_WARN_ONCE(get_pfnblock_bit(page, page_to_pfn(page),
> +				      PB_migrate_isolate),
> +		     "Use clear_pageblock_isolate() to unisolate pageblock");
>  #endif

We might be too paranoid with the warnings given these are all local
functions to this file so risk of misuse should be low. Maybe we could
remove later...

>  	__set_pfnblock_flags_mask(page, page_to_pfn(page),
>  				  (unsigned long)migratetype, mask);
> @@ -1931,8 +1958,8 @@ static inline struct page *__rmqueue_cma_fallback(struct zone *zone,
>  #endif
>  
>  /*
> - * Change the type of a block and move all its free pages to that
> - * type's freelist.
> + * Move all free pages of a block to new type's freelist. Caller needs to
> + * change the block type.
>   */
>  static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
>  				  int old_mt, int new_mt)
> @@ -1964,8 +1991,6 @@ static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
>  		pages_moved += 1 << order;
>  	}
>  
> -	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
> -
>  	return pages_moved;
>  }
>  
> @@ -2023,11 +2048,16 @@ static int move_freepages_block(struct zone *zone, struct page *page,
>  				int old_mt, int new_mt)
>  {
>  	unsigned long start_pfn;
> +	int res;
>  
>  	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL))
>  		return -1;
>  
> -	return __move_freepages_block(zone, start_pfn, old_mt, new_mt);
> +	res = __move_freepages_block(zone, start_pfn, old_mt, new_mt);
> +	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
> +
> +	return res;
> +
>  }
>  
>  #ifdef CONFIG_MEMORY_ISOLATION
> @@ -2055,11 +2085,16 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
>  	return start_pfn;
>  }
>  
> +static inline void toggle_pageblock_isolate(struct page *page)
> +{
> +	toggle_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
> +}

I'm wary about the togle action, as we should always know what action we
want to do anyway. So we could just add a "bool isolate" parameter and call
set or clear explicitly? Allows for some hypothetical DEBUG_VM checks too
(pageblock is not already in the state we want it to be).


