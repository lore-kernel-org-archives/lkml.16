Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5CF19DF5B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749892082; cv=none; b=V/oqV2zoFgnYe5Acg0Vh9WgNksQZ/rNWjGCJkzUiehJNxn+D+YaoAER1Zx1SehB0doJz7nF6uRYwq17lnik6ZRXX3qsYXpOFIuXJ9NMOYlHapKXrqjZpPD5O0BbW4PCthAJ6aIBTuOXfGbkaJk50X0/aTwsD3p0zyhVPjD/imPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749892082; c=relaxed/simple;
	bh=pNk+Dp8/kXHtxpd8NF5C4HG9zKIHwuOtlbhRxcdUYD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mq810BX+4fDJhpfcVhIRwC8gGIRCIzezfFlsh05n1w0J9XB7MULcWMqAEhzBYrWVgbEYoSL2y+JxPe6+oKrwRuLLg1XJZwyeaaXIiV96cFqb2fvpuEyXC66Hau6EdpJTDy6+qYRVhUCUV9/EkNp1xqmderHDw+vWz34uuPEZcPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OxXIYpnD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2DhGvnmi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WvmSNZ5x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w4agyddh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OxXIYpnD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2DhGvnmi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WvmSNZ5x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w4agyddh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 73D581F387;
	Sat, 14 Jun 2025 09:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749892079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8urkubVfkTkvBWlqzjAWlocH28bSNYcyUT7sZNvTQpU=;
	b=OxXIYpnDCbtok7Fyrqlb8iBaaHaUtycZBlNCjh9X2G5aCA1zg7/3a2vG1FaVUCWZsUB5VR
	4tuIKqK3KDPawcTH5zXvkGCBP8goHybCNIQc92uGr4cGec6bIPtUObwML0eKaUqE1pL+vN
	HDn29gaCtpeNa/7QqJSH6GnqO6PULkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749892079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8urkubVfkTkvBWlqzjAWlocH28bSNYcyUT7sZNvTQpU=;
	b=2DhGvnmiWslnN2l3uiT48H9uAv2T8PLfRNEuhNXZjflZgZXLPFdDCRh6jp4iBhtP67wCQI
	YC1a78H/w3l8vZBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WvmSNZ5x;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=w4agyddh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749892077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8urkubVfkTkvBWlqzjAWlocH28bSNYcyUT7sZNvTQpU=;
	b=WvmSNZ5xbD6A3CkPktKEG6H4avmmFwOsnSi53VciGSWLw6VNFn0+LV2ABkYavLwk8DTRlz
	j3zzyJMkY8mPhtycfeQqaBSO87I79zMnaQSueKA8SnQiLVpSF05yXC6Dr8enKye/S9fns4
	xdMMnnEnvaSOBkv81NZXNKtGibKWIlw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749892077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8urkubVfkTkvBWlqzjAWlocH28bSNYcyUT7sZNvTQpU=;
	b=w4agyddhJSF5Ourx0AnrkKNeyXmWmxTnqRXv7BRshqTaQxsezDLIVorVeMxEY9wrbOqhgi
	JY/LlXqlx0S5N4Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEB7D139E2;
	Sat, 14 Jun 2025 09:07:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lV1iN+s7TWgiLgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Sat, 14 Jun 2025 09:07:55 +0000
Date: Sat, 14 Jun 2025 11:07:50 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in
 the faulting path
Message-ID: <aE075ld-fOyMipcJ@localhost.localdomain>
References: <20250612134701.377855-1-osalvador@suse.de>
 <20250612134701.377855-3-osalvador@suse.de>
 <44f0f1cc-307a-46e3-9e73-8b2061e4e938@redhat.com>
 <aEw0dxfc5n8v1-Mp@localhost.localdomain>
 <ffeeb3d2-0e45-43d1-b2e1-a55f09b160f5@redhat.com>
 <aEychl8ZkJDG1-5K@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEychl8ZkJDG1-5K@localhost.localdomain>
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 73D581F387
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

On Fri, Jun 13, 2025 at 11:47:50PM +0200, Oscar Salvador wrote:
> Maybe it's because it's Friday, but I'm confused as to why 
> do_pte_missing()->do_fault()->do_cow_fault() holds the lock while do_wp_page() doesn't
> although it might the file's page we have to copy. 

Scratch that, I see my confusion.
The first time we map the file privately, the folio must remain stable.
But if we already mapped it privately before (R/O), and we write fault on it,
we don't need to be stable (e.g: uptodated).

But I think my comment on hugetlb_no_page() still holds, because

hugetlb_fault->hugetlb_no_page->hugetlb_wp 

would be similar to do_pte_missing->do_cow, and in do_cow we hold both
the reference and the lock.
Were we might not need the lock is in hugetlb_fault->hugetlb_wp, which
would be similar to do_wp_page()->wp_page_copy.
Of course we will need to take it if it is an anonymous folio because we need
to check the re-use case.

So, it gets complicated because hugetlb_no_page() needs to call
hugetlb_wp() with the lock held in case it is a pagecache folio, and
and the same time hugetlb_wp() needs to take the lock if it us an anonymous
one for the re-use case.
So, all in all, I think that it is easier when both callers of hugetlb_wp()
hold the lock, so we do not have to do weird dances, and document why it is done.


-- 
Oscar Salvador
SUSE Labs
