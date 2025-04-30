Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15812147E8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000569; cv=none; b=A66/AXMQqnMmFdARcVmo4b2rmjLfhtjIG0Nt9QnWrsSSqZpBWC6i8b0ep6TUsBnOrK3xs+K9mhzDBFkkxLfmaEw4JCgDYZB50khYxDWTGc7C59u7z2NLMZ7kVOaJNN0o0qEy76eu/5p274LLS1GrbAdqjoyQvymrLldQ4/OVD8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000569; c=relaxed/simple;
	bh=GVQymgRmUTrvi8Po/t8bqQSfzjEN8L1+HWOewe9slQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ByuIURy4Gm25rQ1dj7l5WxtzsdlezAIoYYzNGEX0t4Co1MiNx0PS9BBNejQbp7GUC+/OPCYSV+EnZzUK/DAWpbeI7uu9QNkojU0IirJkEh5y/B19VVu0eAqA00Bc70Uaw78XDxInQf+IEFjK4pJRcWdc775p08+V8ytCNQKIbaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iFmTFgtn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0LzDwju8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iFmTFgtn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0LzDwju8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iFmTFgtn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0LzDwju8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iFmTFgtn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0LzDwju8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B08F41F7C3;
	Wed, 30 Apr 2025 08:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746000564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8RixjhbWpiWlGSXrYW9u22vJ3QHZVt13xlcgzXElNmU=;
	b=iFmTFgtn8TQDhYi2ombB5TLGeuk0+IbFqcjuNjSuYrJAK1Zbv6eoiPqQFC4LwJlDE9UwLf
	noqXZyuNjceaM/3TO/lufDeU5I6lNO9Bdmy8AUPh2TLNb0ub1CxTnZMg+cPrpODDqA79BV
	HZIaHOXZkOCGh8VVsQm/fA0dAUKGcqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746000564;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8RixjhbWpiWlGSXrYW9u22vJ3QHZVt13xlcgzXElNmU=;
	b=0LzDwju8CNPrOvKKHy7ATNNorRyXLe2bNYKwUyHKwvGBu71tNM2UYuOM91eBpJwzIlEJgu
	TrCfWl4Ms+SVFhAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746000564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8RixjhbWpiWlGSXrYW9u22vJ3QHZVt13xlcgzXElNmU=;
	b=iFmTFgtn8TQDhYi2ombB5TLGeuk0+IbFqcjuNjSuYrJAK1Zbv6eoiPqQFC4LwJlDE9UwLf
	noqXZyuNjceaM/3TO/lufDeU5I6lNO9Bdmy8AUPh2TLNb0ub1CxTnZMg+cPrpODDqA79BV
	HZIaHOXZkOCGh8VVsQm/fA0dAUKGcqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746000564;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8RixjhbWpiWlGSXrYW9u22vJ3QHZVt13xlcgzXElNmU=;
	b=0LzDwju8CNPrOvKKHy7ATNNorRyXLe2bNYKwUyHKwvGBu71tNM2UYuOM91eBpJwzIlEJgu
	TrCfWl4Ms+SVFhAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DE3C139E7;
	Wed, 30 Apr 2025 08:09:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TByrA7TaEWiICgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 30 Apr 2025 08:09:24 +0000
Date: Wed, 30 Apr 2025 10:09:22 +0200
From: Oscar Salvador <osalvador@suse.de>
To: nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, willy@infradead.org, mcgrof@kernel.org,
	a.manzanares@samsung.com, dave@stgolabs.net,
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Fan Ni <fan.ni@samsung.com>
Subject: Re: [PATCH v3 4/4] mm/hugetlb: Convert use of struct page to folio
 in __unmap_hugepage_range()
Message-ID: <aBHasvr4d3liqX6e@localhost.localdomain>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
 <20250428171608.21111-7-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428171608.21111-7-nifan.cxl@gmail.com>
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,localhost.localdomain:mid,samsung.com:email,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, Apr 28, 2025 at 10:11:47AM -0700, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> In __unmap_hugepage_range(), the "page" pointer always points to the
> first page of a huge page, which guarantees there is a folio associating
> with it.  Convert the "page" pointer to use folio.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> ---
>  mm/hugetlb.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 6696206d556e..293c2afa724b 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5815,12 +5815,12 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  	pte_t *ptep;
>  	pte_t pte;
>  	spinlock_t *ptl;
> -	struct page *page;
>  	struct hstate *h = hstate_vma(vma);
>  	unsigned long sz = huge_page_size(h);
>  	bool adjust_reservation = false;
>  	unsigned long last_addr_mask;
>  	bool force_flush = false;
> +	const bool folio_provided = !!folio;

This might be me just nitpicking but:

Why not rename folio to ref_folio o provided_folio and do

        struct folio *folio = ref_folio;

I think it is more natural than the boolean.

Also you need to update the comment that references the 'reference page' and the one
David mentioned.

Anyway,

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
