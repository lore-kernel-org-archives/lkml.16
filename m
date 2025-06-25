Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDD83074AD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750884474; cv=none; b=O1n5LLagPVt+z/eFv6bGJc9y/J/x/+TDmiYlhLo78xwC33Fx5GhBubKFNFE5HM4EIOJ44wmLqZarLsjTvV0VnMk5e5/PuYhw9+I4kmKi0ytEQEmg8pozdKhsO9b7HZmD8WB+oC5Q5EqIYdDJiUcoPgoN1u9x3I3NYj6fdZSjA/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750884474; c=relaxed/simple;
	bh=0olf+pHGGC2Z+86Wjw1DQMqCP3crLv7nB2XAwsL4DRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvXjWTTtnAX1FKI5/d0i6nluE+0tf2pB/SpX26aKcPT6t0+OTnuBME1hn6HdtH1GE6NN37TiuVxE8MOQgPT69HkAyyuzmEqV25MvMA6skemKuJjs8X6gNyIje7vQ1mdbxIAMXgC3eADEXNnvuT4najSYlWusszgbmzHb96myrvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RHr5AWyT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nPS3ts6u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RHr5AWyT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nPS3ts6u; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RHr5AWyT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nPS3ts6u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RHr5AWyT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nPS3ts6u"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 477931F399;
	Wed, 25 Jun 2025 20:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750884470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UZuuQVBAOjxFkwRxiQlkI49ia3QjY5cZKASUPO9GhxM=;
	b=RHr5AWyTogjk7wDUHEicPyxGiIs/pm55BRPKvkL9SDhFgebicB16M30BYwG/uRn5djaUZP
	BmrKSYr2hSCgpXnLFVLKOwAWy7laZjQHjgBU7j38J3QwbIIoMJ2b3oUH59jvQBl/U3+fwW
	Q1wojKxyt/6ercQ10GWe8lu6Ung+z2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750884470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UZuuQVBAOjxFkwRxiQlkI49ia3QjY5cZKASUPO9GhxM=;
	b=nPS3ts6uFxPnl16PEip4jBEtKbL42bAEZKxyJJdS2mzduTsk97QrxfkBn6+47oIudy1znn
	eFT8NPcAx5XrVOAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750884470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UZuuQVBAOjxFkwRxiQlkI49ia3QjY5cZKASUPO9GhxM=;
	b=RHr5AWyTogjk7wDUHEicPyxGiIs/pm55BRPKvkL9SDhFgebicB16M30BYwG/uRn5djaUZP
	BmrKSYr2hSCgpXnLFVLKOwAWy7laZjQHjgBU7j38J3QwbIIoMJ2b3oUH59jvQBl/U3+fwW
	Q1wojKxyt/6ercQ10GWe8lu6Ung+z2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750884470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UZuuQVBAOjxFkwRxiQlkI49ia3QjY5cZKASUPO9GhxM=;
	b=nPS3ts6uFxPnl16PEip4jBEtKbL42bAEZKxyJJdS2mzduTsk97QrxfkBn6+47oIudy1znn
	eFT8NPcAx5XrVOAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CEEDF13485;
	Wed, 25 Jun 2025 20:47:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AL0uL3VgXGi8fwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Wed, 25 Jun 2025 20:47:49 +0000
Date: Wed, 25 Jun 2025 22:47:40 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
	Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] mm,hugetlb: Sort out folio locking in the
 faulting path
Message-ID: <aFxgbC-qGL8dpgGG@localhost.localdomain>
References: <20250620123014.29748-1-osalvador@suse.de>
 <20250620123014.29748-3-osalvador@suse.de>
 <35b03911-74c3-4626-aaa8-4c331c086f8f@redhat.com>
 <aFupdJ_ky4wT6wGM@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFupdJ_ky4wT6wGM@localhost.localdomain>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,localhost.localdomain:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Wed, Jun 25, 2025 at 09:47:00AM +0200, Oscar Salvador wrote:
> On Mon, Jun 23, 2025 at 04:11:38PM +0200, David Hildenbrand wrote:
> > > @@ -6801,13 +6810,24 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
> > >   		/* Fallthrough to CoW */
> > >   	}
> > > -	/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
> > > -	folio = page_folio(pte_page(vmf.orig_pte));
> > > -	folio_lock(folio);
> > > -	folio_get(folio);
> > > -
> > >   	if (flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
> > >   		if (!huge_pte_write(vmf.orig_pte)) {
> > > +			/*
> > > +			 * Anonymous folios need to be lock since hugetlb_wp()
> > > +			 * checks whether we can re-use the folio exclusively
> > > +			 * for us in case we are the only user of it.
> > > +			 */
> > 
> > Should we move that comment to hugetlb_wp() instead? And if we are already
> > doing this PTL unlock dance now, why not do it in hugetlb_wp() instead so we
> > can simplify this code?
> 
> Yes, probably we can move it further up.
> Let me see how it would look.

So, I've been thinking about this, and I'm not so sure.
By default, the state of the folio in hugetlb_no_page and hugetlb_fault is
different.

hugetlb_no_page() has the folio locked already, and hugetlb_fault() hasn't, which
means that if we want to move this further up, 1) hugetlb_no_page() would have to
unlock the folio to then lock it in hugetlb_wp() in case it's anonymous or
2) pass a parameter to hugetlb_wp() to let it know whether the folio is already locked.

Don't really like any of them. Case 1) seems suboptimal as right now (with this patch)
we only unlock the folio in !anon case in hugetlb_no_page(). If we want to move the 'dance'
from hugetlb_fault() to hugetlb_wp(), we'd have to unlock and then lock it again.

-- 
Oscar Salvador
SUSE Labs
