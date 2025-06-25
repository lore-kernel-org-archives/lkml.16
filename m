Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0211620C01C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837765; cv=none; b=gMCrgdeHCHV49zYSGxopCUupBhOkLqHuIpfrDnhv9Ups6UrJpeZJouOGA4Vwc4kVRUPretOg7Yq4qpK4yoW6kKFAiRkgYibSe2lBR3TFr8NnX4g1fYk06WLAMR8y96Qq8v+XQIvxjK6kpVYkpN658yfKVlbSU6II9MnpHE/ntCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837765; c=relaxed/simple;
	bh=jN08OTYH38tUVJAR/LI4pUfZymQlj+lO04MgHuOcC+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0+xgglxfRNSZ5AFllNdBRWj7Kq2/8MwWx73UFQxjtmxk5i+AAS4lGEY4AW48QJAAJz+GOy8itwcjaG+PrCG3tfUD7pkKnHLiXDkD5wQcHDq7WyZzSjpHscoPT/ICoKbnX3CsD2aBAEDUzrBsDimKDSRY7qxa6zHU3ZLiRqNiRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ky+FwROw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ddo9K6Xb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ky+FwROw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ddo9K6Xb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ky+FwROw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ddo9K6Xb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ky+FwROw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ddo9K6Xb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 189201F457;
	Wed, 25 Jun 2025 07:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750837762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xBi6Z7Br2c0Ky9I5Xc5h8XCGppMNPPySOqJFZ6G+/yM=;
	b=ky+FwROwA/HryequEQWELKvrAPkwcLMgifCo+pE8kwT5wY6bh07Du3hHENhvh3mWrBx83z
	/hAHCFN7f0LNT44WSVvI84up2xLATcEnnSo60K7zZEyjIdJwbSWgDu+7xzx6+NMcHhNGYM
	TPy3r+XrgpMrBFYCRWvO1kXk0ZcU2Qk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750837762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xBi6Z7Br2c0Ky9I5Xc5h8XCGppMNPPySOqJFZ6G+/yM=;
	b=ddo9K6XbN25y0Gyu8a4lfZ3xhytzMt0D6rnvFqivCeTC9uXDxJILafG4YkdM/inyDz+QAC
	fjL+nEp79QDIH2Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ky+FwROw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ddo9K6Xb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750837762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xBi6Z7Br2c0Ky9I5Xc5h8XCGppMNPPySOqJFZ6G+/yM=;
	b=ky+FwROwA/HryequEQWELKvrAPkwcLMgifCo+pE8kwT5wY6bh07Du3hHENhvh3mWrBx83z
	/hAHCFN7f0LNT44WSVvI84up2xLATcEnnSo60K7zZEyjIdJwbSWgDu+7xzx6+NMcHhNGYM
	TPy3r+XrgpMrBFYCRWvO1kXk0ZcU2Qk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750837762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xBi6Z7Br2c0Ky9I5Xc5h8XCGppMNPPySOqJFZ6G+/yM=;
	b=ddo9K6XbN25y0Gyu8a4lfZ3xhytzMt0D6rnvFqivCeTC9uXDxJILafG4YkdM/inyDz+QAC
	fjL+nEp79QDIH2Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A271213301;
	Wed, 25 Jun 2025 07:49:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ja7oJAGqW2hkEQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 25 Jun 2025 07:49:21 +0000
Date: Wed, 25 Jun 2025 09:49:20 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] mm,hugetlb: Change mechanism to detect a COW on
 private mapping
Message-ID: <aFuqAHvBSslOuEMQ@localhost.localdomain>
References: <20250620123014.29748-1-osalvador@suse.de>
 <20250620123014.29748-2-osalvador@suse.de>
 <45d66a0c-a5ed-4894-999c-0ed5b732ebb0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45d66a0c-a5ed-4894-999c-0ed5b732ebb0@redhat.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 189201F457
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51
X-Spam-Level: 

On Mon, Jun 23, 2025 at 04:09:51PM +0200, David Hildenbrand wrote:
> 
> > -	/*
> > -	 * hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) and
> > -	 * pagecache_folio, so here we need take the former one
> > -	 * when folio != pagecache_folio or !pagecache_folio.
> > -	 */
> > +	/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
> >   	folio = page_folio(pte_page(vmf.orig_pte));
> > -	if (folio != pagecache_folio)
> > -		if (!folio_trylock(folio)) {
> > -			need_wait_lock = 1;
> > -			goto out_ptl;
> > -		}
> > -
> > +	folio_lock(folio);
> >   	folio_get(folio);
> 
> Just realized that this won't work for this patch here, as we are holding
> the PTL.
> 
> In patch #2 you do the right thing.

Yap, missed that.
I might have to do the lock-unlock-dance here, and then in patch#2 move
it to hugetlb_wp.
Sounds reasonable?

 

-- 
Oscar Salvador
SUSE Labs
