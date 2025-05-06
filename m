Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84867263C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746518299; cv=none; b=BjrtSGE+bAgftZ3WOYi8dL4oQSawJHmz2NWJy38o5wH7v/2RXJINd1vlDII0iEIcBU6kj/hcgzeGNPAgfl236nuJPyt3lszqliwi5cS+qZd7RRlzzluf1Buv/WtMWcOvrVpkfLhiJvGBpc2ejPF++GfE0kl7iYmq9ZZ7fZpZqJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746518299; c=relaxed/simple;
	bh=PKq9TAWqsSHfIrNQ+J4jNBmLNJ2CPQsJGtDp/FGt6cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NklPy0uP/SxpA4Yhfh29WPotC63BCpHYXDSsSyH88YRVIyog7J8R+QAXV7yTAC830cyYanQmYgvwRWmzTTW9/9/f3r1DbkCI8zjX/7ItmtefkRcqTAsgzTYtCjofNj5RKrkkkc7L5zXuNpYul/Zyz1fvysIHE3rfvqwxk4aqkeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=M0gBjKGI; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=/lQucb07; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=M0gBjKGI; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=/lQucb07; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="M0gBjKGI";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="/lQucb07";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="M0gBjKGI";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="/lQucb07"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0982B21207;
	Tue,  6 May 2025 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746518296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=klf7XpHy1vcHXVSurXNJ4MOlF+r3ds7ekfP2woB+Iyo=;
	b=M0gBjKGITzJa4WJRfR3ZCvs/15VxZbIhsoan9LvQXyNcmFqZXpsF3yNkyqktuR3UrfTVPW
	vYpOwlngIweZAipfYAila29k/Twjj52xuFQ22EmpaT/ugPpUbwbb7g9gYMbECNGcSTmhRU
	RQ9LQvg3pdoa1zgc+aBmV2r7y3pVt3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746518296;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=klf7XpHy1vcHXVSurXNJ4MOlF+r3ds7ekfP2woB+Iyo=;
	b=/lQucb07VgeDYkjL9vaQaeFp0nlLp9q24rD8AnSjedSojswzUUhtsz56akZ1Gl1jb0OAnt
	F8xnVAMFpovcHPAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=M0gBjKGI;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="/lQucb07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1746518296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=klf7XpHy1vcHXVSurXNJ4MOlF+r3ds7ekfP2woB+Iyo=;
	b=M0gBjKGITzJa4WJRfR3ZCvs/15VxZbIhsoan9LvQXyNcmFqZXpsF3yNkyqktuR3UrfTVPW
	vYpOwlngIweZAipfYAila29k/Twjj52xuFQ22EmpaT/ugPpUbwbb7g9gYMbECNGcSTmhRU
	RQ9LQvg3pdoa1zgc+aBmV2r7y3pVt3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1746518296;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=klf7XpHy1vcHXVSurXNJ4MOlF+r3ds7ekfP2woB+Iyo=;
	b=/lQucb07VgeDYkjL9vaQaeFp0nlLp9q24rD8AnSjedSojswzUUhtsz56akZ1Gl1jb0OAnt
	F8xnVAMFpovcHPAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB57E137CF;
	Tue,  6 May 2025 07:58:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ja4PNRfBGWh1UQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 06 May 2025 07:58:15 +0000
Message-ID: <a8fd8cb3-c3e5-48be-a034-7a5c9f3ce778@suse.cz>
Date: Tue, 6 May 2025 09:58:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm/codetag: move tag retrieval back upfront in
 __free_pages()
To: David Wang <00107082@163.com>, akpm@linux-foundation.org,
 surenb@google.com, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org,
 ziy@nvidia.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <CAJuCfpHKcDkce=no0Uu3UO2ua2GkgkKMZxnctMuDbOqQNKj_KA@mail.gmail.com>
 <20250505193034.91682-1-00107082@163.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250505193034.91682-1-00107082@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0982B21207
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[163.com,linux-foundation.org,google.com,suse.com,cmpxchg.org,nvidia.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:dkim,suse.cz:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 5/5/25 21:30, David Wang wrote:
> Commit 51ff4d7486f0 ("mm: avoid extra mem_alloc_profiling_enabled()
>  checks") introduces a possible use-after-free scenario, when page
> is non-compound, page[0] could be released by other thread right
> after put_page_testzero failed in current thread, pgalloc_tag_sub_pages
> afterwards would manipulate an invalid page for accounting remaining
> pages:
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
> 
> Restore __free_pages() to its state before, retrieve alloc tag
> beforehand.
> 
> Fixes: 51ff4d7486f0 ("mm: avoid extra mem_alloc_profiling_enabled() checks")

That's a 6.15-rc1 commit, so no cc: stable needed, but should go to mm-hotfixes.

> Signed-off-by: David Wang <00107082@163.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Thanks!

> ---
>  include/linux/pgalloc_tag.h |  8 ++++++++
>  mm/page_alloc.c             | 15 ++++++---------
>  2 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
> index c74077977830..8a7f4f802c57 100644
> --- a/include/linux/pgalloc_tag.h
> +++ b/include/linux/pgalloc_tag.h
> @@ -188,6 +188,13 @@ static inline struct alloc_tag *__pgalloc_tag_get(struct page *page)
>  	return tag;
>  }
>  
> +static inline struct alloc_tag *pgalloc_tag_get(struct page *page)
> +{
> +	if (mem_alloc_profiling_enabled())
> +		return __pgalloc_tag_get(page);
> +	return NULL;
> +}
> +
>  void pgalloc_tag_split(struct folio *folio, int old_order, int new_order);
>  void pgalloc_tag_swap(struct folio *new, struct folio *old);
>  
> @@ -199,6 +206,7 @@ static inline void clear_page_tag_ref(struct page *page) {}
>  static inline void alloc_tag_sec_init(void) {}
>  static inline void pgalloc_tag_split(struct folio *folio, int old_order, int new_order) {}
>  static inline void pgalloc_tag_swap(struct folio *new, struct folio *old) {}
> +static inline struct alloc_tag *pgalloc_tag_get(struct page *page) { return NULL; }
>  
>  #endif /* CONFIG_MEM_ALLOC_PROFILING */
>  
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 5669baf2a6fe..1b00e14a9780 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1151,14 +1151,9 @@ static inline void pgalloc_tag_sub(struct page *page, unsigned int nr)
>  		__pgalloc_tag_sub(page, nr);
>  }
>  
> -static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr)
> +/* When tag is not NULL, assuming mem_alloc_profiling_enabled */
> +static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned int nr)
>  {
> -	struct alloc_tag *tag;
> -
> -	if (!mem_alloc_profiling_enabled())
> -		return;
> -
> -	tag = __pgalloc_tag_get(page);
>  	if (tag)
>  		this_cpu_sub(tag->counters->bytes, PAGE_SIZE * nr);
>  }
> @@ -1168,7 +1163,7 @@ static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr)
>  static inline void pgalloc_tag_add(struct page *page, struct task_struct *task,
>  				   unsigned int nr) {}
>  static inline void pgalloc_tag_sub(struct page *page, unsigned int nr) {}
> -static inline void pgalloc_tag_sub_pages(struct page *page, unsigned int nr) {}
> +static inline void pgalloc_tag_sub_pages(struct alloc_tag *tag, unsigned int nr) {}
>  
>  #endif /* CONFIG_MEM_ALLOC_PROFILING */
>  
> @@ -5065,11 +5060,13 @@ static void ___free_pages(struct page *page, unsigned int order,
>  {
>  	/* get PageHead before we drop reference */
>  	int head = PageHead(page);
> +	/* get alloc tag in case the page is released by others */
> +	struct alloc_tag *tag = pgalloc_tag_get(page);
>  
>  	if (put_page_testzero(page))
>  		__free_frozen_pages(page, order, fpi_flags);
>  	else if (!head) {
> -		pgalloc_tag_sub_pages(page, (1 << order) - 1);
> +		pgalloc_tag_sub_pages(tag, (1 << order) - 1);
>  		while (order-- > 0)
>  			__free_frozen_pages(page + (1 << order), order,
>  					    fpi_flags);

