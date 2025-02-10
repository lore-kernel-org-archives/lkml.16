Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617591C54A2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739193308; cv=none; b=UiyxcTvMVv8KO+1980tFi/nOIaMXnwJSVMdYtQz+jv05+/3pbdAsS4Njj1aO4UXlkRiPg4pGHlyYcMNDdEgJ7kE/S6TWQblHhut7zyHs1gOPw7BX3699s8NxKx/i8cD/NAOPVzk3X+3ZGvOttWXGqMHg9WRMIyrCK5Abg2fK+Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739193308; c=relaxed/simple;
	bh=GRztjpwlrRRA23p/1Oy3Q51ifDYYRxZzWxLDpf1Mk4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4F8QzpoB8GoBIXicxbF8pc2BTa1W1czDKuF398prkUpHYxLJJqzIfJ5smZONnNo8+ZYRCr5+c+WSDkBxYGfZ9Li/YGmRqyXlNIilEFpJje6AXBmjAZAowzv3+sGqQuHWdxV/xZCDCvzf+9LdiciBQXlLCKubKAyHLKYea7YrhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QbfJr9Iu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ny7OKTdt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QbfJr9Iu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ny7OKTdt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QbfJr9Iu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ny7OKTdt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QbfJr9Iu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ny7OKTdt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6084C21106;
	Mon, 10 Feb 2025 13:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739193304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xlmAzRtWPENVb4EYtsH26IXnshftttCWb/bTVIHZo9o=;
	b=QbfJr9IuvJhzvVDNmYxRSkcoIpSapXOZZYJkRWiv9bdjiwlm3+cB5ZkeIxWXK8DC20sPnu
	jHcSXMYyZMaTItSsu/yZQzu2IM1UOUiQLiCuWZv3ok4p/SkbE2Q9OLRme9GC/ms4x/LD8e
	q7btknOl1ReGvDEcCwnnootR7yam1IE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739193304;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xlmAzRtWPENVb4EYtsH26IXnshftttCWb/bTVIHZo9o=;
	b=ny7OKTdtkDITeYiYkWNXogzU/ho9FXpvn4zFqmMz9v7P2WhjPq4DPyPecB9IhuBpwqzq9O
	Xg1L+PTlp6c3XmDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QbfJr9Iu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ny7OKTdt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739193304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xlmAzRtWPENVb4EYtsH26IXnshftttCWb/bTVIHZo9o=;
	b=QbfJr9IuvJhzvVDNmYxRSkcoIpSapXOZZYJkRWiv9bdjiwlm3+cB5ZkeIxWXK8DC20sPnu
	jHcSXMYyZMaTItSsu/yZQzu2IM1UOUiQLiCuWZv3ok4p/SkbE2Q9OLRme9GC/ms4x/LD8e
	q7btknOl1ReGvDEcCwnnootR7yam1IE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739193304;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xlmAzRtWPENVb4EYtsH26IXnshftttCWb/bTVIHZo9o=;
	b=ny7OKTdtkDITeYiYkWNXogzU/ho9FXpvn4zFqmMz9v7P2WhjPq4DPyPecB9IhuBpwqzq9O
	Xg1L+PTlp6c3XmDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD04413A62;
	Mon, 10 Feb 2025 13:15:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NwAqK9f7qWflBgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 10 Feb 2025 13:15:03 +0000
Date: Mon, 10 Feb 2025 14:14:54 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Frank van der Linden <fvdl@google.com>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yuzhao@google.com,
	usamaarif642@gmail.com, joao.m.martins@oracle.com,
	roman.gushchin@linux.dev
Subject: Re: [PATCH v3 06/28] mm/hugetlb: remove redundant __ClearPageReserved
Message-ID: <Z6n7zv2KCNawcF0y@localhost.localdomain>
References: <20250206185109.1210657-1-fvdl@google.com>
 <20250206185109.1210657-7-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206185109.1210657-7-fvdl@google.com>
X-Rspamd-Queue-Id: 6084C21106
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,linux.dev,kvack.org,vger.kernel.org,google.com,gmail.com,oracle.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Thu, Feb 06, 2025 at 06:50:46PM +0000, Frank van der Linden wrote:
> In hugetlb_folio_init_tail_vmemmap, the reserved flag is cleared for
> the tail page just before it is zeroed out, which is redundant.
> Remove the __ClearPageReserved call.
> 
> Signed-off-by: Frank van der Linden <fvdl@google.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

> ---
>  mm/hugetlb.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 1d8ec21dc2c2..0836e3231774 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3202,7 +3202,6 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>  	for (pfn = head_pfn + start_page_number; pfn < end_pfn; pfn++) {
>  		struct page *page = pfn_to_page(pfn);
>  
> -		__ClearPageReserved(folio_page(folio, pfn - head_pfn));
>  		__init_single_page(page, pfn, zone, nid);
>  		prep_compound_tail((struct page *)folio, pfn - head_pfn);
>  		ret = page_ref_freeze(page, 1);
> -- 
> 2.48.1.502.g6dc24dfdaf-goog
> 
> 

-- 
Oscar Salvador
SUSE Labs
