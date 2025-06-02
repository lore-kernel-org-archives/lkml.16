Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62DD53365
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748897234; cv=none; b=PV3q3ON+0OwsSswrCJTfT0b6yN71j/R2xlwVSwY/SNcwmGkYzuUX5vv25cdMNiUEblVN8edS9Lt49cM1axewvacPDL5uz+Js0Qw6gSnH60OlJBvOMFBek+yfZrvmRJPDbRJP4GGzYbvt+ZWxHOlZThyWifIDvdh8fLBebLUe9f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748897234; c=relaxed/simple;
	bh=K+Xhpxc5XOy9EZ2w1sd1/rvRJgFNFeyJQcrdLadF99c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7LaxahRFFq7PdteEBeHFmPnp6mjYw/jriKfWQWZcMH4N2KCfiE55SbSPP2/oQkP22xDfzao1+eXoQPTyygBdecCqlAky7WLp5EZ5DVUS9WEp78kx4GwnUHQQBC7ds/1Fy+7f2U5UX4H6j2AdFBW2EAnubuL4B+FFRrraaNVDMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qf06fLmN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1I1UE7jb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qf06fLmN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1I1UE7jb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qf06fLmN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1I1UE7jb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qf06fLmN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1I1UE7jb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BE18C21260;
	Mon,  2 Jun 2025 20:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748897230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tfx8e2y8N3C9UcfzKeIsM4MfeOQAiZID9UtmjsreyJ4=;
	b=qf06fLmNbK2BYKxSOxEfDtJ2PUWQRXfAt0HIZKBUTIMNC7wSBOFtajgq3R9TwE3D+sQdEG
	lkfqy8qDyxTHmSYbTC1r3s32oHKTzNi4XBrzp7gLUa1z49W/iKNjaveTnmZr6jAOQL0eGo
	BHlKFS/d8aN5111Q8SHm/09fP5hjD8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748897230;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tfx8e2y8N3C9UcfzKeIsM4MfeOQAiZID9UtmjsreyJ4=;
	b=1I1UE7jbI9T0LZqMo696ywFslpIzN+ehTjA85y5kq89DJBwfeVWKXkc2wb2bmXljL7aCTo
	bbeMOPF45V+JhCCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748897230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tfx8e2y8N3C9UcfzKeIsM4MfeOQAiZID9UtmjsreyJ4=;
	b=qf06fLmNbK2BYKxSOxEfDtJ2PUWQRXfAt0HIZKBUTIMNC7wSBOFtajgq3R9TwE3D+sQdEG
	lkfqy8qDyxTHmSYbTC1r3s32oHKTzNi4XBrzp7gLUa1z49W/iKNjaveTnmZr6jAOQL0eGo
	BHlKFS/d8aN5111Q8SHm/09fP5hjD8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748897230;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tfx8e2y8N3C9UcfzKeIsM4MfeOQAiZID9UtmjsreyJ4=;
	b=1I1UE7jbI9T0LZqMo696ywFslpIzN+ehTjA85y5kq89DJBwfeVWKXkc2wb2bmXljL7aCTo
	bbeMOPF45V+JhCCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40B3C136C7;
	Mon,  2 Jun 2025 20:47:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IkkLDc4NPmi3XwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 02 Jun 2025 20:47:10 +0000
Date: Mon, 2 Jun 2025 22:47:04 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Peter Xu <peterx@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	James Houghton <jthoughton@google.com>,
	Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] mm, hugetlb: Clean up locking in hugetlb_fault
 and hugetlb_wp
Message-ID: <aD4NyEmRc50OCUBy@localhost.localdomain>
References: <20250602141610.173698-1-osalvador@suse.de>
 <20250602141610.173698-2-osalvador@suse.de>
 <aD2_0qoh1Os6srsA@x1.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD2_0qoh1Os6srsA@x1.local>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Mon, Jun 02, 2025 at 11:14:26AM -0400, Peter Xu wrote:
> It makes me feel nervous when we move more thing over to fault mutex - I
> had a feeling it's abused.
> 
> IIRC the fault mutex was inintially introduced only to solve one problem on
> concurrent allocations.  I confess I didn't follow or yet dig into all
> history, though.  From that POV, mfill_atomic_hugetlb() is indeed
> reasonable to still take it because it's user-guided fault injections.  I'm
> not yet sure about other places, e.g., for truncations.

Hi Peter,

taking the mutex for truncation/punching hole was added back in:

 commit b5cec28d36f5ee6b4e6f68a0a40aa1e4045d6d99
 Author: Mike Kravetz <mike.kravetz@oracle.com>
 Date:   Tue Sep 8 15:01:41 2015 -0700
 
     hugetlbfs: truncate_hugepages() takes a range of pages

when the fallocate functionality and the punching-mode were introduced.
E.g:

 commit c672c7f29f2fdb73e1f72911bf499675c81fcdbb
 Author: Mike Kravetz <mike.kravetz@oracle.com>
 Date:   Tue Sep 8 15:01:35 2015 -0700
 
     mm/hugetlb: expose hugetlb fault mutex for use by fallocate
 
     hugetlb page faults are currently synchronized by the table of mutexes
     (htlb_fault_mutex_table).  fallocate code will need to synchronize with
     the page fault code when it allocates or deletes pages.  Expose
     interfaces so that fallocate operations can be synchronized with page
     faults.  Minor name changes to be more consistent with other global
     hugetlb symbols.

Sadly, I cannot really see why it was added.
It was introduced from RFC v2 -> RFC v3:

 RFC v3:
  Folded in patch for alloc_huge_page/hugetlb_reserve_pages race
    in current code
  fallocate allocation and hole punch is synchronized with page
    faults via existing mutex table
   hole punch uses existing hugetlb_vmtruncate_list instead of more
    generic unmap_mapping_range for unmapping
   Error handling for the case when region_del() fauils

But RFC v2 shows no discussions in that matter whatsoever, so go figure
[1].
I read that some tests were written, so I am not sure whether any of
those tests caught a race.

Looking at remove_inode_single_folio, there is a case though:

 /*
  * If folio is mapped, it was faulted in after being
  * unmapped in caller.  Unmap (again) while holding
  * the fault mutex.  The mutex will prevent faults
  * until we finish removing the folio.
  */
	if (unlikely(folio_mapped(folio)))
		hugetlb_unmap_file_folio(h, mapping, folio, index);

So, while the folio_lock that is taken further down guards us against
removing the page from the pagecache, I guess that we need to take the
mutex to guard us against parallel faults for the page.

Looking back at earlier code, we did not handle that race.

It was reworked in

 commit 4aae8d1c051ea00b456da6811bc36d1f69de5445
 Author: Mike Kravetz <mike.kravetz@oracle.com>
 Date:   Fri Jan 15 16:57:40 2016 -0800
 
     mm/hugetlbfs: unmap pages if page fault raced with hole punch

and the comment looked like:

 /*
  * If page is mapped, it was faulted in after being
  * unmapped in caller.  Unmap (again) now after taking
  * the fault mutex.  The mutex will prevent faults
  * until we finish removing the page.
  *
  * This race can only happen in the hole punch case.
  * Getting here in a truncate operation is a bug.
  */

So, it was placed to close the race.
Now, I do not know whether we could close that race somewhat different,
but it seems risky, and having the mutex here seems like a good
trade-off.


> Meanwhile, IIUC this patch can at least be split into more than one, in
> which case the 1st patch should only change the behavior of
> pagecache_folio, rather than the rest - if we really want to move more
> things over to fault mutex, we can do that in the 2nd+ patches.

Fair enough. This RFC was mainly for kicking off a discussion and decide
the direction we want to take.

> I'd suggest we stick with fixing pagecache_folio issue first, which can be
> much easier and looks like a lock ordering issue only (while we can still
> resolve it with removing on lock, but only on pagecache_folio not rest yet).

Yes, I think that that should be enough to determine if we already mapped and cowed the
folio privately.

> > +
> >  /*
> > - * hugetlb_wp() should be called with page lock of the original hugepage held.
> >   * Called with hugetlb_fault_mutex_table held and pte_page locked so we
> >   * cannot race with other handlers or page migration.
> >   * Keep the pte_same checks anyway to make transition from the mutex easier.
> >   */
> > -static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
> > -		       struct vm_fault *vmf)
> > +static vm_fault_t hugetlb_wp(struct vm_fault *vmf, enum cow_context context)
> >  {
> >  	struct vm_area_struct *vma = vmf->vma;
> >  	struct mm_struct *mm = vma->vm_mm;
> >  	const bool unshare = vmf->flags & FAULT_FLAG_UNSHARE;
> >  	pte_t pte = huge_ptep_get(mm, vmf->address, vmf->pte);
> >  	struct hstate *h = hstate_vma(vma);
> > -	struct folio *old_folio;
> > -	struct folio *new_folio;
> >  	bool cow_from_owner = 0;
> >  	vm_fault_t ret = 0;
> >  	struct mmu_notifier_range range;
> > +	struct folio *old_folio, *new_folio, *pagecache_folio;
> > +	struct address_space *mapping = vma->vm_file->f_mapping;
> >  
> >  	/*
> >  	 * Never handle CoW for uffd-wp protected pages.  It should be only
> > @@ -6198,7 +6201,11 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
> >  	 * we run out of free hugetlb folios: we would have to kill processes
> >  	 * in scenarios that used to work. As a side effect, there can still
> >  	 * be leaks between processes, for example, with FOLL_GET users.
> > +	 *
> > +	 * We need to take the lock here because the folio might be undergoing a
> > +	 * migration. e.g: see folio_try_share_anon_rmap_pte.
> >  	 */
> 
> I agree we'd better keep the old_folio locked as of now to be further
> discussed, but I'm not 100% sure about the comment - doesn't migration path
> still need the pgtable lock to modify mapcounts?  I think we hold pgtable
> lock here.

Uhm, yes, looking closer I think you are right.
In hugetlb_fault, prior to call in hugetlb_wp we take the ptl spinlock,
and the migration path also takes it (via page_vma_mapped_walk), so we
should not be seeing any spurious data from hugetlb_remove_rmap, as we
are serialized.

> > +	/*
> > +	 * We can be called from two different contexts: hugetlb_no_page or
> > +	 * hugetlb_fault.
> > +	 * When called from the latter, we try to find the original folio in
> > +	 * the pagecache and compare it against the current folio we have mapped
> > +	 * in the pagetables. If it differs, it means that this process already
> > +	 * CoWed and mapped the folio privately, so we know that a reservation
> > +	 * was already consumed.
> > +	 * This will be latter used to determine whether we need to unmap the folio
> > +	 * from other processes in case we fail to allocate a new folio.
> > +	 */
> > +	if (context == HUGETLB_FAULT_CONTEXT) {
> > +		pagecache_folio = filemap_get_hugetlb_folio(h, mapping, vmf->pgoff);
> > +		if (IS_ERR(pagecache_folio))
> > +			pagecache_folio = NULL;
> > +		else
> > +			folio_put(pagecache_folio);
> 
> So here we released the refcount but then we're referencing the pointer
> below..  I don't know whether this is wise, looks like it's prone to
> races..  If we want, we can compare the folios before releasing the
> refcount.  Said that,...

We are holding the mutex so the folio cannot really go anywhere, but
could folio_put after the check as well.

> > -	if (is_vma_resv_set(vma, HPAGE_RESV_OWNER) &&
> > -			old_folio != pagecache_folio)
> > +	if (context == HUGETLB_FAULT_CONTEXT &&
> > +	    is_vma_resv_set(vma, HPAGE_RESV_OWNER) &&
> > +	    old_folio != pagecache_folio)
> 
> .. here I am actually thinking whether we can use folio_test_anon() and
> completely avoid looking up the page cache.  Here, the ultimate goal is
> trying to know whether this is a CoW on top of a private page.  Then IIUC
> folio_test_anon(old_folio) is enough.

I yet have to fully check, but this sounds reasonable to me.

> >  	new_folio = false;
> > -	folio = filemap_lock_hugetlb_folio(h, mapping, vmf->pgoff);
> > +	folio = filemap_get_hugetlb_folio(h, mapping, vmf->pgoff);
> 
> So this is part of the changes that I mentioned previously, that we should
> avoid doing in one patch; actually I really think we should think twice on
> using fault mutex explicitly for more things.  Actually I tend to go the
> other way round: I used to think whether we can avoid some fault mutex in
> some paths.  E.g. for UFFDIO_COPY it still makes sense to take fault mutex
> because it faces similar challenge of concurrent allocations. However I'm
> not sure about truncate/hole-punch lines.  IIUC most file folios use
> invalidate_lock for that, and I'd think going the other way to use the same
> lock in hugetlb code, then keep fault mutex as minimum used as possible,
> then the semantics of the lock and what it protects are much clearer.

I hear you, but as explained above, I am not entirely sure we can get
rid of the mutex in the truncation/punch-hole path, and if that is the
case, having both the lock and the mutex is definitely an overkill.

I can split up the changes, I have no problem with that.
Moreover, with the fact that we might be able to get away checking for
anon-folio vs pagecache_folio-thingy-we-have-now.

 
Thanks a lot for the feedback Peter! 

-- 
Oscar Salvador
SUSE Labs
