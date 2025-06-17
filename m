Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CAA2BF012
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750154599; cv=none; b=jOhbEjQF0AkZmwpg5Ogs33XRAaM3Y0z0sKzVDbsq1nkoXgx+g03jCHVZ+A3B183dltcMRKnmyKRzS4brJwzDFvUoC7fLY2ya6fIcXuUiERBGthjZQFKLRiiaVYDbO7EXb8UDjlqkTsyvQ8m9ZshiO8o2z/PIYXoOUOStZGa0qZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750154599; c=relaxed/simple;
	bh=89x755ehqxV4PxNYZeJleUo/fHv/V0t6PSoaOVSeTCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2q+Hwu3QvKxzihzd298P7VqsqXKhZMravO6SQpasZ22fFLryjemLRozeO5gLjK2r55KWBDjhUSF02MMUgMNrXRRrudDWo5323azz2lWzp+7BoMw2w49howKirLvzyumD1GgZKIYEttLHBZYqKWkCDCNoE/aKSijcOOmFz8kc3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=abbLPbCF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+4+4PvYT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=abbLPbCF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+4+4PvYT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="abbLPbCF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+4+4PvYT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="abbLPbCF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+4+4PvYT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 657D021190;
	Tue, 17 Jun 2025 10:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750154595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lkNuGFHnLWcnxmlORCCDKyxXf53aZscV6U0/WkfcPWo=;
	b=abbLPbCF0mQbynj4JRIDX4N1v1ml2XXAGepHiUo+Bi1uAaXbeK8xjHw3Zfl51/DW60qKhO
	ERYt3F3iBlmZpBPXx0GyvgFSbEfFnPSrw8T9hM4NVtZYPMwv8NYUSp4nWuTMEbVgEensPZ
	DbSsc3bjGy/NEZpxir9EGu0OQJNtSZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750154595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lkNuGFHnLWcnxmlORCCDKyxXf53aZscV6U0/WkfcPWo=;
	b=+4+4PvYT4QpEoAXU/fGikyT2jcyOTXZly0hpO0zg6KqC6MjqPV2L3pcYAK4A1+fLOj90Dc
	+VsZjnJM4K+uMgBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=abbLPbCF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+4+4PvYT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750154595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lkNuGFHnLWcnxmlORCCDKyxXf53aZscV6U0/WkfcPWo=;
	b=abbLPbCF0mQbynj4JRIDX4N1v1ml2XXAGepHiUo+Bi1uAaXbeK8xjHw3Zfl51/DW60qKhO
	ERYt3F3iBlmZpBPXx0GyvgFSbEfFnPSrw8T9hM4NVtZYPMwv8NYUSp4nWuTMEbVgEensPZ
	DbSsc3bjGy/NEZpxir9EGu0OQJNtSZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750154595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lkNuGFHnLWcnxmlORCCDKyxXf53aZscV6U0/WkfcPWo=;
	b=+4+4PvYT4QpEoAXU/fGikyT2jcyOTXZly0hpO0zg6KqC6MjqPV2L3pcYAK4A1+fLOj90Dc
	+VsZjnJM4K+uMgBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEBC913A69;
	Tue, 17 Jun 2025 10:03:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FR6GM2I9UWgFFgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 17 Jun 2025 10:03:14 +0000
Date: Tue, 17 Jun 2025 12:03:13 +0200
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in
 the faulting path
Message-ID: <aFE9YTNcCHAGBtKi@localhost.localdomain>
References: <20250612134701.377855-1-osalvador@suse.de>
 <20250612134701.377855-3-osalvador@suse.de>
 <44f0f1cc-307a-46e3-9e73-8b2061e4e938@redhat.com>
 <aEw0dxfc5n8v1-Mp@localhost.localdomain>
 <ffeeb3d2-0e45-43d1-b2e1-a55f09b160f5@redhat.com>
 <aEychl8ZkJDG1-5K@localhost.localdomain>
 <aE075ld-fOyMipcJ@localhost.localdomain>
 <a5e098d1-ee5a-447f-9e05-0187b22500e1@redhat.com>
 <aFAlupvoJ_w7jCIU@localhost.localdomain>
 <1297fdd5-3de2-45bc-b146-e14061643fee@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1297fdd5-3de2-45bc-b146-e14061643fee@redhat.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 657D021190
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51

On Mon, Jun 16, 2025 at 04:41:20PM +0200, David Hildenbrand wrote:
> On 16.06.25 16:10, Oscar Salvador wrote:
> > What do you mean by stable?
> 
> The same "stable" you used in the doc, that I complained about ;)

Touche :-D

> > In the generic faulting path, we're not worried about the page going away
> > because we hold a reference, so I guess the lock must be to keep content stable?
> 
> What you want to avoid is IIRC, is someone doing a truncation/reclaim on the
> folio while you are mapping it.

Ok, I see. I thought it was more about holding writes, but this makes sense.

> Take a look at truncate_inode_pages_range() where we do a folio_lock()
> around truncate_inode_folio().
> 
> In other words, while you hold the folio lock (and verified that the folio
> was not truncated yet: for example, that folio->mapping is still set), you
> know that it cannot get truncated concurrently -- without holding other
> expensive locks.
> 
> Observe how truncate_cleanup_folio() calls
> 
> 	if (folio_mapped(folio))
> 		unmap_mapping_folio(folio);
> 
> To remove all page table mappings.
> 
> So while holding the folio lock, new page table mappings are not expected to
> appear (IIRC).

Ah ok, so it's more that we don't end up mapping something that's not there
anymore (or something completely different).

> > I mean, yes, after we have mapped the page privately into the pagetables,
> > we don't have business about content-integrity anymore, so given this rule, yes,
> > I guess hugetlb_wp() wouldn't need the lock (for !anonymous) because we already
> > have mapped it privately at that point.
> 
> That's my understanding. And while holding the PTL it cannot get unmapped.
> Whenever you temporarily drop the PTL, you have to do a pte_same() check to
> make sure concurrent truncation didn't happen.

Yap, hugetlb_wp() drops the locks temporarily when it needs to unmap the private
page from other processes, but then does the pte_same() check.

> So far my understanding at least of common filemap code.
> 
> > 
> > But there's something I don't fully understand and makes me feel uneasy.
> > If the lock in the generic faultin path is to keep content stable till we
> > have mapped it privately, wouldn't be more correct to also hold it
> > during the copy in hugetlb_wp, to kinda emulate that?
> As long there us a page table mapping, it cannot get truncated. So if you
> find a PTE under PTL that maps that folio, truncation could not have
> happened.

I see, this makes a lot of sense, thanks for walking me through David!
Alright, then, with all this clear now we should:

- Not take any locks on hugetlb_fault()->hugetlb_wp(), hugetlb_wp() will take it
  if it's an anonymous folio (re-use check)
- Drop the lock in hugetlb_no_page() after we have mapped the page in
  the pagetables
- hugetlb_wp() will take the lock IFF the folio is anonymous

This will lead to something like the following:

 diff --git a/mm/hugetlb.c b/mm/hugetlb.c
 index dfa09fc3b2c6..4d48cda8a56d 100644
 --- a/mm/hugetlb.c
 +++ b/mm/hugetlb.c
 @@ -6198,6 +6198,8 @@ static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
  	 * in scenarios that used to work. As a side effect, there can still
  	 * be leaks between processes, for example, with FOLL_GET users.
  	 */
 +	if (folio_test_anon(old_folio))
 +		folio_lock(old_folio);
  	if (folio_mapcount(old_folio) == 1 && folio_test_anon(old_folio)) {
  		if (!PageAnonExclusive(&old_folio->page)) {
  			folio_move_anon_rmap(old_folio, vma);
 @@ -6212,6 +6214,8 @@ static vm_fault_t hugetlb_wp(struct vm_fault *vmf)
  	}
  	VM_BUG_ON_PAGE(folio_test_anon(old_folio) &&
  		       PageAnonExclusive(&old_folio->page), &old_folio->page);
 +	if (folio_test_anon(old_folio))
 +		folio_unlock(old_folio);
 
  	/*
  	 * If the process that created a MAP_PRIVATE mapping is about to perform
 @@ -6537,11 +6541,6 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
  			}
  			new_pagecache_folio = true;
  		} else {
 -			/*
 -			 * hugetlb_wp() expects the folio to be locked in order to
 -			 * check whether we can re-use this page exclusively for us.
 -			 */
 -			folio_lock(folio);
  			anon_rmap = 1;
  		}
  	} else {
 @@ -6558,7 +6557,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 
  		/* Check for page in userfault range. */
  		if (userfaultfd_minor(vma)) {
 -			folio_unlock(folio);
 +			if (!anon_rmap)
 +				folio_unlock(folio);
  			folio_put(folio);
  			/* See comment in userfaultfd_missing() block above */
  			if (!hugetlb_pte_stable(h, mm, vmf->address, vmf->pte, vmf->orig_pte)) {
 @@ -6604,6 +6604,13 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
  		new_pte = huge_pte_mkuffd_wp(new_pte);
  	set_huge_pte_at(mm, vmf->address, vmf->pte, new_pte, huge_page_size(h));
 
 +	/*
 +	 * This folio cannot have been truncated since we were holding the lock,
 +	 * and we just mapped it into the pagetables. Drop the lock now.
 +	 */
 +	if (!anon_rmap)
 +		folio_unlock(folio);
 +
  	hugetlb_count_add(pages_per_huge_page(h), mm);
  	if ((vmf->flags & FAULT_FLAG_WRITE) && !(vma->vm_flags & VM_SHARED)) {
  		/* Optimization, do the COW without a second fault */
 @@ -6619,8 +6626,6 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
  	 */
  	if (new_folio)
  		folio_set_hugetlb_migratable(folio);
 -
 -	folio_unlock(folio);
  out:
  	hugetlb_vma_unlock_read(vma);
 
 @@ -6639,8 +6644,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
  backout_unlocked:
  	if (new_folio && !new_pagecache_folio)
  		restore_reserve_on_error(h, vma, vmf->address, folio);
 -
 -	folio_unlock(folio);
 +	if (!anon_rmap)
 +		folio_unlock(folio);
  	folio_put(folio);
  	goto out;
  }
 @@ -6805,21 +6810,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
  		/* Fallthrough to CoW */
  	}
 
 -	/*
 -	 * We need to lock the folio before calling hugetlb_wp().
 -	 * Either the folio is in the pagecache and we need to copy it over
 -	 * to another file, so it must remain stable throughout the operation,
 -	 * or the folio is anonymous and we need to lock it in order to check
 -	 * whether we can re-use it and mark it exclusive for this process.
 -	 * The timespan for the lock differs depending on the type, since
 -	 * anonymous folios only need to hold the lock while checking whether we
 -	 * can re-use it, while we need to hold it throughout the copy in case
 -	 * we are dealing with a folio from a pagecache.
 -	 * Representing this difference would be tricky with the current code,
 -	 * so just hold the lock for the duration of hugetlb_wp().
 -	 */
  	folio = page_folio(pte_page(vmf.orig_pte));
 -	folio_lock(folio);
  	folio_get(folio);
 
  	if (flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
 @@ -6835,7 +6826,6 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
  						flags & FAULT_FLAG_WRITE))
  		update_mmu_cache(vma, vmf.address, vmf.pte);
  out_put_page:
 -	folio_unlock(folio);
  	folio_put(folio);
  out_ptl:
  	spin_unlock(vmf.ptl);
  
This should be patch#2 with something like "Sorting out locking" per
title, and maybe explaining a bit more why the lock in hugelb_wp for
anonymous folios.

What do you think?

 

-- 
Oscar Salvador
SUSE Labs
