Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C665D53C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748350559; cv=none; b=kCTVcidMz88irZJ6r26N5q1I2uBhO2t3Ph90cRh6IElx9ccA5gD4vfyBEDb3YWpW8WphM0BSZEecrFJsAvr4VsDw8hCM2YAE1q9wYx1DKk+SkDKS9aV1nCOvknVzqNKXfwORF0tprg3j4yi+FOIf8rOXR0DeiK1c8aJDZgw5nwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748350559; c=relaxed/simple;
	bh=z/BxogwUJweno78iA9dOVw7rYIeX7jb2L8lkxSgC4TM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODFa8vy5sVZQJpE1dcbgTBi33AP/uFKsplPPveKmnRGLceD96PzL1M2UwDSzttSNtCfCwS8rakhrbbbKbE0a9nqlhDncHDKTC8kgVLSxy+EsrdHsCeqtaabG3Y0zVWtNGAjX5ENXhUZVaPXuPEZ1HbsmeQ/LDz4Ws6WBis6MF74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=LsqWz541; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=0H7Cst22; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=KCXijzag; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=MUs1/Odm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="LsqWz541";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="0H7Cst22";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="KCXijzag";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="MUs1/Odm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F03CA1F399;
	Tue, 27 May 2025 12:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748350555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qPffhjfGXn+kzPFYxshP8waQY7blBmuKUOcd1gLhug0=;
	b=LsqWz541w86vvlHLKJNGQr9u8+e36GrRBuimwWQvRQsHNbnNA0HWe19g08+B1rSYmfmwMx
	ELRxc52OP+7yJTjOlKqhe1cR7rYfxzvvGw8M00NEPtfgyyXchswSXs+64eUq53FIhsq36n
	jAOB72rBLKdoDCO0uK3YDs1oifdAgdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748350555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qPffhjfGXn+kzPFYxshP8waQY7blBmuKUOcd1gLhug0=;
	b=0H7Cst22R499YNPo+oCdzDvry0Pbg+ts2Y89NMVv5Owp/33c0jLd3lJP4XQbJ0/mhpkiXJ
	vNUlnkRk/+Xw1PDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=KCXijzag;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="MUs1/Odm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1748350554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qPffhjfGXn+kzPFYxshP8waQY7blBmuKUOcd1gLhug0=;
	b=KCXijzagy9t6rMCZtJFV06XfViJDaQhy/mHVLn+bAWqy30mMKRLTs4aSAUPN7Wirth8JJG
	hw98rhPYZVvZBzlaT/KCPwknLojdzCYFvxTVIgpITjwuHy6Y++D0FXHxLw4YsYldsH49I0
	v/8+yHotVeYHTB3i63k39jDsuLivmb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1748350554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qPffhjfGXn+kzPFYxshP8waQY7blBmuKUOcd1gLhug0=;
	b=MUs1/Odmb29BNBttA3jJf2CTi0bdyB9bDSBOSJNJc78u8MTV/pB5TyC46SN3Z6xQU6/twf
	tK7/AW+oLfJw64Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA9C71388B;
	Tue, 27 May 2025 12:55:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tT+7L1q2NWj4IAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 27 May 2025 12:55:54 +0000
Message-ID: <e8a6247b-c3cc-4f40-b41c-1a38e90ccaf0@suse.cz>
Date: Tue, 27 May 2025 14:55:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] mm/page_isolation: remove migratetype parameter
 from more functions.
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
 <20250523191258.339826-7-ziy@nvidia.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <20250523191258.339826-7-ziy@nvidia.com>
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Queue-Id: F03CA1F399
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On 5/23/25 21:12, Zi Yan wrote:
> migratetype is no longer overwritten during pageblock isolation,
> start_isolate_page_range(), has_unmovable_pages(), and
> set_migratetype_isolate() no longer need which migratetype to restore
> during isolation failure.
> 
> For has_unmoable_pages(), it needs to know if the isolation is for CMA
> allocation, so adding CMA_ALLOCATION to provide the information. At the
> same time change isolation flags to enum pb_isolate_mode (MEMORY_OFFLINE,
> CMA_ALLOCATION, and ISOLATE_MODE_OTHERS). Remove REPORT_FAILURE and check
> MEMORY_OFFLINE instead, since only MEMORY_OFFLINE reports isolation
> failures.
> 
> alloc_contig_range() no longer needs migratetype. Replace it with
> a newly defined acr_flags_t to tell if an allocation is for CMA. So does
> __alloc_contig_migrate_range().
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  drivers/virtio/virtio_mem.c    |  3 +-
>  include/linux/gfp.h            |  6 ++-
>  include/linux/page-isolation.h | 19 ++++++++--
>  include/trace/events/kmem.h    | 14 ++++---
>  mm/cma.c                       |  2 +-
>  mm/memory_hotplug.c            |  4 +-
>  mm/page_alloc.c                | 25 ++++++-------
>  mm/page_isolation.c            | 67 +++++++++++++++-------------------
>  8 files changed, 72 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
> index 56d0dbe62163..8accc0f255a8 100644
> --- a/drivers/virtio/virtio_mem.c
> +++ b/drivers/virtio/virtio_mem.c
> @@ -1243,8 +1243,7 @@ static int virtio_mem_fake_offline(struct virtio_mem *vm, unsigned long pfn,
>  		if (atomic_read(&vm->config_changed))
>  			return -EAGAIN;
>  
> -		rc = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
> -					GFP_KERNEL);
> +		rc = alloc_contig_range(pfn, pfn + nr_pages, 0, GFP_KERNEL);
>  		if (rc == -ENOMEM)
>  			/* whoops, out of memory */
>  			return rc;
> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> index be160e8d8bcb..dea27ed24f8e 100644
> --- a/include/linux/gfp.h
> +++ b/include/linux/gfp.h
> @@ -423,9 +423,13 @@ static inline bool gfp_compaction_allowed(gfp_t gfp_mask)
>  extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
>  
>  #ifdef CONFIG_CONTIG_ALLOC
> +
> +typedef unsigned int __bitwise acr_flags_t;
> +#define ACR_CMA		((__force acr_flags_t)BIT(0))	// allocate for CMA

Would it make sense to define ACR_NONE as 0 so it's more descriptive than
seeing 0 somewhere?

> +
>  /* The below functions must be run on a range from a single zone. */
>  extern int alloc_contig_range_noprof(unsigned long start, unsigned long end,
> -			      unsigned migratetype, gfp_t gfp_mask);
> +			      acr_flags_t alloc_flags, gfp_t gfp_mask);
>  #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_noprof(__VA_ARGS__))
>  
>  extern struct page *alloc_contig_pages_noprof(unsigned long nr_pages, gfp_t gfp_mask,
> diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
> index 7a681a49e73c..b61bca909ddc 100644
> --- a/include/linux/page-isolation.h
> +++ b/include/linux/page-isolation.h
> @@ -38,8 +38,19 @@ static inline void set_pageblock_isolate(struct page *page)
>  }
>  #endif
>  
> -#define MEMORY_OFFLINE	0x1
> -#define REPORT_FAILURE	0x2
> +/*
> + * Pageblock isolation modes:
> + * MEMORY_OFFLINE      - isolate to offline (!allocate) memory e.g., skip over
> + *		         PageHWPoison() pages and PageOffline() pages.
> + *		         Unmovable pages will be reported in this mode.
> + * CMA_ALLOCATION      - isolate for CMA allocations
> + * ISOLATE_MODE_OTHERS - isolate for other purposes
> + */
> +enum pb_isolate_mode {
> +	MEMORY_OFFLINE,
> +	CMA_ALLOCATION,
> +	ISOLATE_MODE_OTHERS,

Since this is in a .h file, I'd prefer more consistent naming, and longer
names shouldn't hurt as there are not that many users.

Even something like:
PB_ISOLATE_MODE_OFFLINE
PB_ISOLATE_MODE_CMA
PB_ISOLATE_MODE_OTHER

?

