Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CC217B50F
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450779; cv=none; b=UhwWktvmWOXRTFeAuSJmOl82VkAQq/O5mW6SgBmz6a8Pb+PVC1mr+y7nQXaIrCw6sZJ6QDTCteT1p3UPrqO7XPmCwP4tjOcpW8iAlvSpKTAY+80pJTPwtK3zvTVQM3gJzRou9z/ebVc09kkr8ZHpNlUgpHtFdiGeTsF7XjxV7tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450779; c=relaxed/simple;
	bh=+3SZVu3mOE6JWF/lVbjUNNPQXe2+gGC9qYUKy8nTzeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgbb92ecUSywIDfwV/mr3d2wUI+EGPTgEZ0wCJQgZrERJ/SqRyVD5FLDQyqU56xDhRcubaxsmGQWik00vQ+uc8gbgsoxcl6mxTIEC+9FAceLGChyabfDcOed40wYsMu497n1LNnulNrac2fBEeVnOdIltKbQe5QXAXj2q4Nx/KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=PsD8s2OA; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=M/XQayTp; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=PsD8s2OA; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=M/XQayTp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="PsD8s2OA";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="M/XQayTp";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="PsD8s2OA";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="M/XQayTp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B90231F794;
	Mon,  5 May 2025 13:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746450775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vAzJhDQ3oZg78MFDLniHbP1StB2cbsxdD5OCjTZpEKk=;
	b=PsD8s2OAk8HAgWOBE//B317AlN87M8IHR+cuwgkJzAfIwxbSt02R45V/a3kxFue5nwJmVD
	8XHzBjey8HaPW1Yq5nvRl2XrVC5qBeJ/5J+0VxiphLzo79OTN5QLKDXpu/L2sme+hHUFLj
	pZbGOWb+9mPlhwPeFxGPIQQKGdGBJ68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746450775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vAzJhDQ3oZg78MFDLniHbP1StB2cbsxdD5OCjTZpEKk=;
	b=M/XQayTp70ZfCozRwUMXL29V1Kt6hPCENGQCfFLAqMhlTMlk1VcxXnm1JWX/hHjQTb1+J9
	yc6ZCEO38tVMZBAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746450775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vAzJhDQ3oZg78MFDLniHbP1StB2cbsxdD5OCjTZpEKk=;
	b=PsD8s2OAk8HAgWOBE//B317AlN87M8IHR+cuwgkJzAfIwxbSt02R45V/a3kxFue5nwJmVD
	8XHzBjey8HaPW1Yq5nvRl2XrVC5qBeJ/5J+0VxiphLzo79OTN5QLKDXpu/L2sme+hHUFLj
	pZbGOWb+9mPlhwPeFxGPIQQKGdGBJ68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746450775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vAzJhDQ3oZg78MFDLniHbP1StB2cbsxdD5OCjTZpEKk=;
	b=M/XQayTp70ZfCozRwUMXL29V1Kt6hPCENGQCfFLAqMhlTMlk1VcxXnm1JWX/hHjQTb1+J9
	yc6ZCEO38tVMZBAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A00E1372E;
	Mon,  5 May 2025 13:12:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sSUxJVe5GGhwLwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 05 May 2025 13:12:55 +0000
Message-ID: <8edbd2be-d495-4bfc-a9f3-6eaae7a66d91@suse.cz>
Date: Mon, 5 May 2025 15:12:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/codetag: sub in advance when free non-compound high
 order pages
Content-Language: en-US
To: David Wang <00107082@163.com>, akpm@linux-foundation.org,
 surenb@google.com, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org,
 ziy@nvidia.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Shakeel Butt <shakeel.butt@linux.dev>
References: <20250504061923.66914-1-00107082@163.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250504061923.66914-1-00107082@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[163.com,linux-foundation.org,google.com,suse.com,cmpxchg.org,nvidia.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On 5/4/25 08:19, David Wang wrote:
> When page is non-compound, page[0] could be released by other
> thread right after put_page_testzero failed in current thread,
> pgalloc_tag_sub_pages afterwards would manipulate an invalid
> page for accounting remaining pages:
> 
> [timeline]   [thread1]                     [thread2]
>   |          alloc_page non-compound
>   V
>   |                                        get_page, rf counter inc
>   V
>   |          in ___free_pages
>   |          put_page_testzero fails
>   V
>   |                                        put_page, page released
>   V
>   |          in ___free_pages,
>   |          pgalloc_tag_sub_pages
>   |          manipulate an invalid page
>   V
>   V
> 
> Move the tag page accounting ahead, and only account remaining pages
> for non-compound pages with non-zero order.
> 
> Signed-off-by: David Wang <00107082@163.com>

Hmm, I think the problem was introduced by 51ff4d7486f0 ("mm: avoid extra
mem_alloc_profiling_enabled() checks"). Previously we'd get the tag pointer
upfront and avoid the page use-after-free.

It would likely be nicer to fix it by going back to that approach for
___free_pages(), while hopefully keeping the optimisations of 51ff4d7486f0
for the other call sites where it applies?

> ---
>  mm/page_alloc.c | 36 +++++++++++++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 5669baf2a6fe..c42e41ed35fe 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1163,12 +1163,25 @@ static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr)
>  		this_cpu_sub(tag->counters->bytes, PAGE_SIZE * nr);
>  }
>  
> +static inline void pgalloc_tag_add_pages(struct page *page, unsigned int nr)
> +{
> +	struct alloc_tag *tag;
> +
> +	if (!mem_alloc_profiling_enabled())
> +		return;
> +
> +	tag = __pgalloc_tag_get(page);
> +	if (tag)
> +		this_cpu_add(tag->counters->bytes, PAGE_SIZE * nr);
> +}
> +
>  #else /* CONFIG_MEM_ALLOC_PROFILING */
>  
>  static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
>  				   unsigned int nr) {}
>  static inline void pgalloc_tag_sub(struct page *page, unsigned int nr) {}
>  static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr) {}
> +static inline void pgalloc_tag_add_pages(struct page *page, unsigned int nr) {}
>  
>  #endif /* CONFIG_MEM_ALLOC_PROFILING */
>  
> @@ -5065,11 +5078,28 @@ static void ___free_pages(struct page *page, unsigned int order,
>  {
>  	/* get PageHead before we drop reference */
>  	int head = PageHead(page);
> +	/*
> +	 * For remaining pages other than the first page of
> +	 * a non-compound allocation, we decrease its tag
> +	 * pages in advance, in case the first page is released
> +	 * by other thread inbetween our put_page_testzero and any
> +	 * accounting behavior afterwards.
> +	 */
> +	unsigned int remaining_tag_pages = 0;
>  
> -	if (put_page_testzero(page))
> +	if (order > 0 && !head) {
> +		if (unlikely(page_ref_count(page) > 1)) {
> +			remaining_tag_pages = (1 << order) - 1;
> +			pgalloc_tag_sub_pages(page, remaining_tag_pages);
> +		}
> +	}
> +
> +	if (put_page_testzero(page)) {
> +		/* no need special treat for remaining pages, add it back. */
> +		if (unlikely(remaining_tag_pages > 0))
> +			pgalloc_tag_add_pages(page, remaining_tag_pages);
>  		__free_frozen_pages(page, order, fpi_flags);
> -	else if (!head) {
> -		pgalloc_tag_sub_pages(page, (1 << order) - 1);
> +	} else if (!head) {
>  		while (order-- > 0)
>  			__free_frozen_pages(page + (1 << order), order,
>  					    fpi_flags);

