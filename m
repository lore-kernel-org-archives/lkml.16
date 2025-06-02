Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494DD39FF3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 21:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748899829; cv=none; b=gUP/M98nBbJAlffsEEhXm7udDtF7lkTHS0S4pDanDbTzzHizwgfbtonyS+jTHOi7jSNVCLH7JqK1da9rqIrTATG3pbEXboSXx+BA953k6gP4PSTXR7h7EJwEDIrhFLppsvZnv9ZkIRyH/HVwRDifA5zFGs3mw6wANvu3eWKimv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748899829; c=relaxed/simple;
	bh=3LSMAACJ04v9Kxs18M7mbhP1T1oaB1+XYFswevxh+aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7qEk/LO0XIqv4aoklsEm5FzSUZgdMGj7r0XqSK2aYNqEpnws9szErpmPXa27xrnKjqEFCRnPFR1l8Ah+hHIrD/hVtmUUd6FhOJc363KVOdwq+MGZalMpyXyt4UzNcLhYEo8MdyqJLEkBf+AS2crhGaSoY7rzgbOuI2MOExCzBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TME0U3KZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TME0U3KZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748899826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3HiVoEATGk9yjJPR/c/jH6T+zYBxsGP/XpphPmhjYyo=;
	b=TME0U3KZGbO20qnnq3aKW9fmAGs6B8V/VbERQfUCjr4Lx4EN/1y1GNnFQkSUoUJQw8gn5R
	yTNa9vLwqtPB+W1+ixfkaD5i4087DLtqfgsfEW4EBJ5Lmlei0tHm1PFqCP+HahZ/m2G9uy
	qHWSaqz99Mlris6h1jk0SI827K1iAhU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-a0ee5pOVMral46IIQrApHg-1; Mon, 02 Jun 2025 17:30:24 -0400
X-MC-Unique: a0ee5pOVMral46IIQrApHg-1
X-Mimecast-MFC-AGG-ID: a0ee5pOVMral46IIQrApHg_1748899824
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fad387e3d8so61648556d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 14:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748899824; x=1749504624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HiVoEATGk9yjJPR/c/jH6T+zYBxsGP/XpphPmhjYyo=;
        b=WJNaPowoMHj2OTAQW1zhfW6DLoJme+GMGu2IquoDBwGb93v45u+8ZdzSGWi8AEiMtz
         R/mn77MfGtWQVdERz9Xs8nHKr7O247JqT6asvsc4luac70jXejrQ8EAwq8OHu02fiix8
         +ck0irZJ6Wgd6Un5Y4BdgnO+6Hj8C9zDy0IVm+oQvvxZ3ZVB4FS4peOtkm/J6XTpUJ0M
         h9O8msMgRDFbTr7MHab2Kh+/mP/bsx1Cysus4eP8n4jaYM+hZ4Uwaqx8U50jZhpzwkvP
         Etn7vNcagpiLAwCB8QXL2/RhixvsP794C0X66DX+x1kJXnTgTeBrKZqdOYV0SA2XpTcy
         Fqcg==
X-Forwarded-Encrypted: i=1; AJvYcCVG2PWTKoH3bQN7wv5R0PJt29xk0wtTiuh1j+bWSrlTFfB1acCo11nQHwdcG89OHdKtRQsfpnOFm/7hxAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV7YR+1DOqL6fbhrGvjohKVH82BvbTb3QZ3zjDZmQw6zkyEDs/
	NU44cccLpRvvRsyS5Fn16g5W3bO1yyD+p0JjPPnybX5LiH80cqYz25G3c3sZU1TAt5xyMSD6buE
	DNjcTGoKjshn2GB20mhG6JgOmmrvTF44pElkge/bpeK0+VoFFdyW/HD9uO0XQUPg64A==
X-Gm-Gg: ASbGncv1X673KoW5kV1iub4Z2OFBilhyB4IaTKHP40M/hFdD2K8+49d0+qdtArxqmdb
	nhxYOLdn6LUrjgdvlBMJAH6+eCa3AeP/FrgQ2QNc+RWCVPBvtP95EMYop/ue3cN71b6QDTaPWqq
	rEyFpQKYkU1YV70ycZPFPX5/iaLriVS38/kGIyGOlDWMrNy7E9NAfenA+42ph/17ppIK1hjHbqI
	zVCHHhBKeXFOwqhJvbLTBsEQQFi3RDPxVe5L27eY8td74k0zgNS99R+0itUD8eckGR4bXZUVTcV
	TuU=
X-Received: by 2002:ad4:5d49:0:b0:6f5:372f:1c5b with SMTP id 6a1803df08f44-6faeefd6e53mr1832986d6.11.1748899824244;
        Mon, 02 Jun 2025 14:30:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2WVIKGvJNDtRuLqSuYVShpB4u16rtJpkOoMZUeuuX2Ps+Hy/F+P/CpxIcF5X/66u+LVMJ/w==
X-Received: by 2002:ad4:5d49:0:b0:6f5:372f:1c5b with SMTP id 6a1803df08f44-6faeefd6e53mr1832466d6.11.1748899823764;
        Mon, 02 Jun 2025 14:30:23 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e00dcfsm67440526d6.87.2025.06.02.14.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 14:30:23 -0700 (PDT)
Date: Mon, 2 Jun 2025 17:30:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	James Houghton <jthoughton@google.com>,
	Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] mm, hugetlb: Clean up locking in hugetlb_fault
 and hugetlb_wp
Message-ID: <aD4X68QSmrvI4P_D@x1.local>
References: <20250602141610.173698-1-osalvador@suse.de>
 <20250602141610.173698-2-osalvador@suse.de>
 <aD2_0qoh1Os6srsA@x1.local>
 <aD4NyEmRc50OCUBy@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aD4NyEmRc50OCUBy@localhost.localdomain>

On Mon, Jun 02, 2025 at 10:47:04PM +0200, Oscar Salvador wrote:
> On Mon, Jun 02, 2025 at 11:14:26AM -0400, Peter Xu wrote:
> > It makes me feel nervous when we move more thing over to fault mutex - I
> > had a feeling it's abused.
> > 
> > IIRC the fault mutex was inintially introduced only to solve one problem on
> > concurrent allocations.  I confess I didn't follow or yet dig into all
> > history, though.  From that POV, mfill_atomic_hugetlb() is indeed
> > reasonable to still take it because it's user-guided fault injections.  I'm
> > not yet sure about other places, e.g., for truncations.
> 
> Hi Peter,
> 
> taking the mutex for truncation/punching hole was added back in:
> 
>  commit b5cec28d36f5ee6b4e6f68a0a40aa1e4045d6d99
>  Author: Mike Kravetz <mike.kravetz@oracle.com>
>  Date:   Tue Sep 8 15:01:41 2015 -0700
>  
>      hugetlbfs: truncate_hugepages() takes a range of pages
> 
> when the fallocate functionality and the punching-mode were introduced.
> E.g:
> 
>  commit c672c7f29f2fdb73e1f72911bf499675c81fcdbb
>  Author: Mike Kravetz <mike.kravetz@oracle.com>
>  Date:   Tue Sep 8 15:01:35 2015 -0700
>  
>      mm/hugetlb: expose hugetlb fault mutex for use by fallocate
>  
>      hugetlb page faults are currently synchronized by the table of mutexes
>      (htlb_fault_mutex_table).  fallocate code will need to synchronize with
>      the page fault code when it allocates or deletes pages.  Expose
>      interfaces so that fallocate operations can be synchronized with page
>      faults.  Minor name changes to be more consistent with other global
>      hugetlb symbols.
> 
> Sadly, I cannot really see why it was added.
> It was introduced from RFC v2 -> RFC v3:
> 
>  RFC v3:
>   Folded in patch for alloc_huge_page/hugetlb_reserve_pages race
>     in current code
>   fallocate allocation and hole punch is synchronized with page
>     faults via existing mutex table
>    hole punch uses existing hugetlb_vmtruncate_list instead of more
>     generic unmap_mapping_range for unmapping
>    Error handling for the case when region_del() fauils
> 
> But RFC v2 shows no discussions in that matter whatsoever, so go figure
> [1].
> I read that some tests were written, so I am not sure whether any of
> those tests caught a race.
> 
> Looking at remove_inode_single_folio, there is a case though:
> 
>  /*
>   * If folio is mapped, it was faulted in after being
>   * unmapped in caller.  Unmap (again) while holding
>   * the fault mutex.  The mutex will prevent faults
>   * until we finish removing the folio.
>   */
> 	if (unlikely(folio_mapped(folio)))
> 		hugetlb_unmap_file_folio(h, mapping, folio, index);
> 
> So, while the folio_lock that is taken further down guards us against
> removing the page from the pagecache, I guess that we need to take the
> mutex to guard us against parallel faults for the page.
> 
> Looking back at earlier code, we did not handle that race.
> 
> It was reworked in
> 
>  commit 4aae8d1c051ea00b456da6811bc36d1f69de5445
>  Author: Mike Kravetz <mike.kravetz@oracle.com>
>  Date:   Fri Jan 15 16:57:40 2016 -0800
>  
>      mm/hugetlbfs: unmap pages if page fault raced with hole punch
> 
> and the comment looked like:
> 
>  /*
>   * If page is mapped, it was faulted in after being
>   * unmapped in caller.  Unmap (again) now after taking
>   * the fault mutex.  The mutex will prevent faults
>   * until we finish removing the page.
>   *
>   * This race can only happen in the hole punch case.
>   * Getting here in a truncate operation is a bug.
>   */
> 
> So, it was placed to close the race.
> Now, I do not know whether we could close that race somewhat different,
> but it seems risky, and having the mutex here seems like a good
> trade-off.

Right, and thanks for the git digging as usual.  I would agree hugetlb is
more challenge than many other modules on git archaeology. :)

Even if I mentioned the invalidate_lock, I don't think I thought deeper
than that. I just wished whenever possible we still move hugetlb code
closer to generic code, so if that's the goal we may still want to one day
have a closer look at whether hugetlb can also use invalidate_lock.  Maybe
it isn't worthwhile at last: invalidate_lock is currently a rwsem, which
normally at least allows concurrent fault, but that's currently what isn't
allowed in hugetlb anyway..

If we start to remove finer grained locks that work will be even harder,
and removing folio lock in this case in fault path also brings hugetlbfs
even further from other file systems.  That might be slightly against what
we used to wish to do, which is to make it closer to others.  Meanwhile I'm
also not yet sure the benefit of not taking folio lock all across, e.g. I
don't expect perf would change at all even if lock is avoided.  We may want
to think about that too when doing so.

> 
> 
> > Meanwhile, IIUC this patch can at least be split into more than one, in
> > which case the 1st patch should only change the behavior of
> > pagecache_folio, rather than the rest - if we really want to move more
> > things over to fault mutex, we can do that in the 2nd+ patches.
> 
> Fair enough. This RFC was mainly for kicking off a discussion and decide
> the direction we want to take.
> 
> > I'd suggest we stick with fixing pagecache_folio issue first, which can be
> > much easier and looks like a lock ordering issue only (while we can still
> > resolve it with removing on lock, but only on pagecache_folio not rest yet).
> 
> Yes, I think that that should be enough to determine if we already mapped and cowed the
> folio privately.
> 
> > > +
> > >  /*
> > > - * hugetlb_wp() should be called with page lock of the original hugepage held.
> > >   * Called with hugetlb_fault_mutex_table held and pte_page locked so we
> > >   * cannot race with other handlers or page migration.
> > >   * Keep the pte_same checks anyway to make transition from the mutex easier.
> > >   */
> > > -static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
> > > -		       struct vm_fault *vmf)
> > > +static vm_fault_t hugetlb_wp(struct vm_fault *vmf, enum cow_context context)
> > >  {
> > >  	struct vm_area_struct *vma = vmf->vma;
> > >  	struct mm_struct *mm = vma->vm_mm;
> > >  	const bool unshare = vmf->flags & FAULT_FLAG_UNSHARE;
> > >  	pte_t pte = huge_ptep_get(mm, vmf->address, vmf->pte);
> > >  	struct hstate *h = hstate_vma(vma);
> > > -	struct folio *old_folio;
> > > -	struct folio *new_folio;
> > >  	bool cow_from_owner = 0;
> > >  	vm_fault_t ret = 0;
> > >  	struct mmu_notifier_range range;
> > > +	struct folio *old_folio, *new_folio, *pagecache_folio;
> > > +	struct address_space *mapping = vma->vm_file->f_mapping;
> > >  
> > >  	/*
> > >  	 * Never handle CoW for uffd-wp protected pages.  It should be only
> > > @@ -6198,7 +6201,11 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
> > >  	 * we run out of free hugetlb folios: we would have to kill processes
> > >  	 * in scenarios that used to work. As a side effect, there can still
> > >  	 * be leaks between processes, for example, with FOLL_GET users.
> > > +	 *
> > > +	 * We need to take the lock here because the folio might be undergoing a
> > > +	 * migration. e.g: see folio_try_share_anon_rmap_pte.
> > >  	 */
> > 
> > I agree we'd better keep the old_folio locked as of now to be further
> > discussed, but I'm not 100% sure about the comment - doesn't migration path
> > still need the pgtable lock to modify mapcounts?  I think we hold pgtable
> > lock here.
> 
> Uhm, yes, looking closer I think you are right.
> In hugetlb_fault, prior to call in hugetlb_wp we take the ptl spinlock,
> and the migration path also takes it (via page_vma_mapped_walk), so we
> should not be seeing any spurious data from hugetlb_remove_rmap, as we
> are serialized.
> 
> > > +	/*
> > > +	 * We can be called from two different contexts: hugetlb_no_page or
> > > +	 * hugetlb_fault.
> > > +	 * When called from the latter, we try to find the original folio in
> > > +	 * the pagecache and compare it against the current folio we have mapped
> > > +	 * in the pagetables. If it differs, it means that this process already
> > > +	 * CoWed and mapped the folio privately, so we know that a reservation
> > > +	 * was already consumed.
> > > +	 * This will be latter used to determine whether we need to unmap the folio
> > > +	 * from other processes in case we fail to allocate a new folio.
> > > +	 */
> > > +	if (context == HUGETLB_FAULT_CONTEXT) {
> > > +		pagecache_folio = filemap_get_hugetlb_folio(h, mapping, vmf->pgoff);
> > > +		if (IS_ERR(pagecache_folio))
> > > +			pagecache_folio = NULL;
> > > +		else
> > > +			folio_put(pagecache_folio);
> > 
> > So here we released the refcount but then we're referencing the pointer
> > below..  I don't know whether this is wise, looks like it's prone to
> > races..  If we want, we can compare the folios before releasing the
> > refcount.  Said that,...
> 
> We are holding the mutex so the folio cannot really go anywhere, but
> could folio_put after the check as well.
> 
> > > -	if (is_vma_resv_set(vma, HPAGE_RESV_OWNER) &&
> > > -			old_folio != pagecache_folio)
> > > +	if (context == HUGETLB_FAULT_CONTEXT &&
> > > +	    is_vma_resv_set(vma, HPAGE_RESV_OWNER) &&
> > > +	    old_folio != pagecache_folio)
> > 
> > .. here I am actually thinking whether we can use folio_test_anon() and
> > completely avoid looking up the page cache.  Here, the ultimate goal is
> > trying to know whether this is a CoW on top of a private page.  Then IIUC
> > folio_test_anon(old_folio) is enough.
> 
> I yet have to fully check, but this sounds reasonable to me.
> 
> > >  	new_folio = false;
> > > -	folio = filemap_lock_hugetlb_folio(h, mapping, vmf->pgoff);
> > > +	folio = filemap_get_hugetlb_folio(h, mapping, vmf->pgoff);
> > 
> > So this is part of the changes that I mentioned previously, that we should
> > avoid doing in one patch; actually I really think we should think twice on
> > using fault mutex explicitly for more things.  Actually I tend to go the
> > other way round: I used to think whether we can avoid some fault mutex in
> > some paths.  E.g. for UFFDIO_COPY it still makes sense to take fault mutex
> > because it faces similar challenge of concurrent allocations. However I'm
> > not sure about truncate/hole-punch lines.  IIUC most file folios use
> > invalidate_lock for that, and I'd think going the other way to use the same
> > lock in hugetlb code, then keep fault mutex as minimum used as possible,
> > then the semantics of the lock and what it protects are much clearer.
> 
> I hear you, but as explained above, I am not entirely sure we can get
> rid of the mutex in the truncation/punch-hole path, and if that is the
> case, having both the lock and the mutex is definitely an overkill.
> 
> I can split up the changes, I have no problem with that.

Thanks!  I hope that'll also help whatever patch to land sooner, after it
can be verified to fix the issue.

-- 
Peter Xu

