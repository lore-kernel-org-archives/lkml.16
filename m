Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B192E11D0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 21:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749851276; cv=none; b=pvVmZcyT7sjaSad3rSmegweTmCPz0Qvh3CcnFw0uOLYPhWamQabzoPoqY7NfRmm/avgenth63MRoB3lSDS9roKt3eHOpns48ntG4KnhkEzrcQ3X4NKUTZBr6+iloNwWEz7F7uiZkCHqW7pSCwiuZfeXQkTOh+8eR6IfizEdNbns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749851276; c=relaxed/simple;
	bh=dtBCrC90bkifcc3nlBP/j5QlVWA95mgeQNwsYwKqvMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+Bc//2YYCT0d/U5VkTcXRH92s519U1rvNgkq/woIlDt0AfcRUYevU6318ZjSxi/VGd4U/Sc+AedYiMP5h96DiaJvLXU+VyWmbSXpEctX/rPLzSq2713Y1COFbQFW+WnHPctk/GbcG/ySrU016E7uhXX0/rNfXO0nSTtMUI4F6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=amu/e/j4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AfW23ToI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=amu/e/j4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AfW23ToI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="amu/e/j4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AfW23ToI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="amu/e/j4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AfW23ToI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 439AB1F390;
	Fri, 13 Jun 2025 21:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749851272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0Mxv7vMvbtG1IFq4FNjqvJLfb+OhVhpCKOxzSZ2rlo=;
	b=amu/e/j4HA/6/f74zZzwYswY/ofIksR6uzmlVhcnP4iJfJmZpAFSB2s++jtEP6vnwz5dgl
	LhgwejYF+75+eSseYsC7SLDYixVYtukBtQqh7AgaGfbKxHy7upTNOalYYwsyKdDg/cTtAx
	CW4pE50gFkCopUrTn/6GV4JGf7KUxSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749851272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0Mxv7vMvbtG1IFq4FNjqvJLfb+OhVhpCKOxzSZ2rlo=;
	b=AfW23ToIN8oTeKGdSxKHJW+/TLKb5l1Lr5ua+2knUTcxwxjLSuWoCQxDByOHPn+hTdn6k/
	EtcWPst4AuLSNPAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="amu/e/j4";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AfW23ToI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749851272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0Mxv7vMvbtG1IFq4FNjqvJLfb+OhVhpCKOxzSZ2rlo=;
	b=amu/e/j4HA/6/f74zZzwYswY/ofIksR6uzmlVhcnP4iJfJmZpAFSB2s++jtEP6vnwz5dgl
	LhgwejYF+75+eSseYsC7SLDYixVYtukBtQqh7AgaGfbKxHy7upTNOalYYwsyKdDg/cTtAx
	CW4pE50gFkCopUrTn/6GV4JGf7KUxSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749851272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0Mxv7vMvbtG1IFq4FNjqvJLfb+OhVhpCKOxzSZ2rlo=;
	b=AfW23ToIN8oTeKGdSxKHJW+/TLKb5l1Lr5ua+2knUTcxwxjLSuWoCQxDByOHPn+hTdn6k/
	EtcWPst4AuLSNPAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B40B3137FE;
	Fri, 13 Jun 2025 21:47:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IHoGKYecTGiVDgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 13 Jun 2025 21:47:51 +0000
Date: Fri, 13 Jun 2025 23:47:50 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in
 the faulting path
Message-ID: <aEychl8ZkJDG1-5K@localhost.localdomain>
References: <20250612134701.377855-1-osalvador@suse.de>
 <20250612134701.377855-3-osalvador@suse.de>
 <44f0f1cc-307a-46e3-9e73-8b2061e4e938@redhat.com>
 <aEw0dxfc5n8v1-Mp@localhost.localdomain>
 <ffeeb3d2-0e45-43d1-b2e1-a55f09b160f5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffeeb3d2-0e45-43d1-b2e1-a55f09b160f5@redhat.com>
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 439AB1F390
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

On Fri, Jun 13, 2025 at 09:57:23PM +0200, David Hildenbrand wrote:
> What I meant is:
> 
> Assume we have a pagecache page mapped into our page tables R/O (MAP_PRIVATE
> mapping).
> 
> During a write fault on such a pagecache page, we end up in
> do_wp_page()->wp_page_copy() we perform the copy via __wp_page_copy_user()
> without the folio lock.

Yes, it would be similar to doing

hugetlb_fault()->hugetlb_no_page() which would map it R/O.
Then, if we write to it, we will go to hugetlb_wp().
Since it is a private mapping, we would only need to lock the folio to
see if we can re-use it (the wp_can_reuse_anon_folio() analog to
hugetlb).

> In wp_page_copy(), we retake the pt lock, to make sure that the page is
> still mapped (pte_same). If the page is no longer mapped, we retry the
> fault.
> 
> In that case, we only want to make sure that the folio is still mapped after
> possibly dropping the page table lock in between.
> 
> As we are holding an additional folio reference in
> do_wp_page()->wp_page_copy(), the folio cannot get freed concurrently.
> 
> 
> There is indeed the do_cow_fault() path where we avoid faulting in the
> pagecache page in the first place. So no page table reference, an I can
> understand why we would need the folio lock there.

But do_cow_fault() does take a reference via __do_fault()->filemap_fault().

> Regarding hugetlb_no_page(): I think we could drop the folio lock for a
> pagecache folio after inserting the folio into the page table. Just like
> do_wp_page()->wp_page_copy(), we would have to verify again under PTL if the
> folio is still mapped
> 
> ... which we already do through pte_same() checks?

But that is somewhat similar what we do in the generic faulting path.

Assume you fault in a file for a private mapping and do COW.
So, do_pte_missing()->do_fault()->do_cow_fault().

do_cow_fault()->__do_fault() will a) get a reference and b) lock the folio.
And then we will proceed with copying the file to the page we will map privately.

This would be something like hugetlb_fault()->hugetlb_no_page()->hugetlb_wp().
So we have to hold the lock throughout hugetlb_wp() for file pages we are copying
to private mappings.

Now, let us assume you map the file R/O. And after a while you write-fault to it.
In the generic faulting path, that will go through:

do_pte_missing()->do_fault()->do_read_fault()
do_wp_page()->wp_page_copy()

wp_page_copy(), which indeed doesn't hold the lock (but takes a reference).

Maybe it's because it's Friday, but I'm confused as to why 
do_pte_missing()->do_fault()->do_cow_fault() holds the lock while do_wp_page() doesn't
although it might the file's page we have to copy. 

 

-- 
Oscar Salvador
SUSE Labs
