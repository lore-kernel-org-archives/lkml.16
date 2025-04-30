Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63ED1EDA0E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999462; cv=none; b=efEanDnkF5nWA9fhdXxk+BYHJ0BZNlGEF16Jz6p3CvtjOlqS7xLpPLihMTFAcBKIFeGr7kGMs/k6H+1yJzyxUhRtbbS29MAmBZCTR9VQwq8YYdQIQj33kSWtonEwJsYBLPDLh8QJoohyjZlXA6J5E4VwFQ0Tp2IGT8Y7hd7DBxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999462; c=relaxed/simple;
	bh=EDMU+h0ZKd/bFT94pgKAxH87WKcgtieuxJYeL+dbFuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSdOzH5N8vpm+6nWFcV+Bx8ZxnKOvCBlVIm1FKrDQPtfpdOhVm23Xm+Mg2YDvckhxjVhjHAyJ9++fEHOO/TEwvfbzLI0nZj/4OYk93nAETQwrDzyJM0OFpcZzhn8G1hbrMJQjgKr/yUJL70eUvG4AWfCUNwG9cWNisXpxhlHago=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oJptAU3E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3NlxzIYS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oJptAU3E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3NlxzIYS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oJptAU3E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3NlxzIYS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oJptAU3E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3NlxzIYS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B04DE1F7CD;
	Wed, 30 Apr 2025 07:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745999458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgA3FvVgjo1HyZM+9jABfYH5Ii0eOTJBo6Tbqq4m9yY=;
	b=oJptAU3EmNB4qDC/4KC+4PAaz66WwfRdRR+yP2dLDgq0FwC7921UzMe5XmHY7pc9wsHYAw
	aJlDdFNULA2A7znBNvpnqJTtwGM019cLayP7kQVEhW/2QviYYAN1ZixJ+lGGkqsrS5nxgc
	MMwIyKBXr0fBMhBoVgk1tA074Z/X3gs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745999458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgA3FvVgjo1HyZM+9jABfYH5Ii0eOTJBo6Tbqq4m9yY=;
	b=3NlxzIYSoJgr7S/kiliPJ/m81Wy7BSlXqA4NsVot7hmnCEavGbY3/RWHRfJ5rM0B/6maQj
	Pk2v4EF7Fta0MrDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oJptAU3E;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3NlxzIYS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745999458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgA3FvVgjo1HyZM+9jABfYH5Ii0eOTJBo6Tbqq4m9yY=;
	b=oJptAU3EmNB4qDC/4KC+4PAaz66WwfRdRR+yP2dLDgq0FwC7921UzMe5XmHY7pc9wsHYAw
	aJlDdFNULA2A7znBNvpnqJTtwGM019cLayP7kQVEhW/2QviYYAN1ZixJ+lGGkqsrS5nxgc
	MMwIyKBXr0fBMhBoVgk1tA074Z/X3gs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745999458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgA3FvVgjo1HyZM+9jABfYH5Ii0eOTJBo6Tbqq4m9yY=;
	b=3NlxzIYSoJgr7S/kiliPJ/m81Wy7BSlXqA4NsVot7hmnCEavGbY3/RWHRfJ5rM0B/6maQj
	Pk2v4EF7Fta0MrDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C0B3139E7;
	Wed, 30 Apr 2025 07:50:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ewlWAGLWEWiLBAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 30 Apr 2025 07:50:58 +0000
Date: Wed, 30 Apr 2025 09:50:52 +0200
From: Oscar Salvador <osalvador@suse.de>
To: nifan.cxl@gmail.com
Cc: muchun.song@linux.dev, willy@infradead.org, mcgrof@kernel.org,
	a.manzanares@samsung.com, dave@stgolabs.net,
	akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Fan Ni <fan.ni@samsung.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH v3 1/4] mm/hugetlb: Pass folio instead of page to
 unmap_ref_private()
Message-ID: <aBHWXClZEclK6HPV@localhost.localdomain>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
 <20250428171608.21111-4-nifan.cxl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428171608.21111-4-nifan.cxl@gmail.com>
X-Rspamd-Queue-Id: B04DE1F7CD
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,suse.de:dkim,suse.de:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

On Mon, Apr 28, 2025 at 10:11:44AM -0700, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function unmap_ref_private() has only user, which passes in
> &folio->page. Let it take folio directly.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

> ---
>  mm/hugetlb.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index e287d8050b40..b1268e7ca1f6 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6039,7 +6039,7 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
>   * same region.
>   */
>  static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
> -			      struct page *page, unsigned long address)
> +			      struct folio *folio, unsigned long address)
>  {
>  	struct hstate *h = hstate_vma(vma);
>  	struct vm_area_struct *iter_vma;
> @@ -6083,7 +6083,8 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
>  		 */
>  		if (!is_vma_resv_set(iter_vma, HPAGE_RESV_OWNER))
>  			unmap_hugepage_range(iter_vma, address,
> -					     address + huge_page_size(h), page, 0);
> +					     address + huge_page_size(h),
> +					     &folio->page, 0);
>  	}
>  	i_mmap_unlock_write(mapping);
>  }
> @@ -6206,8 +6207,7 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
>  			hugetlb_vma_unlock_read(vma);
>  			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
>  
> -			unmap_ref_private(mm, vma, &old_folio->page,
> -					vmf->address);
> +			unmap_ref_private(mm, vma, old_folio, vmf->address);
>  
>  			mutex_lock(&hugetlb_fault_mutex_table[hash]);
>  			hugetlb_vma_lock_read(vma);
> -- 
> 2.47.2
> 
> 

-- 
Oscar Salvador
SUSE Labs
