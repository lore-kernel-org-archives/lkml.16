Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C476928FD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750429973; cv=none; b=gNtgQ14TdPJjqyJi0EEwgjg6TonntJQLlfTE8S+rPz7R00eZkY03zUDxcXti8oQFXUQTpGO4t85qGIWyL8RaGiBR72/3abRu+0tDlc/VGJ0/UbnNhv8OaKJpo16wO0QPS1Jl2q/tZC0tb/OCR2oWSQmBm7xxZH3pagNMJQDdCgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750429973; c=relaxed/simple;
	bh=FAzaJ7tL92WHatbmit6WwqxCVFDSfmtEqWJgTNS8x+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFLSrQVU8wp66Pm+5LbbHZHFIJaqpM/Fty9Hg8wq5c08P3jiwch1hhlk/5fzMex4HkSGZd5yrNzu20H/jMfGMFwIW+04QACcnU7RreiaRvV36XFbd0UGyFBUPreo0medguNl2T7GYz+vT9Z3GootQeAE6u9jOR7Dwy+oeqewD0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ztKpN6GB; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=kj9XM2l2; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=UIEgGh/n; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=aStaRjd/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ztKpN6GB";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="kj9XM2l2";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="UIEgGh/n";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="aStaRjd/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E8FF821194;
	Fri, 20 Jun 2025 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750429970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6E5rNSmzsJbLyKsIseYuITu6Ey5hvk/Ibrtzg16pIB0=;
	b=ztKpN6GB/DbKyv/XNDSbsqJ2SraLdAiabqVDqf0ct0ZEgzeecIx/G7bCsZ03e0/0nfsmym
	p7HOAHO+AVwxjfVu8Dxg7+EgcY1J+AZcr+Zw4mbcXap4bt9F2OcXa9gE6LxrS4aEr8Z+md
	5lgeOZ7vzWT6gRcRaDxjHApgycaJV1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750429970;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6E5rNSmzsJbLyKsIseYuITu6Ey5hvk/Ibrtzg16pIB0=;
	b=kj9XM2l2rqOyxG/al4Q6POfaDA+e52UTSDLbYRNPDWJoQyowB98hYmpMLJJHGZvKUfBT3O
	QY1noWv6+cx9FMDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="UIEgGh/n";
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="aStaRjd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750429968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6E5rNSmzsJbLyKsIseYuITu6Ey5hvk/Ibrtzg16pIB0=;
	b=UIEgGh/nHufbhd1IqkdmVFtlg6KrFh3vMwIhOajWcw0IecGOfsCjnXxgc/22ecI1N3X72k
	MKxEv9NnXHPkygWh67MVASohhWkKa32WqFeD3sELVvhqpu2gnLLJFcYtWdZ/XrQNox5huM
	hqnBfqKma+7UCrcCmPr0+fABQKr6ppY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750429968;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6E5rNSmzsJbLyKsIseYuITu6Ey5hvk/Ibrtzg16pIB0=;
	b=aStaRjd/e6LC5VbVJt1hSnmCaWNQMwvICzggY4XCg+9JXCqiIwDMKvQB+HhlvyEbN9xjAZ
	DJbIlt2vKNBuwcCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA774136BA;
	Fri, 20 Jun 2025 14:32:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7bwSMRBxVWjwTgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 20 Jun 2025 14:32:48 +0000
Message-ID: <117f730b-6107-4093-afd2-51c15e503cda@suse.cz>
Date: Fri, 20 Jun 2025 16:32:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] mm/madvise: thread all madvise state through
 madv_behavior
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Jann Horn <jannh@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
 SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
 <ce41fab11efac21ba28b89328276076b9e389093.1750363557.git.lorenzo.stoakes@oracle.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSBWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBzdXNlLmN6PsLBlAQTAQoAPgIbAwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBKlA1DSZLC6OmRA9UCJPp+fMgqZkBQJnyBr8BQka0IFQAAoJECJPp+fMgqZkqmMQ
 AIbGN95ptUMUvo6aAdhxaOCHXp1DfIBuIOK/zpx8ylY4pOwu3GRe4dQ8u4XS9gaZ96Gj4bC+
 jwWcSmn+TjtKW3rH1dRKopvC07tSJIGGVyw7ieV/5cbFffA8NL0ILowzVg8w1ipnz1VTkWDr
 2zcfslxJsJ6vhXw5/npcY0ldeC1E8f6UUoa4eyoskd70vO0wOAoGd02ZkJoox3F5ODM0kjHu
 Y97VLOa3GG66lh+ZEelVZEujHfKceCw9G3PMvEzyLFbXvSOigZQMdKzQ8D/OChwqig8wFBmV
 QCPS4yDdmZP3oeDHRjJ9jvMUKoYODiNKsl2F+xXwyRM2qoKRqFlhCn4usVd1+wmv9iLV8nPs
 2Db1ZIa49fJet3Sk3PN4bV1rAPuWvtbuTBN39Q/6MgkLTYHb84HyFKw14Rqe5YorrBLbF3rl
 M51Dpf6Egu1yTJDHCTEwePWug4XI11FT8lK0LNnHNpbhTCYRjX73iWOnFraJNcURld1jL1nV
 r/LRD+/e2gNtSTPK0Qkon6HcOBZnxRoqtazTU6YQRmGlT0v+rukj/cn5sToYibWLn+RoV1CE
 Qj6tApOiHBkpEsCzHGu+iDQ1WT0Idtdynst738f/uCeCMkdRu4WMZjteQaqvARFwCy3P/jpK
 uvzMtves5HvZw33ZwOtMCgbpce00DaET4y/UzsBNBFsZNTUBCACfQfpSsWJZyi+SHoRdVyX5
 J6rI7okc4+b571a7RXD5UhS9dlVRVVAtrU9ANSLqPTQKGVxHrqD39XSw8hxK61pw8p90pg4G
 /N3iuWEvyt+t0SxDDkClnGsDyRhlUyEWYFEoBrrCizbmahOUwqkJbNMfzj5Y7n7OIJOxNRkB
 IBOjPdF26dMP69BwePQao1M8Acrrex9sAHYjQGyVmReRjVEtv9iG4DoTsnIR3amKVk6si4Ea
 X/mrapJqSCcBUVYUFH8M7bsm4CSxier5ofy8jTEa/CfvkqpKThTMCQPNZKY7hke5qEq1CBk2
 wxhX48ZrJEFf1v3NuV3OimgsF2odzieNABEBAAHCwXwEGAEKACYCGwwWIQSpQNQ0mSwujpkQ
 PVAiT6fnzIKmZAUCZ8gcVAUJFhTonwAKCRAiT6fnzIKmZLY8D/9uo3Ut9yi2YCuASWxr7QQZ
 lJCViArjymbxYB5NdOeC50/0gnhK4pgdHlE2MdwF6o34x7TPFGpjNFvycZqccSQPJ/gibwNA
 zx3q9vJT4Vw+YbiyS53iSBLXMweeVV1Jd9IjAoL+EqB0cbxoFXvnjkvP1foiiF5r73jCd4PR
 rD+GoX5BZ7AZmFYmuJYBm28STM2NA6LhT0X+2su16f/HtummENKcMwom0hNu3MBNPUOrujtW
 khQrWcJNAAsy4yMoJ2Lw51T/5X5Hc7jQ9da9fyqu+phqlVtn70qpPvgWy4HRhr25fCAEXZDp
 xG4RNmTm+pqorHOqhBkI7wA7P/nyPo7ZEc3L+ZkQ37u0nlOyrjbNUniPGxPxv1imVq8IyycG
 AN5FaFxtiELK22gvudghLJaDiRBhn8/AhXc642/Z/yIpizE2xG4KU4AXzb6C+o7LX/WmmsWP
 Ly6jamSg6tvrdo4/e87lUedEqCtrp2o1xpn5zongf6cQkaLZKQcBQnPmgHO5OG8+50u88D9I
 rywqgzTUhHFKKF6/9L/lYtrNcHU8Z6Y4Ju/MLUiNYkmtrGIMnkjKCiRqlRrZE/v5YFHbayRD
 dJKXobXTtCBYpLJM4ZYRpGZXne/FAtWNe4KbNJJqxMvrTOrnIatPj8NhBVI0RSJRsbilh6TE
 m6M14QORSWTLRg==
In-Reply-To: <ce41fab11efac21ba28b89328276076b9e389093.1750363557.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E8FF821194
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,nvidia.com,linux.alibaba.com,oracle.com,arm.com,kernel.org,google.com,kvack.org,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:dkim,suse.cz:email]
X-Spam-Score: -4.51
X-Spam-Level: 

On 6/19/25 22:26, Lorenzo Stoakes wrote:
> Doing so means we can get rid of all the weird struct vm_area_struct **prev
> stuff, everything becomes consistent and in future if we want to make
> change to behaviour there's a single place where all relevant state is
> stored.
> 
> This also allows us to update try_vma_read_lock() to be a little more
> succinct and set up state for us, as well as cleaning up
> madvise_update_vma().
> 
> We also update the debug assertion prior to madvise_update_vma() to assert
> that this is a write operation as correctly pointed out by Barry in the
> relevant thread.
> 
> We can't reasonably update the madvise functions that live outside of
> mm/madvise.c so we leave those as-is.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

The prev manipulation is indeed confusing, looking forward to the next patch...

Nits:

> ---
>  mm/madvise.c | 283 ++++++++++++++++++++++++++-------------------------
>  1 file changed, 146 insertions(+), 137 deletions(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 6faa38b92111..86fe04aa7c88 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -74,6 +74,8 @@ struct madvise_behavior {
>  	 * traversing multiple VMAs, this is updated for each.
>  	 */
>  	struct madvise_behavior_range range;
> +	/* The VMA and VMA preceding it (if applicable) currently targeted. */
> +	struct vm_area_struct *prev, *vma;

Would also do separate lines here.

> -static long madvise_dontneed_free(struct vm_area_struct *vma,
> -				  struct vm_area_struct **prev,
> -				  unsigned long start, unsigned long end,
> -				  struct madvise_behavior *madv_behavior)
> +static long madvise_dontneed_free(struct madvise_behavior *madv_behavior)
>  {
> +	struct mm_struct *mm = madv_behavior->mm;
> +	struct madvise_behavior_range *range = &madv_behavior->range;
>  	int behavior = madv_behavior->behavior;
> -	struct mm_struct *mm = vma->vm_mm;
>  
> -	*prev = vma;
> -	if (!madvise_dontneed_free_valid_vma(vma, start, &end, behavior))
> +	madv_behavior->prev = madv_behavior->vma;
> +	if (!madvise_dontneed_free_valid_vma(madv_behavior))
>  		return -EINVAL;
>  
> -	if (start == end)
> +	if (range->start == range->end)
>  		return 0;
>  
> -	if (!userfaultfd_remove(vma, start, end)) {
> -		*prev = NULL; /* mmap_lock has been dropped, prev is stale */
> +	if (!userfaultfd_remove(madv_behavior->vma, range->start, range->end)) {
> +		struct vm_area_struct *vma;
> +
> +		madv_behavior->prev = NULL; /* mmap_lock has been dropped, prev is stale */
>  
>  		mmap_read_lock(mm);
> -		vma = vma_lookup(mm, start);
> +		madv_behavior->vma = vma = vma_lookup(mm, range->start);

This replaces vma in madv_behavior...

> @@ -1617,23 +1625,19 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
>  	struct mm_struct *mm = madv_behavior->mm;
>  	struct madvise_behavior_range *range = &madv_behavior->range;
>  	unsigned long end = range->end;
> -	struct vm_area_struct *vma;
> -	struct vm_area_struct *prev;
>  	int unmapped_error = 0;
>  	int error;
> +	struct vm_area_struct *vma;
>  
>  	/*
>  	 * If VMA read lock is supported, apply madvise to a single VMA
>  	 * tentatively, avoiding walking VMAs.
>  	 */
> -	if (madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
> -		vma = try_vma_read_lock(madv_behavior);
> -		if (vma) {
> -			prev = vma;
> -			error = madvise_vma_behavior(vma, &prev, madv_behavior);
> -			vma_end_read(vma);
> -			return error;
> -		}
> +	if (madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK &&
> +	    try_vma_read_lock(madv_behavior)) {
> +		error = madvise_vma_behavior(madv_behavior);
> +		vma_end_read(madv_behavior->vma);
> +		return error;

And here we could potentially do vma_end_read() on the replaced vma. And
it's exactly cases using madvise_dontneed_free() that use
MADVISE_VMA_READ_LOCK mode. But it's not an issue as try_vma_read_lock()
will fail with uffd and that vma replacement scenario is tied to
userfaultfd_remove(). It's just quite tricky, hm...

>  	}
>  
>  	/*
> @@ -1641,11 +1645,13 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
>  	 * ranges, just ignore them, but return -ENOMEM at the end.
>  	 * - different from the way of handling in mlock etc.
>  	 */
> -	vma = find_vma_prev(mm, range->start, &prev);
> +	vma = find_vma_prev(mm, range->start, &madv_behavior->prev);
>  	if (vma && range->start > vma->vm_start)
> -		prev = vma;
> +		madv_behavior->prev = vma;
>  
>  	for (;;) {
> +		struct vm_area_struct *prev;
> +
>  		/* Still start < end. */
>  		if (!vma)
>  			return -ENOMEM;
> @@ -1662,13 +1668,16 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
>  		range->end = min(vma->vm_end, end);
>  
>  		/* Here vma->vm_start <= range->start < range->end <= (end|vma->vm_end). */
> -		error = madvise_vma_behavior(vma, &prev, madv_behavior);
> +		madv_behavior->vma = vma;
> +		error = madvise_vma_behavior(madv_behavior);
>  		if (error)
>  			return error;
> +		prev = madv_behavior->prev;
> +
>  		range->start = range->end;
>  		if (prev && range->start < prev->vm_end)
>  			range->start = prev->vm_end;
> -		if (range->start >= range->end)
> +		if (range->start >= end)
>  			break;
>  		if (prev)
>  			vma = find_vma(mm, prev->vm_end);

