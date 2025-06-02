Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5792B21CA07
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877277; cv=none; b=Y3RsWMx0kD9GNyY1eb1YkN6cmFI5AaoC73GjXe8BvUFi9e37d6cn1i1HVgMTkh8JvjP+d+0XNcy660aD4XwleQBYanRxPCt6k8AfWM2/J650u1gKgW00W9CUOaSO+zr2EtmZmwq0CLI+vPXTXuTFCjW/l46JLLS45MkYQJE/PgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877277; c=relaxed/simple;
	bh=O5bge+SDk6PCcqQF22CoDc0e8+Q69NZO2o3gGk1USVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEkqGs6jklGHpX1d7MOztHXHSYZ5nr5D68HjKivLNKYu0kGsTCEyysvxCgXcTfb95TQ3xeMo9dUg2wzHYQ1C2ynZavvNbGMi+IqRn7vxRO44FohSS5y9F6MlPr5f89bOvfWpLTtP9c4rtaetHdmMat0FPR5gR5yPPPZk5ES2e1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fEtXEZ15; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fEtXEZ15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748877273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ThzW1Ubdi402He3QCoopikqFRdmT8syx/Zsd2dxkIo=;
	b=fEtXEZ15FXja8m4zSx1uwgUpPLJ7tnZwYQDJ56hb3zrwFrMYhD5ixcM+eBnIvKWDfkzziM
	jsiEod9FXm41eejJnKxtKmvb3HdSVsdi5miX884kNfRjvpd4uhHEdFyzAGGSbl5OsHNRoB
	LNkr6dML5gKA/ZnsuCWjnyLfCH6ggUk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-VTHG3OeWPraSQt7Z5jMxOg-1; Mon, 02 Jun 2025 11:14:32 -0400
X-MC-Unique: VTHG3OeWPraSQt7Z5jMxOg-1
X-Mimecast-MFC-AGG-ID: VTHG3OeWPraSQt7Z5jMxOg_1748877271
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a58bbd1848so19995051cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 08:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877271; x=1749482071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ThzW1Ubdi402He3QCoopikqFRdmT8syx/Zsd2dxkIo=;
        b=NJUPRqy99tfNU6TeXbKy0rZnt2p+AzO+fHcJGr/coZFCC+F5cKsAorLjffI3KUi6JP
         CECeZfuKx98P5pVyxHVLadeqV0VGCwcR4faNB1i/ngU97vWlxD1RFC1VGz0rouT3H5AD
         oWdK/808bfL/sEwLRilLYDo+X+5LWrQGdRBvp6X0RxbwKijDaDPzGARCOFjTd+Nt14Ml
         TGV9CJijdnz2snL1lfC28/4c+hiCHksSZXLPgHNNxDrVoqVd6TU6CZb9uUDnb/tCjWBe
         VOBXv1+MM2++e4McaSqxZPjp3qWRYJvGFwHAD5e4oAJxQKXE+Fq3T/lSPoL+4AxbBIZu
         OMTg==
X-Forwarded-Encrypted: i=1; AJvYcCUg6/m1J90a0yH077r0lQE4NEFrG8ECBl2iTsTGIv3iUKfQ4UoEqeDezbxVk9AjjHgy+xhsKol8l2Urz94=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCMkwJIPzXSJ+KHmstZQ0eflUrRh3y0LF16hZDVg19ftazE570
	LnTFltkRlUaLcGsYOSoNiyuPgpegt7xMj+BOGcj/M/PMZ18Uf0njCpz9TW1BdN2B6b2bU/YO5IJ
	0Nb8S6ZJzGR3Ekmi4YEdeCJwE7KZ7ScPwFW1/bPOGsrVumrcMBtarAUCWJXC+CUPMLg==
X-Gm-Gg: ASbGncvYH2aJ2EnYIoufPkKDCRsDqwJCCRRfbtghiYwfntlRdGXb9S/vdpYwiZyPpi0
	Bna6YIAc5vCQjIFdoc7fK9d168ovD3/7ccaqCv3ia3E7Pp94bceEAoMD+LvkxR5qmDBaYwy6qEZ
	z63T9g4t7fKelEQYTSoVO1ohaXSHpaCDa2gV0zzOg7nU+vuEK8yLNsjQczAYadtJxhMe4PfFB0H
	n6xfK17AD3zI6BkSdlpP2YAOcFrd2TojEkWj0s2XoAEksihr52huDK1N0XZ+/dHTPPcI0V/7v/y
	hfw/cJu5NMjiXQ==
X-Received: by 2002:a05:622a:4814:b0:4a1:356:5e7b with SMTP id d75a77b69052e-4a4400105c6mr219969001cf.1.1748877271083;
        Mon, 02 Jun 2025 08:14:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz1URhD3YMazqjYpxSqcd+3AQimx3TjsS2M102nstSUj62dc2PfNtXEQXawJvViY65NWxMNQ==
X-Received: by 2002:a05:622a:4814:b0:4a1:356:5e7b with SMTP id d75a77b69052e-4a4400105c6mr219968321cf.1.1748877270496;
        Mon, 02 Jun 2025 08:14:30 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a7f637sm56445801cf.72.2025.06.02.08.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:14:29 -0700 (PDT)
Date: Mon, 2 Jun 2025 11:14:26 -0400
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
Message-ID: <aD2_0qoh1Os6srsA@x1.local>
References: <20250602141610.173698-1-osalvador@suse.de>
 <20250602141610.173698-2-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602141610.173698-2-osalvador@suse.de>

On Mon, Jun 02, 2025 at 04:16:08PM +0200, Oscar Salvador wrote:
> Recent events surfaced the fact that it is not clear why are we taking
> certain locks in the hugetlb faulting path.
> More specifically pagecache_folio's lock and folio lock in hugetlb_fault,
> and folio lock in hugetlb_no_page.
> 
> When digging in the history, I saw that those locks were taken to protect
> us against truncation, which back then was not serialized with the
> hugetlb_fault_mutex as it is today.
> 
> For example, the lock in hugetlb_no_page, looking at the comment above:
> 
>  /*
>   * Use page lock to guard against racing truncation
>   * before we get page_table_lock.
>   */
>  new_folio = false;
>  folio = filemap_lock_hugetlb_folio(h, mapping, vmf->pgoff);
> 
> which was added by 'commit 4c8872659772 ("[PATCH] hugetlb: demand fault handler")'.
> Back when that commit was added (2025), truncate_hugepages looked something like:
> 
>  truncate_hugepages
>   lock_page(page)
>    truncate_huge_page(page) <- it also removed it from the pagecache
>   unlock_page(page)
> 
> While today we have
> 
>  remove_inode_hugepages
>   mutex_lock(&hugetlb_fault_mutex_table[hash])
>    remove_inode_single_folio
>     folio_lock(folio)
>      hugetlb_delete_from_page_cache
>     folio_unlock
>   mutex_unlock(&hugetlb_fault_mutex_table[hash])
> 
> And the same happened with the lock for pagecache_folio in hugetlb_fault(),
> which was introduced in 'commit 04f2cbe35699 ("hugetlb: guarantee that COW
> faults for a process that called mmap(MAP_PRIVATE) on hugetlbfs will succeed")',
> when we did not have serialization against truncation yet.
> 
> The only worrisome part of dropping the locks that I considered is when
> cow_from_owner is true and we cannot allocate another hugetlb page, because then
> we drop all the locks, try to unmap the page from the other processes, and then
> we re-take the locks again.
> 
>         hash = hugetlb_fault_mutex_hash(mapping, idx);
>         hugetlb_vma_unlock_read(vma);
>         mutex_unlock(&hugetlb_fault_mutex_table[hash]);
> 
>         unmap_ref_private(mm, vma, &old_folio->page,
>                         vmf->address);
> 
>         mutex_lock(&hugetlb_fault_mutex_table[hash]);
>         hugetlb_vma_lock_read(vma);
>         spin_lock(vmf->ptl);
> 
> So, there is a small window where we are not holding the lock.
> 
> In this window, someone might have truncated the file (aka pagecache_folio),
> and call hugetlb_unreserve_pages().
> But I do not think it matters for the following reasons
> 1) we only retry in case the pte has not changed, which means that old_folio
>    still is old_folio.
> 2) And if the original file got truncated in that window and reserves were
>    adjusted, alloc_hugetlb_folio() will catch this under the lock when we
>    retry again.
> 
> Another concern was brought up by James Houghton, about UFFDIO_CONTINUE
> case, and whether we could end up mapping a hugetlb page which has not been
> zeroed yet.
> But mfill_atomic_hugetlb(), which calls hugetlb_mfill_atomic_pte(), holds the
> mutex throughout the operation, so we cannot race with truncation/instantiation
> either.
> 
> E.g: hugetlbfs_fallocate() will allocate the new hugetlb folio and zero it under
> the mutex.

It makes me feel nervous when we move more thing over to fault mutex - I
had a feeling it's abused.

IIRC the fault mutex was inintially introduced only to solve one problem on
concurrent allocations.  I confess I didn't follow or yet dig into all
history, though.  From that POV, mfill_atomic_hugetlb() is indeed
reasonable to still take it because it's user-guided fault injections.  I'm
not yet sure about other places, e.g., for truncations.

Meanwhile, IIUC this patch can at least be split into more than one, in
which case the 1st patch should only change the behavior of
pagecache_folio, rather than the rest - if we really want to move more
things over to fault mutex, we can do that in the 2nd+ patches.

I'd suggest we stick with fixing pagecache_folio issue first, which can be
much easier and looks like a lock ordering issue only (while we can still
resolve it with removing on lock, but only on pagecache_folio not rest yet).

> 
> So, there should be no races.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> ---
>  include/linux/hugetlb.h | 12 +++++
>  mm/hugetlb.c            | 98 ++++++++++++++++++-----------------------
>  2 files changed, 55 insertions(+), 55 deletions(-)
> 
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 42f374e828a2..a176724e1204 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -811,6 +811,12 @@ static inline unsigned int blocks_per_huge_page(struct hstate *h)
>  	return huge_page_size(h) / 512;
>  }
>  
> +static inline struct folio *filemap_get_hugetlb_folio(struct hstate *h,
> +				struct address_space *mapping, pgoff_t idx)
> +{
> +	return filemap_get_folio(mapping, idx << huge_page_order(h));
> +}
> +
>  static inline struct folio *filemap_lock_hugetlb_folio(struct hstate *h,
>  				struct address_space *mapping, pgoff_t idx)
>  {
> @@ -1088,6 +1094,12 @@ static inline struct hugepage_subpool *hugetlb_folio_subpool(struct folio *folio
>  	return NULL;
>  }
>  
> +static inline struct folio *filemap_get_hugetlb_folio(struct hstate *h,
> +				struct address_space *mapping, pgoff_t idx)
> +{
> +	return NULL;
> +}
> +
>  static inline struct folio *filemap_lock_hugetlb_folio(struct hstate *h,
>  				struct address_space *mapping, pgoff_t idx)
>  {
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 8746ed2fec13..f7bef660ef94 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6146,25 +6146,28 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
>  	i_mmap_unlock_write(mapping);
>  }
>  
> +enum cow_context {
> +	HUGETLB_FAULT_CONTEXT,
> +	HUGETLB_NO_PAGE_CONTEXT,
> +};

I'm not sure this is required, looks like currently it's needed only
because we want to detect whether pagecache folio matched.

More below.

> +
>  /*
> - * hugetlb_wp() should be called with page lock of the original hugepage held.
>   * Called with hugetlb_fault_mutex_table held and pte_page locked so we
>   * cannot race with other handlers or page migration.
>   * Keep the pte_same checks anyway to make transition from the mutex easier.
>   */
> -static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
> -		       struct vm_fault *vmf)
> +static vm_fault_t hugetlb_wp(struct vm_fault *vmf, enum cow_context context)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct mm_struct *mm = vma->vm_mm;
>  	const bool unshare = vmf->flags & FAULT_FLAG_UNSHARE;
>  	pte_t pte = huge_ptep_get(mm, vmf->address, vmf->pte);
>  	struct hstate *h = hstate_vma(vma);
> -	struct folio *old_folio;
> -	struct folio *new_folio;
>  	bool cow_from_owner = 0;
>  	vm_fault_t ret = 0;
>  	struct mmu_notifier_range range;
> +	struct folio *old_folio, *new_folio, *pagecache_folio;
> +	struct address_space *mapping = vma->vm_file->f_mapping;
>  
>  	/*
>  	 * Never handle CoW for uffd-wp protected pages.  It should be only
> @@ -6198,7 +6201,11 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
>  	 * we run out of free hugetlb folios: we would have to kill processes
>  	 * in scenarios that used to work. As a side effect, there can still
>  	 * be leaks between processes, for example, with FOLL_GET users.
> +	 *
> +	 * We need to take the lock here because the folio might be undergoing a
> +	 * migration. e.g: see folio_try_share_anon_rmap_pte.
>  	 */

I agree we'd better keep the old_folio locked as of now to be further
discussed, but I'm not 100% sure about the comment - doesn't migration path
still need the pgtable lock to modify mapcounts?  I think we hold pgtable
lock here.

> +	folio_lock(old_folio);
>  	if (folio_mapcount(old_folio) == 1 && folio_test_anon(old_folio)) {
>  		if (!PageAnonExclusive(&old_folio->page)) {
>  			folio_move_anon_rmap(old_folio, vma);
> @@ -6209,22 +6216,44 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
>  						     vmf->pte);
>  
>  		delayacct_wpcopy_end();
> +		folio_unlock(old_folio);
>  		return 0;
>  	}
>  	VM_BUG_ON_PAGE(folio_test_anon(old_folio) &&
>  		       PageAnonExclusive(&old_folio->page), &old_folio->page);
> +	folio_unlock(old_folio);
> +
>  
> +	/*
> +	 * We can be called from two different contexts: hugetlb_no_page or
> +	 * hugetlb_fault.
> +	 * When called from the latter, we try to find the original folio in
> +	 * the pagecache and compare it against the current folio we have mapped
> +	 * in the pagetables. If it differs, it means that this process already
> +	 * CoWed and mapped the folio privately, so we know that a reservation
> +	 * was already consumed.
> +	 * This will be latter used to determine whether we need to unmap the folio
> +	 * from other processes in case we fail to allocate a new folio.
> +	 */
> +	if (context == HUGETLB_FAULT_CONTEXT) {
> +		pagecache_folio = filemap_get_hugetlb_folio(h, mapping, vmf->pgoff);
> +		if (IS_ERR(pagecache_folio))
> +			pagecache_folio = NULL;
> +		else
> +			folio_put(pagecache_folio);

So here we released the refcount but then we're referencing the pointer
below..  I don't know whether this is wise, looks like it's prone to
races..  If we want, we can compare the folios before releasing the
refcount.  Said that,...

> +	}
>  	/*
>  	 * If the process that created a MAP_PRIVATE mapping is about to
>  	 * perform a COW due to a shared page count, attempt to satisfy
>  	 * the allocation without using the existing reserves. The pagecache
> -	 * page is used to determine if the reserve at this address was
> +	 * folio is used to determine if the reserve at this address was already
>  	 * consumed or not. If reserves were used, a partial faulted mapping
>  	 * at the time of fork() could consume its reserves on COW instead
>  	 * of the full address range.
>  	 */
> -	if (is_vma_resv_set(vma, HPAGE_RESV_OWNER) &&
> -			old_folio != pagecache_folio)
> +	if (context == HUGETLB_FAULT_CONTEXT &&
> +	    is_vma_resv_set(vma, HPAGE_RESV_OWNER) &&
> +	    old_folio != pagecache_folio)

.. here I am actually thinking whether we can use folio_test_anon() and
completely avoid looking up the page cache.  Here, the ultimate goal is
trying to know whether this is a CoW on top of a private page.  Then IIUC
folio_test_anon(old_folio) is enough.

>  		cow_from_owner = true;
>  
>  	folio_get(old_folio);
> @@ -6245,7 +6274,6 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
>  		 * may get SIGKILLed if it later faults.
>  		 */
>  		if (cow_from_owner) {
> -			struct address_space *mapping = vma->vm_file->f_mapping;
>  			pgoff_t idx;
>  			u32 hash;
>  
> @@ -6451,11 +6479,11 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>  	}
>  
>  	/*
> -	 * Use page lock to guard against racing truncation
> -	 * before we get page_table_lock.
> +	 * hugetlb_fault_mutex_table guards us against truncation,
> +	 * so we do not need to take locks on the folio.
>  	 */
>  	new_folio = false;
> -	folio = filemap_lock_hugetlb_folio(h, mapping, vmf->pgoff);
> +	folio = filemap_get_hugetlb_folio(h, mapping, vmf->pgoff);

So this is part of the changes that I mentioned previously, that we should
avoid doing in one patch; actually I really think we should think twice on
using fault mutex explicitly for more things.  Actually I tend to go the
other way round: I used to think whether we can avoid some fault mutex in
some paths.  E.g. for UFFDIO_COPY it still makes sense to take fault mutex
because it faces similar challenge of concurrent allocations. However I'm
not sure about truncate/hole-punch lines.  IIUC most file folios use
invalidate_lock for that, and I'd think going the other way to use the same
lock in hugetlb code, then keep fault mutex as minimum used as possible,
then the semantics of the lock and what it protects are much clearer.

Thanks,

>  	if (IS_ERR(folio)) {
>  		size = i_size_read(mapping->host) >> huge_page_shift(h);
>  		if (vmf->pgoff >= size)
> @@ -6521,6 +6549,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>  		if (vma->vm_flags & VM_MAYSHARE) {
>  			int err = hugetlb_add_to_page_cache(folio, mapping,
>  							vmf->pgoff);
> +			folio_unlock(folio);
>  			if (err) {
>  				/*
>  				 * err can't be -EEXIST which implies someone
> @@ -6537,7 +6566,6 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>  			}
>  			new_pagecache_folio = true;
>  		} else {
> -			folio_lock(folio);
>  			anon_rmap = 1;
>  		}
>  	} else {
> @@ -6603,7 +6631,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>  	hugetlb_count_add(pages_per_huge_page(h), mm);
>  	if ((vmf->flags & FAULT_FLAG_WRITE) && !(vma->vm_flags & VM_SHARED)) {
>  		/* Optimization, do the COW without a second fault */
> -		ret = hugetlb_wp(folio, vmf);
> +		ret = hugetlb_wp(vmf, HUGETLB_NO_PAGE_CONTEXT);
>  	}
>  
>  	spin_unlock(vmf->ptl);
> @@ -6615,8 +6643,6 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>  	 */
>  	if (new_folio)
>  		folio_set_hugetlb_migratable(folio);
> -
> -	folio_unlock(folio);
>  out:
>  	hugetlb_vma_unlock_read(vma);
>  
> @@ -6636,7 +6662,6 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>  	if (new_folio && !new_pagecache_folio)
>  		restore_reserve_on_error(h, vma, vmf->address, folio);
>  
> -	folio_unlock(folio);
>  	folio_put(folio);
>  	goto out;
>  }
> @@ -6671,7 +6696,6 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>  	vm_fault_t ret;
>  	u32 hash;
>  	struct folio *folio = NULL;
> -	struct folio *pagecache_folio = NULL;
>  	struct hstate *h = hstate_vma(vma);
>  	struct address_space *mapping;
>  	int need_wait_lock = 0;
> @@ -6780,11 +6804,6 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>  		}
>  		/* Just decrements count, does not deallocate */
>  		vma_end_reservation(h, vma, vmf.address);
> -
> -		pagecache_folio = filemap_lock_hugetlb_folio(h, mapping,
> -							     vmf.pgoff);
> -		if (IS_ERR(pagecache_folio))
> -			pagecache_folio = NULL;
>  	}
>  
>  	vmf.ptl = huge_pte_lock(h, mm, vmf.pte);
> @@ -6798,10 +6817,6 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>  	    (flags & FAULT_FLAG_WRITE) && !huge_pte_write(vmf.orig_pte)) {
>  		if (!userfaultfd_wp_async(vma)) {
>  			spin_unlock(vmf.ptl);
> -			if (pagecache_folio) {
> -				folio_unlock(pagecache_folio);
> -				folio_put(pagecache_folio);
> -			}
>  			hugetlb_vma_unlock_read(vma);
>  			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
>  			return handle_userfault(&vmf, VM_UFFD_WP);
> @@ -6813,23 +6828,12 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>  		/* Fallthrough to CoW */
>  	}
>  
> -	/*
> -	 * hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) and
> -	 * pagecache_folio, so here we need take the former one
> -	 * when folio != pagecache_folio or !pagecache_folio.
> -	 */
>  	folio = page_folio(pte_page(vmf.orig_pte));
> -	if (folio != pagecache_folio)
> -		if (!folio_trylock(folio)) {
> -			need_wait_lock = 1;
> -			goto out_ptl;
> -		}
> -
>  	folio_get(folio);
>  
>  	if (flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
>  		if (!huge_pte_write(vmf.orig_pte)) {
> -			ret = hugetlb_wp(pagecache_folio, &vmf);
> +			ret = hugetlb_wp(&vmf, HUGETLB_FAULT_CONTEXT);
>  			goto out_put_page;
>  		} else if (likely(flags & FAULT_FLAG_WRITE)) {
>  			vmf.orig_pte = huge_pte_mkdirty(vmf.orig_pte);
> @@ -6840,16 +6844,9 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>  						flags & FAULT_FLAG_WRITE))
>  		update_mmu_cache(vma, vmf.address, vmf.pte);
>  out_put_page:
> -	if (folio != pagecache_folio)
> -		folio_unlock(folio);
>  	folio_put(folio);
>  out_ptl:
>  	spin_unlock(vmf.ptl);
> -
> -	if (pagecache_folio) {
> -		folio_unlock(pagecache_folio);
> -		folio_put(pagecache_folio);
> -	}
>  out_mutex:
>  	hugetlb_vma_unlock_read(vma);
>  
> @@ -6861,15 +6858,6 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>  		vma_end_read(vma);
>  
>  	mutex_unlock(&hugetlb_fault_mutex_table[hash]);
> -	/*
> -	 * Generally it's safe to hold refcount during waiting page lock. But
> -	 * here we just wait to defer the next page fault to avoid busy loop and
> -	 * the page is not used after unlocked before returning from the current
> -	 * page fault. So we are safe from accessing freed page, even if we wait
> -	 * here without taking refcount.
> -	 */
> -	if (need_wait_lock)
> -		folio_wait_locked(folio);
>  	return ret;
>  }
>  
> -- 
> 2.49.0
> 

-- 
Peter Xu

