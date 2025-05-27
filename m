Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88482142E6F
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748340687; cv=none; b=APiL2cE7F6IJfAqIfp9NX5ReEskcSRrOPX0EvN+q74Mwaq4C0H+otgVQow0NVdfAMsCubI2BR6CU8FpSFEVrYAZ+48lIZUTlPo4V2izLOdbQDu1dMDzd+1qqmcGpcvGbrtH3KVDd1lG7Tgd/G8Kjvwuqtn5kKhwsFG3GqlSPp9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748340687; c=relaxed/simple;
	bh=k+FZEE7Mfl8rrC7O7jdzGK/zyb/fzub2rIUuNj+xXO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sg2yPPtt+FXuLQ7LyZl4wiJVV1dZIwcTLtjKtsWN7IKN5tc2Q8N9UdJ9/sIUNkXcgqLjc/wRUpn1h/kltiFk1dphiP05/wWhkRe3SzFKi52JUkPaSd6bwBEaDGK4Gzu1r02A75frJwXIGtNUuR41FZqYia+veXhINDuisStozGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Ht6XQI46; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=r8/8Vh5j; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=an5kgdfD; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=i/q/aRLq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Ht6XQI46";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="r8/8Vh5j";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="an5kgdfD";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="i/q/aRLq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D3D681F7F9;
	Tue, 27 May 2025 10:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748340678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a7sX30jmloMBIvC0J8YwsF4YYQIR25ZsLjYFvJyiErc=;
	b=Ht6XQI46CcIfBaUrRYRBZc4aM8fX8NNErW3TqZwKjCF/ftfEHDd7uTUY853U2++zQAJ8Vj
	tilt8NKbXFY/wjwU4mZQ3H5mmvTj6FweRT9X6arArRm0OQPubrxZXgqnfMJJhxJb5FniTK
	acO0/GgeJHaz3UulQEJm7gursdfxuGA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748340678;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a7sX30jmloMBIvC0J8YwsF4YYQIR25ZsLjYFvJyiErc=;
	b=r8/8Vh5jEUMMsDIh/yIwImbR6SkjJ+pMEi3YQFfXE78Ie7KLBbfXSmJ6Ats7TKgacdZMrZ
	RxUQpq+PUXLr96CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=an5kgdfD;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="i/q/aRLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748340677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a7sX30jmloMBIvC0J8YwsF4YYQIR25ZsLjYFvJyiErc=;
	b=an5kgdfDsGykUAT8qNKOEzC4ZqyDYVquEJZ1QS4PpglA9b5RhL3zUJ8ksvLxFjXn9Loiqa
	t2E9OcqjrGUaNLcFQY7IPmJKvSQ47IF4RqB7VI+QjO6O2/5TN0qMIX0kHEYk2hBddsJp7G
	POYJ3ZebGh4NBb1dvxQwxXFgClsiyrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748340677;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a7sX30jmloMBIvC0J8YwsF4YYQIR25ZsLjYFvJyiErc=;
	b=i/q/aRLq7aWbzdZKoIykWm8KNjcEgBdhDrmjc2SCxRMvweCJogHgdLYq48v5TG+v6lEp1n
	ZviyXzrwFeOtlrAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A851B136E0;
	Tue, 27 May 2025 10:11:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YI6/KMWPNWhUZwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 27 May 2025 10:11:17 +0000
Message-ID: <3b1524b1-cb3b-4abc-8044-0a9ad30a26cd@suse.cz>
Date: Tue, 27 May 2025 12:11:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] mm/page_isolation: make page isolation a
 standalone bit.
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
 <20250523191258.339826-3-ziy@nvidia.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <20250523191258.339826-3-ziy@nvidia.com>
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
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Queue-Id: D3D681F7F9
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On 5/23/25 21:12, Zi Yan wrote:
> During page isolation, the original migratetype is overwritten, since
> MIGRATE_* are enums and stored in pageblock bitmaps. Change
> MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
> PB_migrate_skip, so that migratetype is not lost during pageblock
> isolation.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>

<snip>

>  #define MEMORY_OFFLINE	0x1
> diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
> index 3acbb271a29a..f2f8540b95ca 100644
> --- a/include/linux/pageblock-flags.h
> +++ b/include/linux/pageblock-flags.h
> @@ -20,7 +20,13 @@ enum pageblock_bits {
>  	PB_migrate_end = PB_migrate + PB_migratetype_bits - 1,
>  			/* 3 bits required for migrate types */
>  	PB_migrate_skip,/* If set the block is skipped by compaction */
> -
> +#ifdef CONFIG_MEMORY_ISOLATION
> +	/*
> +	 * Pageblock isolation is represented with a separate bit, so that
> +	 * the migratetype of a block is not overwritten by isolation.
> +	 */
> +	PB_migrate_isolate, /* If set the block is isolated */
> +#endif
>  	/*
>  	 * Assume the bits will always align on a word. If this assumption
>  	 * changes then get/set pageblock needs updating.
> @@ -32,6 +38,11 @@ enum pageblock_bits {
>  
>  #define MIGRATETYPE_MASK ((1UL << (PB_migrate_end + 1)) - 1)
>  
> +#ifdef CONFIG_MEMORY_ISOLATION
> +#define MIGRATETYPE_AND_ISO_MASK \
> +	(((1UL << (PB_migrate_end + 1)) - 1) | BIT(PB_migrate_isolate))
> +#endif

I think if there was:

#else
#define MIGRATETYPE_AND_ISO_MASK MIGRATETYPE_MASK
#endif

you could avoid some #ifdef code later.

>  #if defined(CONFIG_HUGETLB_PAGE)
>  
>  #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 0207164fcaf6..b2c623699461 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -360,8 +360,14 @@ get_pfnblock_bitmap_bitidx(const struct page *page, unsigned long pfn,
>  	unsigned long *bitmap;
>  	unsigned long word_bitidx;
>  
> +#ifdef CONFIG_MEMORY_ISOLATION
> +	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 8);
> +	/* extra one for MIGRATE_ISOLATE */
> +	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits) + 1);

This implicitly assumes MIGRATE_ISOLATE is the last of migratetypes so we
can actually need less PB_migratetype_bits if we stop encoding it within
them anymore, but there's nothing enforcing that (not even as a comment)?

> +#else
>  	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
>  	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
> +#endif
>  	VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);
>  
>  	bitmap = get_pageblock_bitmap(page, pfn);
> @@ -435,7 +441,20 @@ bool get_pfnblock_bit(const struct page *page, unsigned long pfn,
>  __always_inline enum migratetype
>  get_pfnblock_migratetype(const struct page *page, unsigned long pfn)
>  {
> -	return __get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
> +	unsigned long mask = MIGRATETYPE_MASK;

E.g. with my suggestion above you could use MIGRATETYPE_AND_ISO_MASK here.

> +	unsigned long flags;
> +
> +#ifdef CONFIG_MEMORY_ISOLATION
> +	mask = MIGRATETYPE_AND_ISO_MASK;
> +#endif

And drop this.

> +	flags = __get_pfnblock_flags_mask(page, pfn, mask);
> +
> +#ifdef CONFIG_MEMORY_ISOLATION
> +	if (flags & BIT(PB_migrate_isolate))
> +		return MIGRATE_ISOLATE;
> +#endif
> +	return flags & MIGRATETYPE_MASK;
>  }
>  
>  /**
> @@ -513,12 +532,22 @@ void clear_pfnblock_bit(const struct page *page, unsigned long pfn,
>  __always_inline void set_pageblock_migratetype(struct page *page,
>  					       enum migratetype migratetype)
>  {
> +	unsigned long mask = MIGRATETYPE_MASK;
> +
>  	if (unlikely(page_group_by_mobility_disabled &&
>  		     migratetype < MIGRATE_PCPTYPES))
>  		migratetype = MIGRATE_UNMOVABLE;
>  
> +#ifdef CONFIG_MEMORY_ISOLATION
> +	if (migratetype == MIGRATE_ISOLATE) {
> +		set_pfnblock_bit(page, page_to_pfn(page), PB_migrate_isolate);
> +		return;
> +	}
> +	/* change mask to clear PB_migrate_isolate if it is set */
> +	mask = MIGRATETYPE_AND_ISO_MASK;
> +#endif
>  	__set_pfnblock_flags_mask(page, page_to_pfn(page),
> -				  (unsigned long)migratetype, MIGRATETYPE_MASK);
> +				  (unsigned long)migratetype, mask);

This could just pass MIGRATETYPE_AND_ISO_MASK here.

>  }
>  
>  #ifdef CONFIG_DEBUG_VM

